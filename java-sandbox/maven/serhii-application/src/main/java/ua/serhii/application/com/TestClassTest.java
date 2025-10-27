package ua.serhii.application.com;

import lombok.Value;

@Value(staticConstructor = "of")
public class TestClassTest {
    public static final TestClassTest INSTANCE = of("Serhii", 25);

    String name;
    int age;
}
