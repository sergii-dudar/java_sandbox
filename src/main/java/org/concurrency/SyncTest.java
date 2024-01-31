package org.example.concurrency;

public class SyncTest {

    public static void main(String[] args) {
        final SyncTest syncTest = new SyncTest();

        synchronized (syncTest) {
            synchronized (syncTest) {
                synchronized (syncTest) {
                    System.out.println("pass");
                }
            }
        }
    }

}
