from flask import Flask, render_template, redirect, url_for, request
from flask_bootstrap import Bootstrap5
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, TextAreaField
from wtforms.validators import DataRequired
import requests

MOVIE_DB_URL = "https://api.themoviedb.org/3/search/movie"
MOVIE_DB_API_KEY = "5b71f8f1566f7251aad227d548a98751"
MOVIE_DB_INFO_URL = "https://api.themoviedb.org/3/movie"
MOVIE_DB_IMAGE_URL = "https://image.tmdb.org/t/p/w500"

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

@app.route("/add", methods=["GET", "POST"])
def add_movie():
    form = FindMovieForm()

    if form.validate_on_submit():
        movie_title = form.title.data
        params = {
            "api_key": MOVIE_DB_API_KEY,
            "query": movie_title
        }
        response = requests.get(MOVIE_DB_URL,params=params, verify=False)
        data = response.json()["results"]
        print(response)
        return render_template("movie/select.html", options=data)
    return render_template("movie/add.html",form=form)


@app.route("/find")
def find_movie():
    movie_api_id = request.args.get("id")
    params = {
        "api_key": MOVIE_DB_API_KEY,
        "language": "en-US"
    }
    if movie_api_id:
        movie_api_url = f"{MOVIE_DB_INFO_URL}/{movie_api_id}"
        response = requests.get(movie_api_url, params=params, verify=False)
        data = response.json()        
        new_movie = Movie(
            title = data['title'],
            year = data['release_date'],
            rating = data['vote_average'],
            description = data['overview'],
            img_url = f"{MOVIE_DB_IMAGE_URL}{data['poster_path']}",
        )
        
        db.session.add(new_movie)
        db.session.commit()
        
        return redirect(url_for('edit', id=new_movie.id))

@app.route("/")
def home():
    result = db.session.execute(db.select(Movie).order_by(Movie.rating))
    all_m = result.scalars().all()
    
    for i in range(len(all_m)):
        all_m[i].ranking = len(all_m) - i
        
    db.session.commit()
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
