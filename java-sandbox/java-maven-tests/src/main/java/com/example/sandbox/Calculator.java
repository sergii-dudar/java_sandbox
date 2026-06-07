package com.example.sandbox;

/** Tiny "system under test" used by the example tests. */
public final class Calculator {

    private Calculator() {
    }

    public static int add(int a, int b) {
        return a + b;
    }

    public static int divide(int dividend, int divisor) {
        if (divisor == 0) {
            throw new IllegalArgumentException("division by zero");
        }
        return dividend / divisor;
    }

    public static boolean isEven(int n) {
        return n % 2 == 0;
    }

    public static String fizzbuzz(int n) {
        if (n % 15 == 0) {
            return "FizzBuzz";
        }
        if (n % 3 == 0) {
            return "Fizz";
        }
        if (n % 5 == 0) {
            return "Buzz";
        }
        return String.valueOf(n);
    }
}
