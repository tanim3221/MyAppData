import requests


class Data:

    def  __init__(self, api):
        self.api = api


    def get_questions(self):
        response = requests.get(url=self.api)
        if response.status_code == 200:
            new_q = response.json()
            return new_q
            
