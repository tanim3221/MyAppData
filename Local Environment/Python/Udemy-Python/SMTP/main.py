import smtplib as smtp
import datetime as dt
import random as rd

HOST = "smtp.gmail.com"
MY_MAIL = "myicche@gmail.com"
TO_MAIL = "astanim.3221@gmail.com"
MY_PASSWORD = "vltwzqjiwczsiuaq"

now = dt.datetime.now()
weekday = now.weekday()
if weekday == 1:
    with open("./quotes.txt") as quote_file:
        all_quotes = quote_file.readlines()
        quote = rd.choice(all_quotes)
    print(quote)
    with smtp.SMTP(HOST) as conn:
        conn.starttls()
        conn.login(MY_MAIL,MY_PASSWORD)
        conn.sendmail(
                from_addr=MY_MAIL, to_addrs=TO_MAIL, 
                msg=f"Subject: Monday Motivation\n\n{quote}"
            )