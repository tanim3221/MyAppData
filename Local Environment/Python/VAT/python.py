import json
from datetime import datetime

from bs4 import BeautifulSoup

# 1. Load the HTML from a .html file.
with open('h5.html', 'r', encoding='utf-8') as file:
    html_content = file.read()

# 2. Parse the HTML using BeautifulSoup.
soup = BeautifulSoup(html_content, 'html.parser')

# 3. Extract the desired text.
elements = soup.select('.feed-shared-update-v2__commentary')
data = []

for index, element in enumerate(elements):
    spans = element.find_all('span')
    
    # Check if the 2nd span exists, if so, extract the text.
    if len(spans) > 1:
        details = spans[1].text.strip()  # Trim the text

        # Clean the text further if required, e.g., replace multiple spaces with a single space
        details = ' '.join(details.split())

        # 4. Store the results with auto-numbering.
        data.append({
            'id': index + 1,  # Auto-numbering
            'details': details
        })

# Generate a filename with the current timestamp
current_time = datetime.now().strftime('%Y%m%d%H%M%S')  # Format: YYYYMMDDHHMMSS
file_name = f"{current_time}.json"

# Save data to a JSON file with the timestamped filename
with open(file_name, 'w', encoding='utf-8') as json_file:
    json.dump(data, json_file, ensure_ascii=False, indent=4)

print(f"Data saved to {file_name}")
