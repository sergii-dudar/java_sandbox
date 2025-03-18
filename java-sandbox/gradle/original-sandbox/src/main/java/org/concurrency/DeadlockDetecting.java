package org.concurrency;

public class DeadlockDetecting {

    public static void main(String[] args) {
        final Object monitor1 = new Object();
        final Object monitor2 = new Object();

        Thread thread1 = new Thread(() -> {
            synchronized (monitor1) {
                System.out.println("Waiting for monitor 2");
                synchronized (monitor2) {
                    System.out.println("Monitor 2 is received");
                }
            }
        });
        Thread thread2 = new Thread(() -> {
            synchronized (monitor2) {
                System.out.println("Waiting for monitor 1");
                synchronized (monitor1) {
                    System.out.println("Monitor 1 is received");
                }
            }
        });
        thread1.start();
        thread2.start();
    }
}
