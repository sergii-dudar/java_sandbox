package org.kafka;

import io.reactivex.Observable;
import io.reactivex.schedulers.Schedulers;

public class Runner {
    public static void main(String[] args) {
        Observable.fromArray(1, 2, 3, 4, 5, 6, 7, 8, 9)
                // .timeInterval(TimeUnit.SECONDS.)
                .observeOn(Schedulers.trampoline())
                .doOnNext(System.out::println)
                .subscribe();

        System.out.println();
    }
}
