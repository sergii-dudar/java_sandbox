package org.kafka.helpers;

@FunctionalInterface
public interface ExceptionFunction<T, R> {
    R apply(T t) throws Exception;
}