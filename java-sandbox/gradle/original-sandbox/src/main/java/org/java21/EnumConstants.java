package org.java21;

import org.java21.PatternMatchingForSwitch.FruitType;

/**
 * https://mydeveloperplanet.com/2023/11/01/whats-new-between-java-17-and-java-21/
 * https://advancedweb.hu/a-categorized-list-of-all-java-and-jvm-features-since-jdk-8-to-21/
 */
public class EnumConstants {

    public static void main(String[] args) {
        runTest();
    }

    private static void runTest() {
        final Object obj = CarType.CABRIO;
        inefficientEnumConstants(obj);
        enumConstants(obj);
    }

    private static void inefficientEnumConstants(Object obj) {
        switch (obj) {
            case String s -> System.out.println("Object is a string:" + s);
            case FruitType f when (f == FruitType.APPLE) -> System.out.println("Object is an apple");
            case FruitType f when (f == FruitType.AVOCADO) -> System.out.println("Object is an avocado");
            case FruitType f when (f == FruitType.PEAR) -> System.out.println("Object is a pear");
            case FruitType f when (f == FruitType.ORANGE) -> System.out.println("Object is an orange");
            case CarType c when (c == CarType.CABRIO) -> System.out.println("Object is a cabrio");
            case null -> System.out.println("Object is null");
            default -> System.out.println("Object is not recognized");
        }
    }

    private static void enumConstants(Object obj) {
        switch (obj) {
            case String s -> System.out.println("Object is a string:" + s);
            case FruitType.APPLE -> System.out.println("Object is an apple");
            case FruitType.AVOCADO -> System.out.println("Object is an avocado");
            case FruitType.PEAR -> System.out.println("Object is a pear");
            case FruitType.ORANGE -> System.out.println("Object is an orange");
            case CarType.CABRIO -> System.out.println("Object is a cabrio");
            case null -> System.out.println("Object is null");
            default -> System.out.println("Object is not recognized");
        }
    }

    public enum CarType {
        SUV, CABRIO, EV
    }
}