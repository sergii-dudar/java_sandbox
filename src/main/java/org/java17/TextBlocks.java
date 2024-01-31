package org.example.java17;

public class TextBlocks {

    public static void main(String[] args) {
        runTest();
    }

    private static void runTest() {
        String text = """
              {
                "name": "John Doe",
                "age": 45,
                "address": "Doe Street, 23, Java Town"
              }
            """;
        System.out.println(text);
    }
}
