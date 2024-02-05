import requests
import json
import time
import urllib3

# Disable SSL/TLS verification warnings
urllib3.disable_warnings()

def wp_remote_request(url, method, headers, body='', payload=None):
    if method == 'GET':
        response = requests.get(url, headers=headers, params=payload, verify=False)
    elif method == 'POST':
        response = requests.post(url, headers=headers, verify=False, data=json.dumps(body))
    elif method == 'DELETE':
        response = requests.delete(url, headers=headers, verify=False)
    else:
        raise ValueError("Invalid HTTP method")
    
    return response

def main():
    # Initialize variables
    api_key = 'e66ad2c717e33381eef2f011baab67452a0a0'
    api_email = 'astanim.3221@gmail.com'
    zone_id = '710cbd3b29fee7b39ec990ed73a9d9c5'
    url = f'https://api.cloudflare.com/client/v4/zones/{zone_id}/dns_records'
    headers = {
        'X-Auth-Key': api_key,
        'X-Auth-Email': api_email,
        'Authorization': "Bearer o5OWnJj0MtBOYqynUwMhCYH56npCF0gsDZU3qAT2",
        'Content-Type': 'application/json'
    }
    
    payload = {
        "content" : "35.241.18.84",
        "type": "A"
    }


    # Get initial records count
    response = wp_remote_request(url,'GET', headers, '', payload=payload)
    res = response.json()
    total_count = res['result_info']['total_count']
    # print(total_count)

    # Delete records in a loop until no more records left
    while total_count > 0:
        for r in res['result']:
            print(r['id'])
            delete_url = f'https://api.cloudflare.com/client/v4/zones/{zone_id}/dns_records/{r["id"]}'
            response = wp_remote_request(delete_url, 'DELETE', headers)

        # Get records count after deletion
        response = wp_remote_request(url, 'GET', headers)
        res = response.json()
        total_count = res['result_info']['total_count']
        print(total_count)
        time.sleep(1)  # Avoid hitting API rate limits


if __name__ == "__main__":
    main()
