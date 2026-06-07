package com.example.sandbox;

import java.util.List;

/** String helpers used by the example tests. */
public final class Strings {

    private Strings() {
    }

    public static String sayHi(String name) {
        return "Hi, " + name + "!";
    }

    public static String slugify(String text) {
        return text.toLowerCase().replace(' ', '-');
    }

    public static String reverse(String text) {
        return new StringBuilder(text).reverse().toString();
    }

    public static boolean isPalindrome(String text) {
        return text.equals(reverse(text));
    }

    public static List<String> words(String sentence) {
        if (sentence.isBlank()) {
            return List.of();
        }
        return List.of(sentence.trim().split("\\s+"));
    }
}
