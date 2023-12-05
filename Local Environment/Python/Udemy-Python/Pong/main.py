import time
from turtle import Screen, Turtle

from ball import Ball
from paddle import Paddle

screen = Screen()
screen.bgcolor("black")
screen.setup(width=800, height=600)
screen.title("Pong Game")


r_paddle = Paddle((350,0))
l_paddle = Paddle((-350,0))
ball = Ball()


screen.listen()
screen.onkey(r_paddle.go_up, "Up")
screen.onkey(r_paddle.go_down, "Down")
screen.onkey(l_paddle.go_up, "u")
screen.onkey(l_paddle.go_down, "d")

game_is_on = True

while game_is_on:
    time.sleep(0.1)
    screen.update()
    ball.move()

    if ball.ycor() > 300 or ball.ycor() < -300:
        ball.bounce()




screen.exitonclick()