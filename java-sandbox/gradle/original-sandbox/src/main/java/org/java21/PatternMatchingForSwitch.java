package org.java21;

/**
 * https://mydeveloperplanet.com/2023/11/01/whats-new-between-java-17-and-java-21/
 * https://advancedweb.hu/a-categorized-list-of-all-java-and-jvm-features-since-jdk-8-to-21/
 */
public class PatternMatchingForSwitch {

    public static void main(String[] args) {
        // patternMatchingSwitchTest();
        // switchNullTest();
        caseRefinementTest();
    }

    private static void patternMatchingSwitchTest() {
        final Object obj = 10;
        oldStylePatternMatching(obj);
        patternMatchingSwitch(obj);
    }

    private static void oldStylePatternMatching(Object obj) {
        if (obj instanceof Integer i) {
            System.out.println("Object is an integer:" + i);
        } else if (obj instanceof String s) {
            System.out.println("Object is a string:" + s);
        } else if (obj instanceof FruitType f) {
            System.out.println("Object is a fruit: " + f);
        } else {
            System.out.println("Object is not recognized");
        }
    }

    private static void patternMatchingSwitch(Object obj) {
        switch (obj) {
            case Integer i -> System.out.println("Object is an integer:" + i);
            case String s -> System.out.println("Object is a string:" + s);
            case FruitType f -> System.out.println("Object is a fruit: " + f);
            default -> System.out.println("Object is not recognized");
        }
    }


    // ---------------------------------------

    public static void switchNullTest() {
        final Object obj = 10;
        oldStyleSwitchNull(obj);
        switchNull(obj);
    }

    private static void oldStyleSwitchNull(Object obj) {
        try {
            switch (obj) {
                case Integer i -> System.out.println("Object is an integer:" + i);
                case String s -> System.out.println("Object is a string:" + s);
                case FruitType f -> System.out.println("Object is a fruit: " + f);
                default -> System.out.println("Object is not recognized");
            }
        } catch (NullPointerException npe) {
            System.out.println("NullPointerException thrown");
        }
    }

    private static void switchNull(Object obj) {
        switch (obj) {
            case Integer i -> System.out.println("Object is an integer:" + i);
            case String s -> System.out.println("Object is a string:" + s);
            case FruitType f -> System.out.println("Object is a fruit: " + f);
            case null -> System.out.println("Object is null");
            default -> System.out.println("Object is not recognized");
        }
    }

    // ---------------------------------------

    public static void caseRefinementTest() {
        final Object obj = FruitType.APPLE;
        inefficientCaseRefinement(obj);
        caseRefinement(obj);
    }

    private static void inefficientCaseRefinement(Object obj) {
        switch (obj) {
            case String s -> System.out.println("Object is a string:" + s);
            case FruitType f -> {
                if (f == FruitType.APPLE) {
                    System.out.println("Object is an apple");
                }
                if (f == FruitType.AVOCADO) {
                    System.out.println("Object is an avocado");
                }
                if (f == FruitType.PEAR) {
                    System.out.println("Object is a pear");
                }
                if (f == FruitType.ORANGE) {
                    System.out.println("Object is an orange");
                }
            }
            case null -> System.out.println("Object is null");
            default -> System.out.println("Object is not recognized");
        }
    }

    private static void caseRefinement(Object obj) {
        switch (obj) {
            case String s -> System.out.println("Object is a string:" + s);
            case FruitType f when (f == FruitType.APPLE) -> {
                System.out.println("Object is an apple");
            }
            case FruitType f when (f == FruitType.AVOCADO) -> {
                System.out.println("Object is an avocado");
            }
            case FruitType f when (f == FruitType.PEAR) -> {
                System.out.println("Object is a pear");
            }
            case FruitType f when (f == FruitType.ORANGE) -> {
                System.out.println("Object is an orange");
            }
            case null -> System.out.println("Object is null");
            default -> System.out.println("Object is not recognized");
        }
    }

    enum FruitType {
        APPLE, AVOCADO, PEAR, ORANGE
    }
}