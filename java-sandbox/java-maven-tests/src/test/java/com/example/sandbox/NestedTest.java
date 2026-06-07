package com.example.sandbox;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatIllegalStateException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

/** Variant: nested tests for grouping related scenarios with shared setup. */
@DisplayName("A bank account")
class NestedTest {

    private BankAccount account;

    @BeforeEach
    void createAccount() {
        account = new BankAccount(100);
    }

    @Nested
    @DisplayName("when depositing")
    class WhenDepositing {

        @Test
        @DisplayName("increases the balance")
        void increasesBalance() {
            account.deposit(50);
            assertThat(account.getBalance()).isEqualTo(150.0);
        }
    }

    @Nested
    @DisplayName("when withdrawing")
    class WhenWithdrawing {

        @Test
        @DisplayName("decreases the balance")
        void decreasesBalance() {
            account.withdraw(40);
            assertThat(account.getBalance()).isEqualTo(60.0);
        }

        @Test
        @DisplayName("rejects overdraw")
        void rejectsOverdraw() {
            assertThatIllegalStateException().isThrownBy(() -> account.withdraw(1000));
        }
    }
}
