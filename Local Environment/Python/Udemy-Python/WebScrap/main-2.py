import requests
from bs4 import BeautifulSoup

URL = "https://www.empireonline.com/movies/features/best-movies-2/"

res =  requests.get(URL)
web_data = res.text

soup = BeautifulSoup(web_data,"html.parser")

# print(soup.prettify())


get_title = soup.find_all(name="h3", class_="listicleItem_listicle-item__title__BfenH")

movie_title = [movie.getText() for movie in get_title]
movies = movie_title[::-1]

with open("./movies.txt", mode="w") as file:
    for movie in movies:
        file.write(f"{movie}\n")