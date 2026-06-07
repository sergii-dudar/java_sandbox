package com.example.sandbox;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.List;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

/**
 * Variant: lifecycle hooks. With {@code @TestInstance(PER_CLASS)} the
 * {@code @BeforeAll}/{@code @AfterAll} methods can be non-static.
 */
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class LifecycleTest {

    private final List<String> events = new ArrayList<>();
    private BankAccount account;

    @BeforeAll
    void beforeAll() {
        events.add("beforeAll");
    }

    @AfterAll
    void afterAll() {
        events.add("afterAll");
    }

    @BeforeEach
    void beforeEach() {
        account = new BankAccount(100);
        events.add("beforeEach");
    }

    @AfterEach
    void afterEach() {
        account = null;
        events.add("afterEach");
    }

    @Test
    void freshAccountEachTest() {
        assertThat(account.getBalance()).isEqualTo(100.0);
        account.deposit(50);
        assertThat(account.getBalance()).isEqualTo(150.0);
    }

    @Test
    void anotherTestStartsFresh() {
        assertThat(account.getBalance()).isEqualTo(100.0);
    }

    @Test
    void hooksFiredInOrder() {
        assertThat(events).startsWith("beforeAll");
        assertThat(events).contains("beforeEach", "afterEach");
    }
}
