from flask import Flask, render_template, redirect, url_for, flash, abort, session, request
from flask_bootstrap import Bootstrap5
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, TextAreaField
from wtforms.validators import DataRequired, URL
from flask_ckeditor import CKEditor, CKEditorField
from datetime import date
from flask_login import LoginManager, UserMixin, login_user, current_user, logout_user, login_required
from werkzeug.security import generate_password_hash,check_password_hash
from functools import wraps
from sqlalchemy.orm import relationship
from sqlalchemy import ForeignKey
from flask_migrate import Migrate
# from flask_gravatar import Gra


app = Flask(__name__)
app.config['SECRET_KEY'] = 'ASKFHWEIRFADJKFH48YTIWUEFB'
ckeditor = CKEditor(app)
Bootstrap5(app)


login_mamager = LoginManager()
login_mamager.init_app(app)

# CONNECT TO DB
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///posts_api_2.db'
db = SQLAlchemy()
db.init_app(app)
migrate = Migrate(app, db)


class RegisterForm(FlaskForm):
    name = StringField("Name", validators=[DataRequired()])
    email = StringField("Email", validators=[DataRequired()])
    password = StringField("Password", validators=[DataRequired()])
    submit = SubmitField("Sign Up")


class PostForm(FlaskForm):
    title = StringField("Post Title", validators=[DataRequired()])
    subtitle = StringField("Subtitle", validators=[DataRequired()])
    body = TextAreaField("Post Body", validators=[DataRequired()])
    img_url = StringField("Image URL", validators=[DataRequired()])
    submit = SubmitField("Save")


class LoginForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired()])
    password = StringField("Password", validators=[DataRequired()])
    submit = SubmitField("Login")
 

class CommentForm(FlaskForm):
    comment_text = CKEditorField("Comment", validators=[DataRequired()])
    submit = SubmitField("Submit")   


class User(UserMixin, db.Model):
    __tablename__="users"
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(100), unique=True)
    password = db.Column(db.String(100))
    name = db.Column(db.String(100))
    
    posts = relationship("BlogPost", back_populates="author")
    comments = relationship("Comment", back_populates="comment_author")


class Comment(db.Model):
    __tablename__ = "comment_api"
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.Text, nullable=False)
    author_id = db.Column(db.Integer, ForeignKey("users.id"))
    post_id = db.Column(db.Integer, ForeignKey("posts_api_2.id"))
    comment_author = relationship("User", back_populates="comments")
    parent_post = relationship("BlogPost", back_populates="comments")
    

    
# CONFIGURE TABLE
class BlogPost(db.Model):
    __tablename__ = "posts_api_2"
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(250), unique=True, nullable=False)
    subtitle = db.Column(db.String(250), nullable=False)
    date = db.Column(db.String(250), nullable=False)
    body = db.Column(db.Text, nullable=False)
    author_id = db.Column(db.Integer, ForeignKey('users.id'))
    author = relationship("User", back_populates="posts")
    img_url = db.Column(db.String(250), nullable=False)
    comments = relationship("Comment", back_populates="parent_post")
    


with app.app_context():
    db.create_all()

login_mamager.login_view = 'login'

@login_mamager.user_loader
def load_user(user_id):
    return db.get_or_404(User,user_id)


def admin_only(f):
    @wraps(f)
    def dec_func(*args, **kwargs):
        if current_user.email != "astanim.3221@gmail.com":
            return abort(403)
        return f(*args, **kwargs)
    return dec_func


@app.route("/login", methods=["GET", "POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit:
        email = form.email.data
        password = form.password.data
        result = db.session.execute(db.select(User).where(User.email==email))
        user = result.scalar()
               
        if user and check_password_hash(user.password, password):
            login_user(user)               
            return redirect(url_for("get_all_posts"))
        
    return render_template("api_blog/login.html", form=form, current_user=current_user)


@app.route("/logout")
def logout():
    logout_user()
    return redirect(url_for("get_all_posts"))


@app.route("/register", methods=["GET", "POST"])
def register():
    form = RegisterForm()
    if form.validate_on_submit():
        result = db.session.execute(db.select(User).where(User.email==form.email.data))
        user = result.scalar()
        
        if user:
            flash("You have already signed up with this mail, please login.")
            return redirect(url_for("login"))
            
        hash_and_salted_password = generate_password_hash(
            form.password.data,
            method='pbkdf2:sha256',
            salt_length=8
        )
        
        new_user = User(
            email = form.email.data,
            name = form.name.data,
            password= hash_and_salted_password
        )
        db.session.add(new_user)
        db.session.commit()
        login_user(new_user)
        return redirect(url_for("get_all_posts"))
    return render_template ("api_blog/register.html", form=form, current_user=current_user)


@app.route('/')
def get_all_posts():
    result = db.session.execute(db.select(BlogPost))
    posts = result.scalars().all()
    return render_template("api_blog/index.html", all_posts=posts, current_user=current_user)


@app.route('/post/<int:post_id>', methods=["GET", "POST"])
def show_post(post_id):
    requested_post = db.get_or_404(BlogPost, post_id)
    comment_form = CommentForm()
    if comment_form.validate_on_submit():
        if not current_user.is_authenticated:
            flash("You need to login or register to comment.")
            return redirect(url_for("login"))
        
        new_comment = Comment(
            text = comment_form.comment_text.data,
            comment_author = current_user,
            parent_post = requested_post
        )
        
        db.session.add(new_comment)
        db.session.commit()
    
    return render_template("api_blog/post.html", post=requested_post, current_user=current_user, form=comment_form)


@app.route("/edit-post/<int:post_id>", methods = ["GET", "POST"])
def edit_post(post_id):
    post = db.get_or_404(BlogPost, post_id)
    edit_form = PostForm(
        title=post.title,
        subtitle=post.subtitle,
        img_url=post.img_url,
        author=current_user,
        body=post.body
    )
    
    if edit_form.validate_on_submit():
        post.title = edit_form.title.data
        post.subtitle = edit_form.subtitle.data
        post.img_url = edit_form.img_url.data
        post.author = current_user
        post.body = edit_form.body.data
        db.session.commit()
        return redirect(url_for("show_post", post_id=post.id))
    return render_template("api_blog/make-post.html", form=edit_form, is_true = True, current_user=current_user)


# Below is the code from previous lessons. No changes needed.
@app.route("/about")
def about():
    return render_template("api_blog/about.html", current_user=current_user)


@app.route("/contact")
def contact():
    return render_template("api_blog/contact.html", current_user=current_user)


@app.route("/new-post", methods=["GET","POST"])
@login_required
def add_new_post():
    form = PostForm()
    if form.validate_on_submit():
        new_post = BlogPost(
            title = form.title.data,
            subtitle = form.subtitle.data,
            body = form.body.data,
            img_url = form.img_url.data,
            author = current_user,
            date = date.today().strftime("%B %d %Y")
        )
        db.session.add(new_post)
        db.session.commit()
        return redirect(url_for("get_all_posts"))
    return render_template("api_blog/make-post.html", form=form, current_user=current_user)


@app.route("/delete/<int:post_id>")
@admin_only
def delete_post(post_id):
    post_delete = db.get_or_404(BlogPost,post_id)
    db.session.delete(post_delete)
    db.session.commit()
    return redirect(url_for("get_all_posts"))


if __name__ == "__main__":
    app.run(debug=True, port=5003)
