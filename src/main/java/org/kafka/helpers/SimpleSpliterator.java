package org.kafka.helpers;

import lombok.RequiredArgsConstructor;

import java.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.Supplier;

@RequiredArgsConstructor
public class SimpleSpliterator<T> implements Spliterator<T> {
    private final Supplier<T> nextValueSupplier;
    private Runnable closeCallback;

    public SimpleSpliterator(Supplier<T> nextValueSupplier, Runnable closeCallback) {
        this.nextValueSupplier = nextValueSupplier;
        this.closeCallback = closeCallback;
    }

    @Override
    public boolean tryAdvance(Consumer<? super T> action) {
        T next = nextValueSupplier.get();
        if (next == null) {
            if(closeCallback != null) {
                closeCallback.run();
            }
            return false;
        } else {
            action.accept(next);
            return true;
        }
    }

    @Override
    public Spliterator<T> trySplit() {
        return null;
    }

    @Override
    public long estimateSize() {
        return 0;
    }

    @Override
    public int characteristics() {
        return 0;
    }

    public static <T> SimpleSpliterator<T> from(Supplier<T> nextValueSupplier) {
        return new SimpleSpliterator<>(nextValueSupplier);
    }

    public static <T> SimpleSpliterator<T> from(Supplier<T> nextValueSupplier, Runnable closeCallback) {
        return new SimpleSpliterator<>(nextValueSupplier, closeCallback);
    }

    /*public static void main(String[] args) {
        System.out.println(CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, "AdultUse"));
    }*/
}