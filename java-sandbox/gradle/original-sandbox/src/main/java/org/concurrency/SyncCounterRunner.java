package org.concurrency;

public class SyncCounterRunner {

    public static void main(String[] args) {
        final SyncCounter counter = new SyncCounter();

        final Runnable action = () -> {
            for (int i = 0; i < 1_000_000; i++) {
                counter.incCount();
            }
            System.out.println(counter.getCount());
        };

        final Thread thread1 = new Thread(action);
        final Thread thread2 = new Thread(action);

        thread1.start();
        thread2.start();
    }

    private static class SyncCounter {

        private long counter;

        public synchronized void incCount() {
            this.counter++;
        }

        public long getCount() {
            return this.counter;
        }
    }
}