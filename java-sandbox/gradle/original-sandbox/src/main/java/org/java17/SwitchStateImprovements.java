package org.example.java17;

public class SwitchStateImprovements {

    public static void main(String[] args) {
        runTest();
    }

    private static void withYield(Fruit fruit) {
        String text = switch (fruit) {
            case APPLE, PEAR -> {
                System.out.println("the given fruit was: " + fruit);
                yield "Common fruit";
            }
            case ORANGE, AVOCADO -> "Exotic fruit";
            default -> "Undefined fruit";
        };
        System.out.println(text);
    }

    private static void withReturnValueEvenShorter(Fruit fruit) {
        System.out.println(
            switch (fruit) {
                case APPLE, PEAR -> "Common fruit";
                case ORANGE, AVOCADO -> "Exotic fruit";
                default -> "Undefined fruit";
            });
    }

    private static void withReturnValue(Fruit fruit) {
        String text = switch (fruit) {
            case APPLE, PEAR -> "Common fruit";
            case ORANGE, AVOCADO -> "Exotic fruit";
            default -> "Undefined fruit";
        };
        System.out.println(text);
    }

    private static void withSwitchExpression(Fruit fruit) {
        switch (fruit) {
            case APPLE, PEAR -> System.out.println("Common fruit");
            case ORANGE, AVOCADO -> System.out.println("Exotic fruit");
            default -> System.out.println("Undefined fruit");
        }
    }

    private static void runTest() {
        Fruit fruit = Fruit.APPLE;
        String text = switch (fruit) {
            case APPLE, PEAR: {
                System.out.println("the given fruit was: " + fruit);
                yield "Common fruit";
            }
            case ORANGE, AVOCADO:
                yield "Exotic fruit";
            default:
                yield "Undefined fruit";
        };
        System.out.println(text);
    }

    public enum Fruit {
        APPLE,
        PEAR,
        ORANGE,
        AVOCADO
    }
}
