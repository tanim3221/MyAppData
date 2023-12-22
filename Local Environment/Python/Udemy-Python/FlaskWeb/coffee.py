from flask import Flask, render_template, redirect, url_for
from flask_bootstrap import Bootstrap5
from wtforms import StringField,SubmitField, SelectField
from flask_wtf import FlaskForm
from wtforms.validators import DataRequired, URL
import csv

app = Flask(__name__)
app.config["SECRET_KEY"] = "498754YTIUO4WEHYRIKEHFSDJ"
Bootstrap5(app)


class CafeForm(FlaskForm):
    cafe = StringField("Cafe Name", validators=[DataRequired()])
    location = StringField("Location", validators=[DataRequired(),URL()])
    open = StringField("Open Time", validators=[DataRequired()])
    close = StringField("Close Time", validators=[DataRequired()])
    coffee_rating = SelectField("Coffee Rating", choices=["⭐","⭐⭐","⭐⭐⭐","⭐⭐⭐⭐","⭐⭐⭐⭐⭐"], validators=[DataRequired()])
    wifi_rating = SelectField("WiFi Rating", choices=["⭐","⭐⭐","⭐⭐⭐","⭐⭐⭐⭐","⭐⭐⭐⭐⭐"], validators=[DataRequired()])
    power_rating = SelectField("Power Rating", choices=["⭐","⭐⭐","⭐⭐⭐","⭐⭐⭐⭐","⭐⭐⭐⭐⭐"], validators=[DataRequired()])
    submit = SubmitField("Submit")
    
    
@app.route("/")
def home():
    return render_template("coffee/index.html")


@app.route("/add", methods=["GET", "POST"])
def add_cafe():
    form = CafeForm()
    if form.validate_on_submit():
        with open("./cafe_data.csv", mode="a", encoding="utf-8") as csv_files:
            csv_files.write(f"\n{form.cafe.data},"
                            f"{form.location.data},"
                            f"{form.open.data},"
                            f"{form.close.data},"
                            f"{form.coffee_rating.data},"
                            f"{form.wifi_rating.data},"
                            f"{form.power_rating.data},"
                            )
        return redirect(url_for("cafes"))
    return render_template("coffee/add.html", form=form)


@app.route("/cafes")
def cafes():
    with open("./cafe_data.csv", newline='', encoding="utf-8") as csv_file:
        csv_data = csv.reader(csv_file, delimiter=",")
        list_of_row = []
        for row in csv_data:
            list_of_row.append(row)
        
        empty_check = "true" if not list_of_row else "false"
            
    return render_template("coffee/cafes.html", cafes=list_of_row, empty=empty_check)    

if __name__=="__main__":
    app.run(debug=True)