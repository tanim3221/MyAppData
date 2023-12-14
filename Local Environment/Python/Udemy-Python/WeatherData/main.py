import requests

def sms_send(message):
    url = "http://bulksmsbd.net/api/smsapi"
    api_key = "d80FK0SH0onPxezbcYn8"
    sender_id = "8809617642622"
    numbers = "8801727268458"

    data = {
        "api_key": api_key,
        "senderid": sender_id,
        "number": numbers,
        "message": message
    }

    try:
        response = requests.post(url, data=data)
        response.raise_for_status()
        return response.json()
    except requests.RequestException as e:
        return f"Error: {e}"


api_endpoint = "https://api.openweathermap.org/data/2.5/forecast"
api_key = "389ffa07881d59fefb510a0809a6df7d"
api_param = {
    "lat": 24.095818,
    "lon": 90.412521,
    "appid": api_key,
    "cnt":4
}
res = requests.get(api_endpoint, params=api_param)
res.raise_for_status()
data = res.json()


will_rain = False

for hour_data in data["list"]:
    h_data = hour_data["weather"][0]['id']
    if int(h_data) < 700:
        will_rain = True

if will_rain:
    message = "Bring an umbrella."
    sms_send(message=message)
    print(message)
else:
    print("No need to keep umbrella.")

