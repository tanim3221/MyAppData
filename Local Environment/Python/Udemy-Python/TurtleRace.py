import random
from turtle import Screen, Turtle

is_race_on =False

screen = Screen()

screen.setup(width=500,height=400)
user_bet = screen.textinput(title="Make your bet",prompt="Which turtle will win the race? Enter Color: ")

turtle_colors = [
    "red",
    "green",
    "blue",
    "purple",
    "pink",
    "black",
    "gold",
]

y_position = [-100,-70,-40, -10, 20, 50, 80]

all_t = []

for turtle_index in range(len(turtle_colors)):
    new_t = Turtle(shape="turtle")
    new_t.penup()
    new_t.color(turtle_colors[turtle_index])
    new_t.goto(x=-230, y=y_position[turtle_index])
    all_t.append(new_t)

if user_bet:
    is_race_on = True

while is_race_on:
    for turtle in all_t:
        if turtle.xcor() > 230:
            is_race_on = False
            win_color = turtle.pencolor()
            if win_color == user_bet:
                print(f"You have won! The {win_color} turtle is the winner.")
            else:
                print(f"You have lost! The {win_color} turtle is the winner.")

        rand_dis = random.randint(1,10)
        turtle.forward(rand_dis)

screen.exitonclick()

