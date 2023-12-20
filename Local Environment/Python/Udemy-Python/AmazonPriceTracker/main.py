import requests
from bs4 import BeautifulSoup
import lxml
import smtplib as smtp

URL = "https://www.amazon.com/dp/B075CYMYK6?psc=1&ref_=cm_sw_r_cp_ud_ct_FM9M699VKHTT47YD50Q6"
USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0"
ACCEPT_LANG = "en-US,en;q=0.9"
BASE_PRICE = 50
HOST = "smtp.gmail.com"
MY_MAIL = "myicche@gmail.com"
TO_MAIL = "astanim.3221@gmail.com"
MY_PASSWORD = "vltwzqjiwczsiuaq"

headers = {
    "Accept-Language": ACCEPT_LANG,
    "User-Agent": USER_AGENT,
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
}

res = requests.get(URL,headers=headers)
web_data = res.text

soup = BeautifulSoup(web_data, "lxml")
product_price = soup.find(class_="aok-offscreen").get_text()
product_title = soup.find(id="productTitle").get_text().strip()
price_without_curr = product_price.split("$")[1]
price_float = float(price_without_curr)

if price_float > BASE_PRICE:
    with smtp.SMTP(HOST, port=587) as conn:
        conn.starttls()
        res = conn.login(MY_MAIL,MY_PASSWORD)
        conn.sendmail(
            from_addr=MY_MAIL,
            to_addrs=TO_MAIL,
            msg=f"Subject:Amazon Price Alert!\n\n{product_title} is now {product_price}".encode("utf-8")
        )

