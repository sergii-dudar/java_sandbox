package org.java17;

import java.awt.Color;
import java.util.HashMap;

public class NPEInfoImprove {

    public static void main(String[] args) {
        runTest();
    }

    private static void runTest() {
        record Grape(Color color, int number) {
        };

        HashMap<String, Grape> grapes = new HashMap<>();
        grapes.put("grape1", new Grape(Color.BLUE, 2));
        grapes.put("grape2", new Grape(Color.white, 4));
        grapes.put("grape3", null);
        var color = ((Grape) grapes.get("grape3")).color();
    }
}