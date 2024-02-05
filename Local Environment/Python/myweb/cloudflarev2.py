import http.client

conn = http.client.HTTPSConnection("api.cloudflare.com")

headers = {
    'Content-Type': "application/json",
    'X-Auth-Email': "astanim.3221@gmail.com",
    "X-Auth-Key": "e66ad2c717e33381eef2f011baab67452a0a0",
    'Authorization': "Bearer o5OWnJj0MtBOYqynUwMhCYH56npCF0gsDZU3qAT2",
    }

conn.request("GET", "/client/v4/zones/710cbd3b29fee7b39ec990ed73a9d9c5/dns_records", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))