package com.example.sandbox;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.DynamicTest.dynamicTest;

import java.util.stream.Stream;
import org.junit.jupiter.api.DynamicTest;
import org.junit.jupiter.api.TestFactory;

/** Variant: dynamic tests generated at runtime via a {@code @TestFactory}. */
class DynamicTestsTest {

    @TestFactory
    Stream<DynamicTest> generatedFizzBuzzTests() {
        record Case(int input, String expected) {}

        return Stream.of(
                        new Case(1, "1"),
                        new Case(3, "Fizz"),
                        new Case(5, "Buzz"),
                        new Case(15, "FizzBuzz"))
                .map(c -> dynamicTest(
                        "fizzbuzz(" + c.input() + ") = " + c.expected(),
                        () -> assertThat(Calculator.fizzbuzz(c.input())).isEqualTo(c.expected())));
    }
}
