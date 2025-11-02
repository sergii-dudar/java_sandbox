package org.java21;

import java.awt.Color;

/**
 * https://mydeveloperplanet.com/2023/11/01/whats-new-between-java-17-and-java-21/
 * https://advancedweb.hu/a-categorized-list-of-all-java-and-jvm-features-since-jdk-8-to-21/
 */
public class RecordPatterns {

    public static void main(String[] args) {
        singleRecordPattern();
        singleRecordPatternOldStyle();
    }

    private static void singleRecordPattern() {
        Object o = new GrapeRecord(Color.BLUE, 2);
        if (o instanceof GrapeRecord(Color color, Integer nbrOfPits)) {
            System.out.println("This grape has " + nbrOfPits + " pits.");
        }

        Object o2 = new SpecialGrapeRecord(new GrapeRecord(Color.BLUE, 2), true);
        if (o2 instanceof SpecialGrapeRecord(GrapeRecord(Color color, Integer nbrOfPits), boolean special)) {
            System.out.println("This grape has " + nbrOfPits + " pits.");
        }
    }

    private static void singleRecordPatternOldStyle() {
        Object o = new GrapeRecord(Color.BLUE, 2);
        if (o instanceof GrapeRecord grape) {
            System.out.println("This grape has " + grape.nbrOfPits() + " pits.");
        }
    }

    public record GrapeRecord(Color color, Integer nbrOfPits) {

    }

    record SpecialGrapeRecord(GrapeRecord grape, boolean special) {

    }
}