import requests
from bs4 import BeautifulSoup
import spotipy
from spotipy.oauth2 import SpotifyOAuth
import json
from pprint import pprint

date = input("Which year do you want to travel to? Type the date in this format YYYY-MM-DD: ")

URL = f"https://www.billboard.com/charts/india-songs-hotw/{date}/"
TITLE = "title-of-a-story"

CLIENT_ID = "ab27d12c0e734ad2bd163260e22df9ea"
CLIENT_SECRET = "847252410bb44ac4b3d92a1d175c4eeb"

res = requests.get(URL)
web_data = res.text

soup = BeautifulSoup(web_data,"html.parser")
song_div = soup.find_all(class_="o-chart-results-list-row-container")

song_title_list = []

for title in song_div:
    song_titles = title.find_all(name="h3", id=TITLE)
    for song_title in song_titles:
        song_title_list.append(song_title.getText().strip())


sp = spotipy.Spotify(
    auth_manager=SpotifyOAuth(
        scope="playlist-modify-private",
        redirect_uri="http://example.com",
        client_id=CLIENT_ID,
        client_secret=CLIENT_SECRET,
        show_dialog=True,
        cache_path="token.txt",
        username="Saklayen 3"

    )
)

user_info = sp.current_user()

if user_info:
    display_name = user_info["display_name"]
    user_id = user_info['id']
    print(f"*** Authenticated as {display_name} ({user_id}) ***")
else:
    print("Unable to retrieve user information.")

song_uris= []

for song in song_title_list:
    result = sp.search(q=f"track:{song} year:2023", type="track")
    try:
        uri = result["tracks"]['items'][0]["uri"]
        song_id = result["tracks"]['items'][0]["id"]
        song_url = f"https://open.spotify.com/track/{song_id}"
        song_uris.append(uri)
    except IndexError:
        pass
        # print(f"{song} doesn't exist in Spotify. Skipped.")

playlist = sp.user_playlist_create(user=user_id,name=f"Python song {date}", public=False)
sp.playlist_add_items(playlist_id=playlist["id"], items=song_uris)
playlist_name = playlist['name']
external_urls = playlist['external_urls']['spotify']
print(f"playlist: {playlist_name}\nplaylist_url: {external_urls}")