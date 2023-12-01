#Calculator

def add(n1,n2):
    return n1 + n2

def substrct (n1,n2):
    return n1-n2

def multiply(n1, n2):
    return n1*n2

def divide (n1,n2):
    return n1/n2

opeartions = {
    "+":add,
    "-":substrct,
    "*":multiply,
    "/":divide
}

num1 = 12
num2 = 8

for symbol in opeartions:
    print(symbol)
opeartion_symbol = input("Pick a opration from the line above: ")

calculation_function = opeartions[opeartion_symbol]
answer = calculation_function(num1,num2)

print(f"{num1} {opeartion_symbol} {num2} = {answer}")