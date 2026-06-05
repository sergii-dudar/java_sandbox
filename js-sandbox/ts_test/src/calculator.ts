// Tiny typed "system under test" used by the example tests.

export function add(a: number, b: number): number {
  return a + b;
}

export function divide(dividend: number, divisor: number): number {
  if (divisor === 0) {
    throw new Error("division by zero");
  }
  return dividend / divisor;
}

export function isEven(n: number): boolean {
  return n % 2 === 0;
}

export type FizzBuzz = "Fizz" | "Buzz" | "FizzBuzz" | string;

export function fizzbuzz(n: number): FizzBuzz {
  if (n % 15 === 0) return "FizzBuzz";
  if (n % 3 === 0) return "Fizz";
  if (n % 5 === 0) return "Buzz";
  return String(n);
}

export class BankAccount {
  constructor(public balance: number = 0) {}

  deposit(amount: number): void {
    if (amount <= 0) throw new Error("amount must be positive");
    this.balance += amount;
  }

  withdraw(amount: number): void {
    if (amount > this.balance) throw new Error("insufficient funds");
    this.balance -= amount;
  }
}
