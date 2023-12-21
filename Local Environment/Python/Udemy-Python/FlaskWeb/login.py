inputs = eval(input())

def login_deco(fn):
    def wrapper(*args):
        print(f"You called {fn.__name__}{args}")
        result = fn(args[0],args[1],args[2])
        print(f"Result: {result}")
        
    return wrapper

@login_deco
def a_func(a,b,c):
    return a*b*c

a_func(inputs[0],inputs[1],inputs[2])