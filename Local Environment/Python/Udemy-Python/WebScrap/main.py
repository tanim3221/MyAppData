from bs4 import BeautifulSoup
import requests

res = requests.get("https://news.ycombinator.com/")
web_data = res.text

soup = BeautifulSoup(web_data, "html.parser")
articles = soup.find_all(class_="titleline")

article_text = []
article_link = []
article_point = []

for article in articles:
    a = article.find("a")
    text = a.getText()
    link = a.get("href")
    article_link.append(link)
    article_text.append(text)


for score in soup.find_all(name="span", class_='score'):
    point = int(score.getText().split(" ")[0])
    article_point.append(point)   

largest_number = max(article_point)
largest_index = article_point.index(largest_number)+1

print(article_text[largest_index])
print(article_link[largest_index])
print(article_point)
