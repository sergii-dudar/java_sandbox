package com.example.sandbox;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assumptions.assumeTrue;
import static org.junit.jupiter.api.Assumptions.assumingThat;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.DisabledOnOs;
import org.junit.jupiter.api.condition.EnabledOnOs;
import org.junit.jupiter.api.condition.OS;

/** Variant: disabling tests and conditional execution via assumptions. */
class DisabledAndAssumptionsTest {

    @Test
    @Disabled("demonstrates an unconditionally disabled test")
    void alwaysDisabled() {
        throw new AssertionError("never executed");
    }

    @Test
    @EnabledOnOs({OS.LINUX, OS.MAC})
    void onlyOnUnix() {
        assertThat(Calculator.isEven(2)).isTrue();
    }

    @Test
    @DisabledOnOs(OS.WINDOWS)
    void notOnWindows() {
        assertThat(Calculator.add(1, 1)).isEqualTo(2);
    }

    @Test
    void assumptionAbortsWhenFalse() {
        // If the assumption fails the test is aborted (skipped), not failed.
        assumeTrue("CI".equals(System.getenv("ENV")), "only runs in CI");
        throw new AssertionError("never reached locally");
    }

    @Test
    void assumingThatRunsPartConditionally() {
        assumingThat(
                "CI".equals(System.getenv("ENV")),
                () -> assertThat(Calculator.add(2, 2)).isEqualTo(4));

        // This part always runs regardless of the assumption.
        assertThat(Calculator.isEven(10)).isTrue();
    }
}
