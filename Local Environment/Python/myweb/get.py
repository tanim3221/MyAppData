import json

import requests

# Define the URL
url = "https://api.saklayen.cf/assets/api/public"

# Define the payload data
payload = {
    "tables": ["personalinfo", "my_tags"],
    "userType": "enduser"
}

# Define the headers
headers = {
    "Content-Type": "application/json"
}

response = requests.post(url, json=payload, headers=headers, verify=False)

# Check the response status code
if response.status_code == 200:
    try:
        # Attempt to parse the JSON response
        response_data = response.json()
        print("Response Data:")
        print(response_data)
    except json.JSONDecodeError as e:
        print("JSONDecodeError:", e)
        print("Response Text:")
        print(response.text)  # Print the response text
else:
    print(f"Request failed with status code: {response.status_code}")
