from flask import Flask, render_template
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from flask_bootstrap import Bootstrap5
from wtforms.validators import DataRequired, Email, Length

class LoginForm(FlaskForm):
    email = StringField(label="Email", validators=[DataRequired()])
    password = PasswordField(label="Password", validators=[DataRequired()])
    submit = SubmitField(label="Log In")

app = Flask(__name__)
app.secret_key = "4W8TRYZGFI3TRAEIURTQ7TRFWAEKJ"
bootstrap = Bootstrap5(app)


@app.route("/")
def home():
    return render_template('wtf/index.html')


@app.route("/login", methods = ["GET", "POST"])
def login():
    login_form = LoginForm()
    if login_form.validate_on_submit():
        if login_form.email.data =="admin@mail.com" and login_form.password.data =="12345":
            return render_template("wtf/success.html")
        else:
            return render_template("wtf/error.html")
        
    return render_template("wtf/login.html", form=login_form)


if __name__ == '__main__':
    app.run(debug=True)