package ua.serhii.application;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

public class Tests {

    @Test
    void testSomething() {
        Assertions.assertThat(2 + 2).isEqualTo(4);
        System.out.println("Test passed successfully.");
    }
}
