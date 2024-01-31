package org.kafka.helpers;

@FunctionalInterface
public interface ExceptionRunnable {
    void run() throws Exception;
}