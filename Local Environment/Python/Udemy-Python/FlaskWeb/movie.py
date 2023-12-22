from flask import Flask, render_template, redirect, url_for, request
from flask_bootstrap import Bootstrap5
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, TextAreaField
from wtforms.validators import DataRequired
import requests

app = Flask(__name__)
app.config['SECRET_KEY'] = '8BYkEfBA6O6donzWlSihBXox7C0sKR6b'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///movies.db'
Bootstrap5(app)
db = SQLAlchemy()
db.init_app(app)

class Movie(db.Model):
    id = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(300),nullable=False, unique =True)
    year = db.Column(db.String(100),nullable=False)
    description = db.Column(db.String(500),nullable=False)
    rating = db.Column(db.String(100),nullable=True)
    ranking = db.Column(db.String(100),nullable=True)
    review = db.Column(db.String(300),nullable=True)
    img_url = db.Column(db.String(300),nullable=False)

with app.app_context():
    db.create_all()

class EditMovieForm(FlaskForm):
    review = TextAreaField("Movie Review")
    rating = StringField("Movie Rating (1-10)")
    submit = SubmitField("Save")

class FindMovieForm(FlaskForm):
    title = StringField("Movie Title", validators=[DataRequired()])
    submit= SubmitField("Search")

# new_movie = Movie(
#     title="Phone Booth",
#     year=2002,
#     description="Publicist Stuart Shepard finds himself trapped in a phone booth, pinned down by an extortionist's sniper rifle. Unable to leave or receive outside help, Stuart's negotiation with the caller leads to a jaw-dropping climax.",
#     rating=7.3,
#     ranking=10,
#     review="My favourite character was the caller.",
#     img_url="https://image.tmdb.org/t/p/w500/tjrX2oWRCM3Tvarz38zlZM7Uc10.jpg"
# )

# with app.app_context():
#     db.session.add(new_movie)
#     db.session.commit()

@app.route("/")
def home():
    result = db.session.execute(db.select(Movie))
    all_m = result.scalars()
    return render_template("movie/index.html", movies = all_m)

@app.route("/edit", methods=["GET","POST"])
def edit():
    movie_id =request.args.get("id")
    movie = db.get_or_404(Movie,movie_id)
    form = EditMovieForm(obj=movie)
    if form.validate_on_submit():
        movie.review = form.review.data
        movie.rating = form.rating.data
        db.session.commit()
        return redirect(url_for("home"))
    return render_template("movie/edit.html", form=form, movie=movie)

@app.route("/delete")
def delete():
    movie_id =request.args.get("id")
    movie = db.get_or_404(Movie,movie_id)
    db.session.delete(movie)
    db.session.commit()
    return redirect(url_for("home"))


if __name__ == '__main__':
    app.run(debug=True)
