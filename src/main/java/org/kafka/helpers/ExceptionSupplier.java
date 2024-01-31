package org.kafka.helpers;

@FunctionalInterface
public interface ExceptionSupplier<T> {
    T get() throws Exception;
}