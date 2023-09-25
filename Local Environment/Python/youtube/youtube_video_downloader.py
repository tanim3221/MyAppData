from pytube import Playlist, YouTube

url = input("\nEnter youtube playlist/video url: ")

if "playlist?list=" in url:  # Check if the URL is a playlist
    playlist = Playlist(url)
    
    for video in playlist.videos:
        audio_stream = video.streams.filter(only_audio=True).first()  # get the highest quality audio stream
        print(f"Downloading {video.title}...")
        audio_stream.download()  # downloads in the current directory

    print("All audio downloads complete!")

elif "watch?v=" in url:  # Check if the URL is a video
    video = YouTube(url)
    audio_stream = video.streams.filter(only_audio=True).first()
    print(f"Downloading {video.title}...")
    audio_stream.download()
    print("Audio download complete!")

else:
    print("Invalid YouTube URL!")
