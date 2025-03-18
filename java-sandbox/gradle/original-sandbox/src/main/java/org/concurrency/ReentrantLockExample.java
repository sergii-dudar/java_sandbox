package org.concurrency;

import one.util.streamex.StreamEx;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ReentrantLockExample {

    public static void main(String[] args) {
        final Runnable action = () -> {
            synchronized (ReentrantLockExample.class) {
                try {
                    System.out.println(Thread.currentThread().getName());
                    Thread.sleep(10);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        };

        final Lock lock = new ReentrantLock(true);
        final Runnable actionLock = () -> {
            try {
                lock.lock();
                lock.lock();
                lock.lock();
                lock.lock();
                lock.lock();
                try {
                    Thread.sleep(10);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            } finally {
                lock.unlock();
                lock.unlock();
                lock.unlock();
                lock.unlock();
                lock.unlock();
            }
            synchronized (ReentrantLockExample.class) {
                try {
                    System.out.println(Thread.currentThread().getName());
                    Thread.sleep(10);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        };

        StreamEx.iterate(1, integer -> integer + 1)
            .map(num -> new Thread(actionLock, "thread num: " + num))
            .limit(5)
            .forEach(Thread::start);


        System.out.println("wait threads");
    }
}
