package ua.serhii.application.com1;

import lombok.Value;

@Value(staticConstructor = "of")
public class TestClass {
    public static final TestClass INSTANCE = of("Serhii", 25);

    String name;
    int age;
}
