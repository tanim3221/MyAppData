import requests
from bs4 import BeautifulSoup

url = "https://exam.icab.org.bd/api/v1/"

response = requests.get(url, verify=False)

if response.status_code == 200:
    soup = BeautifulSoup(response.text, "html.parser")
    folder_names = []

    for a_tag in soup.find_all('a'):
        href = a_tag.get('href')
        # Exclude parent directory links and any other links that aren't directories
        if href != '../' and href.endswith('/'):
            folder_names.append(href)

    for folder in folder_names:
        print(folder)
else:
    print(f"Failed to retrieve data. Status code: {response.status_code}")
