package org.example.java21;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.SequencedMap;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * https://mydeveloperplanet.com/2023/11/01/whats-new-between-java-17-and-java-21/
 * https://advancedweb.hu/a-categorized-list-of-all-java-and-jvm-features-since-jdk-8-to-21/
 */
public class SequencedCollections {

    public static void main(String[] args) {
        sequencedCollection();
        sequencedSet();
        sequencedMap();
    }

    private static void sequencedCollection() {
        System.out.println("\nSequencedCollection\n");

        List<String> sc = Stream.of("Alpha", "Bravo", "Charlie", "Delta")
            .collect(Collectors.toCollection(ArrayList::new));
        System.out.println("Initial list: " + sc);
        System.out.println("Reversed list: " + sc.reversed());
        System.out.println("First item: " + sc.getFirst());
        System.out.println("Last item: " + sc.getLast());
        sc.addFirst("Before Alpha");
        sc.addLast("After Delta");
        System.out.println("Added new first and last item: " + sc);
    }

    private static void sequencedSet() {

        System.out.println("\nSequencedSet\n");

        SortedSet<String> sortedSet = new TreeSet<>(Set.of("Charlie", "Alpha", "Delta", "Bravo"));
        System.out.println("Initial list: " + sortedSet);
        System.out.println("Reversed list: " + sortedSet.reversed());
        System.out.println("First item: " + sortedSet.getFirst());
        System.out.println("Last item: " + sortedSet.getLast());
        try {
            sortedSet.addFirst("Before Alpha");
        } catch (UnsupportedOperationException uoe) {
            System.out.println("addFirst is not supported");
        }
        try {
            sortedSet.addLast("After Delta");
        } catch (UnsupportedOperationException uoe) {
            System.out.println("addLast is not supported");
        }
    }

    private static void sequencedMap() {
        System.out.println("\nSequencedMap\n");

        LinkedHashMap<Integer,String> hm = new LinkedHashMap<Integer,String>();
        hm.put(1, "Alpha");
        hm.put(2, "Bravo");
        hm.put(3, "Charlie");
        hm.put(4, "Delta");
        System.out.println("== Initial List ==");
        printMap(hm);
        System.out.println("== Reversed List ==");
        printMap(hm.reversed());
        System.out.println("First item: " + hm.firstEntry());
        System.out.println("Last item: " + hm.lastEntry());
        System.out.println(" == Added new first and last item ==");
        hm.putFirst(5, "Before Alpha");
        hm.putLast(3, "After Delta");
        printMap(hm);
    }

    private static void printMap(SequencedMap<Integer, String> hm) {
        System.out.println(hm);
    }
}
