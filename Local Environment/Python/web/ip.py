import json

import requests

api = "https://aisapp.cf/inc/ip.php"

req = requests.get(api)

if req.status_code==200:
    data = req.json()
    print(json.dumps(data, indent=4))