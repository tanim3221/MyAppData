from tkinter import *
import pandas as pd
import random as rd

BACKGROUND_COLOR = "#B1DDC6"
current_card = {}
to_learn = {}


try:
    data = pd.read_csv("./data/words_learn.csv")
except FileNotFoundError:
    org_data = pd.read_csv("./data/words.csv")
    to_learn = org_data.to_dict(orient="records")
else:
    to_learn = data.to_dict(orient="records")

def next_card():
    global current_card, flip_timer
    window.after_cancel(flip_timer)
    current_card = rd.choice(to_learn)
    canvas.itemconfig(card_title,text="Bangla", fill="black")
    canvas.itemconfig(card_word,text=current_card['bn'], fill="black")
    canvas.itemconfig(card_back,image=card_front_img)
    flip_timer = window.after(3000,func=flip_card)


def flip_card():
    canvas.itemconfig(card_title,text="English", fill="white")
    canvas.itemconfig(card_word,text=current_card['en'],fill="white")
    canvas.itemconfig(card_back, image=card_back_img)


def is_known():
    to_learn.remove(current_card)
    print(len(to_learn))
    data = pd.DataFrame(to_learn)
    data.to_csv("./data/words_learn.csv", index=False)

    next_card()

window = Tk()
window.title("Flash Card")
window.config(padx=50, pady=50, bg=BACKGROUND_COLOR)

flip_timer = window.after(3000,func=flip_card)

canvas = Canvas(width=800, height=530)
card_front_img = PhotoImage(file="./images/card_front.png")
card_back_img = PhotoImage(file="./images/card_back.png")
card_back = canvas.create_image(400,263,image=card_front_img)

card_title = canvas.create_text(400, 150, text="",font=("Arial", 40, "normal"))
card_word = canvas.create_text(400, 263, text="", font=("Arial", 60, "bold"))

canvas.config(bg=BACKGROUND_COLOR, highlightthickness=0)
canvas.grid(row=0, column=0, columnspan=2)

cross_img = PhotoImage(file="./images/wrong.png")
cross_button = Button(image=cross_img, highlightthickness=0, command=next_card)
cross_button.grid(row=1, column=0)


check_img = PhotoImage(file="./images/right.png")
check_button = Button(image=check_img, highlightthickness=0, command=is_known)
check_button.grid(row=1, column=1)

next_card()

window.mainloop()