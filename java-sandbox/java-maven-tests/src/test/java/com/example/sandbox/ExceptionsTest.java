package com.example.sandbox;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatCode;
import static org.assertj.core.api.Assertions.assertThatExceptionOfType;
import static org.assertj.core.api.Assertions.assertThatIllegalArgumentException;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/** Variant: exception assertions with AssertJ. */
@DisplayName("AssertJ exception assertions")
class ExceptionsTest {

    @Test
    @DisplayName("assertThatThrownBy with message checks")
    void thrownBy() {
        assertThatThrownBy(() -> Calculator.divide(10, 0))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("division by zero")
                .hasMessageContaining("division");
    }

    @Test
    @DisplayName("assertThatExceptionOfType")
    void exceptionOfType() {
        assertThatExceptionOfType(IllegalStateException.class)
                .isThrownBy(() -> new BankAccount(10).withdraw(50))
                .withMessage("insufficient funds");
    }

    @Test
    @DisplayName("dedicated assertThatIllegalArgumentException")
    void illegalArgument() {
        assertThatIllegalArgumentException()
                .isThrownBy(() -> new BankAccount(0).deposit(-5))
                .withMessageContaining("must be positive");
    }

    @Test
    @DisplayName("assertThatCode does not throw on the happy path")
    void doesNotThrow() {
        BankAccount account = new BankAccount(20);

        assertThatCode(() -> account.withdraw(5)).doesNotThrowAnyException();
        assertThat(account.getBalance()).isEqualTo(15.0);
    }
}
