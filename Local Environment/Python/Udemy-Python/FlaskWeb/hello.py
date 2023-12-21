from flask import Flask
import random

app = Flask(__name__)

@app.route('/')
def hello():
    return "<h1>Number Guess Game</h2>"\
        "<img src='https://flask.palletsprojects.com/en/1.1.x/_images/flask-logo.png'/>"

@app.route('/<int:number>')
def num(number):
    ran_num = random.choice(range(0,9))
    if ran_num > number:
        msg = "<h1 style='color:red'>Too Low, please try again.</h1>" 
    elif ran_num < number:
        msg = "<h1 style='color:red'>Too high, please try again.</h1>" 
    else:
        msg = "<h1 style='color:green'>Perfect !</h1>" 
        
    return f"{msg}"


if __name__=="__main__":
    app.run()