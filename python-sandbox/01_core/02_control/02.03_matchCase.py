#!/usr/bin/python3.12

# ---------------- Python match-case Statement
print("\n|||: Python match-case Statement")


def weekday(n):
    match n:
        case 0:
            return "Monday"
        case 1:
            return "Tuesday"
        case 2:
            return "Wednesday"
        case 3:
            return "Thursday"
        case 4:
            return "Friday"
        case 5:
            return "Saturday"
        case 6:
            return "Sunday"
        case _:  # default
            return "Invalid day number"


print(weekday(3))
print(weekday(6))
print(weekday(7))

# ---------------- brake
print("\n|||: Python match-case brake")
# in case match-case no need brake, as in case match, executing only matched block

x = 2
match x:
    case 1:
        print("One")
    case 2:
        print("Two")
    case 3:
        print("Three")
    case _:
        print("Other")

print("This is after the match-case block")

# ---------------- Combined Cases in Match Statement
print("\n|||: Combined Cases in Match Statement")


def access(user):
    match user:
        case "admin" | "manager":
            return "Full access"
        case "Guest":
            return "Limited access"
        case _:
            return "No access"


print(access("manager"))
print(access("Guest"))
print(access("Ravi"))

# ---------------- List as the Argument in Match Case Statement
print("\n|||: List as the Argument in Match Case Statement")


def greeting(details):
    match details:
        case [time, name]:
            return f'Good {time} {name}!'
        case [time, *names]:
            msg = ''
            for name in names:
                msg += f'Good {time} {name}!\n'
            return msg


print(greeting(["Morning", "Ravi"]))
print(greeting(["Afternoon", "Guest"]))
print(greeting(["Evening", "Kajal", "Praveen", "Lata"]))

# ---------------- Using "if" in "Case" Clause
print("\n|||: Using \"if\" in \"Case\" Clause")


# allows you to include if statement in the case clause for conditional computation of match variable

def intr(details):
    match details:
        case [amt, duration] if amt < 10000:
            return amt * 10 * duration / 100
        case [amt, duration] if amt >= 10000:
            return amt * 15 * duration / 100


print("Interest = ", intr([5000, 5]))
print("Interest = ", intr([15000, 3]))
