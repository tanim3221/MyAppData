from flask import Flask, render_template, redirect, url_for, request
from flask_bootstrap import Bootstrap5
from wtforms import StringField, SubmitField, SelectField
from flask_wtf import FlaskForm
from wtforms.validators import DataRequired, URL, Email
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config["SECRET_KEY"] = "AIEUYRWI4UFGWEKJTYIUWEFHBSD"
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///new_books.db"
Bootstrap5(app)
db = SQLAlchemy()
db.init_app(app)

class Book(db.Model):
    id= db.Column (db.Integer, primary_key = True)
    title= db.Column (db.String(250), unique=True, nullable = True)
    author= db.Column (db.String(250), nullable = False)
    rating= db.Column (db.String(250), nullable = False)

with app.app_context():
    db.create_all()

class BookForm(FlaskForm):
    title = StringField("Book Name", validators=[DataRequired()])
    author = StringField("Author Name", validators=[DataRequired()])
    rate = SelectField("Rating", choices=['⭐','⭐⭐','⭐⭐⭐','⭐⭐⭐⭐','⭐⭐⭐⭐⭐'], validators=[DataRequired()])
    submit = SubmitField("Save")


@app.route("/")
def home():
    result = db.session.execute(db.select(Book).order_by(Book.title))
    all_books = result.scalars()
    return render_template("book/index.html", books=all_books)
        

@app.route("/add", methods=["GET", "POST"])
def add():
    form = BookForm()
    if form.validate_on_submit and request.method=="POST":
        new_book = Book(
            title = request.form['title'],
            author = request.form['author'],
            rating = request.form['rate']
        )        
        db.session.add(new_book)
        db.session.commit()
        return redirect(url_for("home"))
    return render_template("book/add.html", form=form)

@app.route("/edit", methods=["GET","POST"])
def edit():
    book_id = request.args.get("id")
    book_selected = db.get_or_404(Book, book_id)
    form = BookForm(obj=book_selected)
    if request.method=="POST":
        book_selected.title = form.title.data
        book_selected.author = form.author.data
        book_selected.rating = form.rate.data
        db.session.commit()
        return redirect(url_for("home"))
    return render_template("book/edit.html",book=book_selected, form=form)

@app.route("/delete")
def delete():
    book_id = request.args.get("id")
    book_delete = db.get_or_404(Book,book_id)
    db.session.delete(book_delete)
    db.session.commit()
    return redirect(url_for("home"))

if __name__=="__main__":
    app.run(debug=True)