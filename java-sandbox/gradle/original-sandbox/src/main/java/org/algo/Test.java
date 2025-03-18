package org.algo;

import java.util.Arrays;

public class Test {

    public static void main(String[] args) {

        double[] a = {1, 4, 5, 6, 7};

        for (int i = 0; i < a.length / 2; i++) {
            double temp = a[i];

            System.out.printf("i=%s, N-1-i=%s%n", i, a.length - 1 - i);

            a[i] = a[a.length - 1 - i];
            a[a.length - i - 1] = temp;
        }

        System.out.println(Arrays.toString(a));
    }
}
