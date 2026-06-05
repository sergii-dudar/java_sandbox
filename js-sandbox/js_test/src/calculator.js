"use strict";

// Tiny "system under test" used by the example tests.

function add(a, b) {
  return a + b;
}

function divide(dividend, divisor) {
  if (divisor === 0) {
    throw new Error("division by zero");
  }
  return dividend / divisor;
}

function isEven(n) {
  return n % 2 === 0;
}

function fizzbuzz(n) {
  if (n % 15 === 0) return "FizzBuzz";
  if (n % 3 === 0) return "Fizz";
  if (n % 5 === 0) return "Buzz";
  return String(n);
}

class BankAccount {
  constructor(balance = 0) {
    this.balance = balance;
  }

  deposit(amount) {
    if (amount <= 0) throw new Error("amount must be positive");
    this.balance += amount;
  }

  withdraw(amount) {
    if (amount > this.balance) throw new Error("insufficient funds");
    this.balance -= amount;
  }
}

module.exports = { add, divide, isEven, fizzbuzz, BankAccount };
