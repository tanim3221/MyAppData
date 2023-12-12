import requests


class Data:

    def  __init__(self):
        self.api = "https://opentdb.com/api.php"
        self.param = {
            "amount": 10,
            "type": "boolean",
            "category": 18,
        }


    def get_questions(self):    
        response = requests.get(url=self.api, params=self.param)
        response.raise_for_status()
        if response.status_code == 200:
            new_q = response.json()
            return new_q
            
