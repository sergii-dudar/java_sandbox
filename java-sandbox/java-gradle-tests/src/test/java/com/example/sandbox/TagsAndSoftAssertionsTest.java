package com.example.sandbox;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.SoftAssertions.assertSoftly;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

/**
 * Variant: tags (for filtering) and AssertJ soft assertions (collect all
 * failures instead of stopping at the first).
 */
@Tag("fast")
class TagsAndSoftAssertionsTest {

    @Test
    @Tag("smoke")
    @DisplayName("soft assertions report every failure together")
    void softAssertions() {
        String greeting = Strings.sayHi("Bob");

        assertSoftly(softly -> {
            softly.assertThat(greeting).startsWith("Hi,");
            softly.assertThat(greeting).endsWith("!");
            softly.assertThat(greeting).contains("Bob");
            softly.assertThat(greeting).hasSize(8);
        });
    }

    @Test
    @Tag("slow")
    void chainedAssertionsOnAccount() {
        BankAccount account = new BankAccount(100);
        account.deposit(50);
        account.withdraw(30);

        assertThat(account.getBalance()).isEqualTo(120.0);
    }
}
