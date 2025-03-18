package org.example.java21;

import java.time.Duration;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.IntStream;

/**
 * https://mydeveloperplanet.com/2023/11/01/whats-new-between-java-17-and-java-21/
 * https://advancedweb.hu/a-categorized-list-of-all-java-and-jvm-features-since-jdk-8-to-21/
 */
public class VirtualThreads {

    public static void main(String[] args) {

        Thread osThread = new Thread(() -> {});
        Thread virtualThread = Thread.startVirtualThread(() -> {});

        testPlatformThreads(1000);
        testPlatformThreads(10_000);
        testPlatformThreads(100_000);
        testPlatformThreads(1_000_000);
    }

    private static void testPlatformThreads(int maximum) {
        long time = System.currentTimeMillis();

        //try (var executor = Executors.newCachedThreadPool()) {

        AtomicLong counter = new AtomicLong();
        try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
            IntStream.range(0, maximum).forEach(i -> {
                executor.submit(() -> {
                    Thread.sleep(Duration.ofSeconds(1));
                    counter.incrementAndGet();
                    return i;
                });
            });
        }

        time = System.currentTimeMillis() - time;
        System.out.println("Number of threads = " + maximum + ", counter=" + counter.get() + ", Duration(ms) = " + time);
    }
}
