from bs4 import BeautifulSoup

with open("./website.html", encoding="utf-8")  as file:
    contents = file.read()

soup = BeautifulSoup(contents,'html.parser')

data = soup.find_all(name="a")

for tag in data:
    # print(tag.getText())
    print(tag.get("href"))

heading = soup.find(name="h1",id="name")
print(heading)

section = soup.find(name="h3", class_="heading")
print(section.get("class"))

url = soup.select_one(selector="p a")
print(url)

name = soup.select_one(selector="#name")
print(name)

headings = soup.select(".heading")
print(headings)

all_a = soup.find_all("a")
print(all_a)
all_a2 = soup.find_all(name="a")
print(all_a2)