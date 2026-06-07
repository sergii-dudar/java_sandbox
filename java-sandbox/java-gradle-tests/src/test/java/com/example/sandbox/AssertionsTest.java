package com.example.sandbox;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.entry;

import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/** Variant: core AssertJ fluent assertions on numbers, strings and collections. */
@DisplayName("AssertJ core assertions")
class AssertionsTest {

    @Test
    @DisplayName("number assertions")
    void numberAssertions() {
        assertThat(Calculator.add(2, 3))
                .isEqualTo(5)
                .isPositive()
                .isGreaterThan(4)
                .isLessThanOrEqualTo(5)
                .isNotNegative();
    }

    @Test
    @DisplayName("boolean assertions")
    void booleanAssertions() {
        assertThat(Calculator.isEven(4)).isTrue();
        assertThat(Calculator.isEven(5)).isFalse();
    }

    @Test
    @DisplayName("string assertions")
    void stringAssertions() {
        assertThat(Strings.sayHi("Alice"))
                .isEqualTo("Hi, Alice!")
                .startsWith("Hi,")
                .endsWith("!")
                .contains("Alice")
                .hasSize(10)
                .matches("Hi, [A-Z][a-z]+!");
    }

    @Test
    @DisplayName("list assertions")
    void listAssertions() {
        List<String> words = Strings.words("the quick brown fox");

        assertThat(words)
                .hasSize(4)
                .containsExactly("the", "quick", "brown", "fox")
                .contains("brown")
                .doesNotContain("lazy")
                .allMatch(w -> !w.isBlank());
    }

    @Test
    @DisplayName("map assertions")
    void mapAssertions() {
        Map<String, Integer> scores = Map.of("alice", 90, "bob", 75);

        assertThat(scores)
                .hasSize(2)
                .containsKeys("alice", "bob")
                .containsEntry("alice", 90)
                .contains(entry("bob", 75));
    }

    @Test
    @DisplayName("extracting and filtering")
    void extractingAndFiltering() {
        List<String> words = Strings.words("alpha beta gamma");

        assertThat(words)
                .extracting(String::length)
                .containsExactly(5, 4, 5);

        assertThat(words)
                .filteredOn(w -> w.length() == 5)
                .containsExactly("alpha", "gamma");
    }
}
