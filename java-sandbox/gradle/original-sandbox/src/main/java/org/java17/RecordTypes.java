package org.java17;

public class RecordTypes {

    public static void main(String[] args) {
        runTest();
    }

    private static void runTest() {

        Fruit fruit = new Fruit("Apple", 100);
        System.out.println(fruit.price());
    }

    public record Fruit(String name, int price) {

    }
}