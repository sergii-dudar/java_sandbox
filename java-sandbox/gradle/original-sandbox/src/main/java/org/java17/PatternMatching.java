package org.example.java17;

import java.awt.*;

/**
 * https://medium.com/javarevisited/java-17-vs-java-11-exploring-the-latest-features-and-improvements-6d13290e4e1a
 * https://dzone.com/articles/whats-new-between-java-11-and-java-17
 */
public class PatternMatching {

    public static void main(String[] args) {
        runTest();
        patternMatchingScope();
        patternMatchingScopeException();
    }

    private static void runTest() {
        Object o = new GrapeClass(Color.BLUE, 2);
        if (o instanceof GrapeClass grape) {
            System.out.println("This grape has " + grape.number() + " pits.");
        }
    }

    private static void patternMatchingScope() {
        Object o = new GrapeClass(Color.BLUE, 2);
        if (o instanceof GrapeClass grape && grape.number() == 2) {
            System.out.println("This grape has " + grape.number() + " pits.");
        }
    }

    private static void patternMatchingScopeException() {
        Object o = new GrapeClass(Color.BLUE, 2);
        if (!(o instanceof  GrapeClass grape)) {
            throw new RuntimeException();
        }
        System.out.println("This grape has " + grape.number() + " pits.");
    }

    public record GrapeClass(Color color, int number) {}
}
