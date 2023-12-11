import smtplib as smtp

my_email = "myicche@gmail.com"
to_email = "astanim.3221@gmail.com"
password = "vltwzqjiwczsiuaq"

sub = "Test subject"
body = "Hello,  Test message."

with smtp.SMTP("smtp.gmail.com") as conn:
    conn.starttls()
    conn.login(
        user=my_email,
        password=password)
    conn.sendmail(
        from_addr=my_email, 
        to_addrs=to_email, 
        msg=f"Subject:{sub}\n\n {body}")

