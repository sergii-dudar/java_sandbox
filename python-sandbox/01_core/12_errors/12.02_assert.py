#!/usr/bin/python3.12

x = 7
y = 0
# It uses assert to check for 0
print("x / y value is : ")
# assert y != 0, "Divide by 0 error"
# print(x / y)

# ========================================
print("\n========================================|||:")


def avg(scores):
    assert len(scores) != 0, "The List is empty."
    return sum(scores) / len(scores)


scores2 = [67, 59, 86, 75, 92]
print("The Average of scores2:", avg(scores2))

scores1 = []
print("The Average of scores1:", avg(scores1))
