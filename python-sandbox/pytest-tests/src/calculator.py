"""Tiny 'system under test' used by the example pytest tests."""

from __future__ import annotations


def add(a: int, b: int) -> int:
    return a + b


def divide(dividend: float, divisor: float) -> float:
    if divisor == 0:
        raise ZeroDivisionError("division by zero")
    return dividend / divisor


def is_even(n: int) -> bool:
    return n % 2 == 0


def fizzbuzz(n: int) -> str:
    if n % 15 == 0:
        return "FizzBuzz"
    if n % 3 == 0:
        return "Fizz"
    if n % 5 == 0:
        return "Buzz"
    return str(n)


class BankAccount:
    """Small stateful class to demonstrate fixtures and class-based tests."""

    def __init__(self, balance: float = 0.0) -> None:
        self.balance = balance

    def deposit(self, amount: float) -> None:
        if amount <= 0:
            raise ValueError("amount must be positive")
        self.balance += amount

    def withdraw(self, amount: float) -> None:
        if amount > self.balance:
            raise ValueError("insufficient funds")
        self.balance -= amount
