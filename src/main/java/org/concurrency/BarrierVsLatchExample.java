package org.concurrency;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.CyclicBarrier;

public class BarrierVsLatchExample {

    public static void main(String[] args) throws InterruptedException {
        cyclicBarrierExample();

        // countDownLatchExample();
    }

    private static void countDownLatchExample() throws InterruptedException {
        // CountDownLatch example
        CountDownLatch countDownLatch = new CountDownLatch(3);
        for (int i = 0; i < 3; i++) {
            new Thread(() -> {
                System.out.println(Thread.currentThread().getName() + " is performing an operation.");
                countDownLatch.countDown();
            }).start();
        }
        countDownLatch.await();
        System.out.println("All operations have been completed.");
    }

    private static void cyclicBarrierExample() {
        // CyclicBarrier example
        CyclicBarrier cyclicBarrier = new CyclicBarrier(3);
        for (int i = 0; i < 3; i++) {
            new Thread(() -> {
                System.out.println(Thread.currentThread().getName() + " is waiting at the barrier.");
                try {
                    cyclicBarrier.await();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                System.out.println(Thread.currentThread().getName() + " has crossed the barrier.");
            }).start();
        }
    }
}
