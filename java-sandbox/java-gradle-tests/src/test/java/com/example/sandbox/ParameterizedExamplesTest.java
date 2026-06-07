package com.example.sandbox;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.EnumSource;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.NullAndEmptySource;
import org.junit.jupiter.params.provider.ValueSource;

/** Variant: parameterized tests with every common argument source. */
class ParameterizedExamplesTest {

    @ParameterizedTest(name = "{0} is even")
    @ValueSource(ints = {2, 4, 100, 0, -8})
    void valueSource(int number) {
        assertThat(Calculator.isEven(number)).isTrue();
    }

    @ParameterizedTest(name = "fizzbuzz({0}) = {1}")
    @CsvSource({
        "1, 1",
        "3, Fizz",
        "5, Buzz",
        "15, FizzBuzz"
    })
    void csvSource(int input, String expected) {
        assertThat(Calculator.fizzbuzz(input)).isEqualTo(expected);
    }

    @ParameterizedTest
    @MethodSource("palindromeProvider")
    void methodSource(String text, boolean expected) {
        assertThat(Strings.isPalindrome(text)).isEqualTo(expected);
    }

    static Stream<Arguments> palindromeProvider() {
        return Stream.of(
                Arguments.of("level", true),
                Arguments.of("racecar", true),
                Arguments.of("hello", false));
    }

    @ParameterizedTest
    @EnumSource(Day.class)
    void enumSource(Day day) {
        assertThat(day.name()).isNotBlank();
    }

    @ParameterizedTest
    @NullAndEmptySource
    @ValueSource(strings = {" ", "\t"})
    void nullEmptyAndBlank(String input) {
        assertThat(input == null || input.isBlank()).isTrue();
    }

    enum Day {
        MON,
        TUE,
        WED
    }
}
