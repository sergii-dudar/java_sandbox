package org.concurrency;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.CyclicBarrier;

/**
 *
 *`CountDownLatch and CyclicBarrier are both synchronization constructs in Java, but they serve different purposes and have different characteristics:

 * CountDownLatch:
 * - CountDownLatch is a synchronization aid that allows one or more threads to wait until a set of operations being performed in other threads completes.
 * - It's initialized with a count, and each countDown() call decrements the count until it reaches zero.
 * - Threads waiting on the latch will block until the count reaches zero.
 * - Once the count reaches zero, the waiting threads are released and can proceed.
 * - It's typically used when one or more threads need to wait for a set of operations to complete before they can proceed.

 * CyclicBarrier:
 * - CyclicBarrier is a synchronization aid that allows a fixed number of threads to wait for each other at a common point before proceeding.
 * - It's initialized with a count, and each thread that reaches the barrier point waits until all other threads have also reached that point.
 * - Once the required number of threads have reached the barrier, they are released simultaneously, and the barrier is reset.
 * - It's typically used when a group of threads must wait for each other at a predefined execution point before continuing execution together.
 * - Unlike CountDownLatch, CyclicBarrier can be reused after the waiting threads are released.

 * In summary, CountDownLatch is used for one-time synchronization where a fixed number of operations need to complete before proceeding, while CyclicBarrier is used for repeated synchronization among a fixed number of threads at predefined points in their execution.
 */
public class BarrierVsLatchExample {

    public static void main(String[] args) throws InterruptedException {
        System.out.println("cyclicBarrierExample:");
        cyclicBarrierExample();

        Thread.sleep(1000);
        System.out.println("\ncountDownLatchExample:");
        countDownLatchExample();
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
