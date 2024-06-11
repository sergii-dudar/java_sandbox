# ========================================Inner Function
print("\n========================================|||:Inner Function")


def func():  # here, we are creating a function and passing the parameter
    print("We are in first function")  # Here, we are printing the data of function

    def func1():  # here, we are creating a function and passing the parameter
        print("This is first child function")  # Here, we are printing the data of function 1

    def func2():  # here, we are creating a function and passing the parameter
        print("This is second child function")  # Here, we are printing the data of         # function 2

    func1()
    func2()


func()


########

def add(x):  # here, we are creating a function add and passing the parameter
    return x + 1  # here, we are returning the passed value by adding 1


def sub(x):  # here, we are creating a function sub and passing the parameter
    return x - 1  # here, we are returning the passed value by subtracting 1


def operator(func, x):  # here, we are creating a function and passing the parameter
    temp = func(x)
    return temp


print(operator(sub, 10))  # here, we are printing the operation subtraction with 10
print(operator(add, 20))  # here, we are printing the operation addition with 20


##########

def hello():  # here, we are creating a function named hello
    def hi():  # here, we are creating a function named hi
        print("Hello")  # here, we are printing the output of the function

    return hi  # here, we are returning the output of the function


new = hello()
new()
