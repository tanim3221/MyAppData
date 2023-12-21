from flask import Flask, render_template, request
import datetime
import requests
from post import Post
import smtplib

HOST = "smtp.gmail.com"
MY_MAIL = "myicche@gmail.com"
TO_MAIL = "astanim.3221@gmail.com"
MY_PASSWORD = "vltwzqjiwczsiuaq"

post_objects = []
url = "https://api.npoint.io/c790b4d5cab58020d391"
res = requests.get(url, verify=False)
all_post = res.json()

for post in all_post:
    post_obj = Post(post_id=post['id'],title=post['title'],subtitle=post['subtitle'],body=post['body'])
    post_objects.append(post_obj)

app = Flask(__name__) 
    
@app.route("/")
def home():
    curr_year = datetime.datetime.now().year
    return render_template("index.html", 
                            year=curr_year,
                            all_posts=post_objects
                        )
@app.route("/guess/<name>")
def guess(name):
    g_url = f"https://api.genderize.io?name={name}"
    a_url = f"https://api.agify.io?name={name}"
    g_res = requests.get(g_url, verify=False)
    g_data = g_res.json()
    gender = g_data['gender']
    a_res = requests.get(a_url, verify=False)
    a_data = a_res.json()
    age = a_data['age']
    return render_template("guess.html", person_name=name, gender=gender, age=age)

@app.route("/blog")
def get_blog():
    url = "https://api.npoint.io/c790b4d5cab58020d391"
    res = requests.get(url, verify=False)
    all_post = res.json()
    return render_template("blog.html", posts=all_post)

@app.route('/about')
def about():
    return render_template("about.html")

@app.route('/contact', methods = ["GET", "POST"])
def contact():
    if request.method == "POST":
        data = request.form
        send_mail(name=data['name'], email=data['email'], phone=data['phone'], message=data['message'])
        return render_template("contact.html", msg_send=True)
    return render_template("contact.html", msg_send=False)

@app.route("/post/<int:index>")
def show_post(index):
    req_post = None
    for blog in post_objects:
        if blog.id == index:
            req_post = blog
    return render_template("post.html", post=req_post)

def send_mail(name, email, phone, message):
    full_message = f"Subject: Flask Message.\n\nName: {name}\nEmail: {email}\nPhone: {phone}\n\nMessage: {message}"
    print(full_message)
    with smtplib.SMTP(HOST) as conn:
        conn.starttls()
        conn.login(MY_MAIL, MY_PASSWORD)
        conn.sendmail(to_addrs=TO_MAIL, from_addr=MY_MAIL, msg=full_message)
    
if __name__ == "__main__":
    app.run(debug=True)