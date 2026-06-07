package com.example.sandbox;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.Duration;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Timeout;

/** Variant: repeated tests and timeouts. */
class RepeatedAndTimeoutTest {

    @RepeatedTest(value = 5, name = "run {currentRepetition} of {totalRepetitions}")
    void repeated() {
        assertThat(Calculator.add(2, 2)).isEqualTo(4);
    }

    @Test
    @Timeout(2)
    void completesWithinTwoSeconds() {
        assertThat(Calculator.fizzbuzz(15)).isEqualTo("FizzBuzz");
    }

    @Test
    void assertjTimeoutStyle() {
        // AssertJ can also assert the duration of a code block.
        assertThat(Duration.ofMillis(5)).isLessThan(Duration.ofSeconds(1));
    }
}
