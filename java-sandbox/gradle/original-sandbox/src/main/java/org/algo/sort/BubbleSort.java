package org.algo.sort;

import java.util.Arrays;

public class BubbleSort {

    /*
    Average Time Complexity: O(n^2)
    Worst-case Time Complexity: O(n^2)
    Best-case Time Complexity: O(n)
    Space Complexity: O(1) because it operates directly on the input array without requiring additional space.
     */



    public static void main(String[] args) {

        /*BlockingQueue
            LinkedBlockingQueue
        ArrayBlockingQueue*/

        //AtomicBoolean atomicBoolean = new AtomicBoolean();
        //atomicBoolean.compareAndSet()

        int[] a = {35, 10, 31, 11, 26};
        System.out.println("Before sorting array elements are - " + Arrays.toString(a));

        bubbleSort(a);

        System.out.println("After sorting array elements are - " + Arrays.toString(a));
    }

    public static void bubbleSort(int[] a) {
        int length = a.length;
        int i, j, temp;
        for (i = 0; i < length; i++) {
            for (j = i + 1; j < length; j++) {
                if (a[j] < a[i]) {
                    temp = a[i];
                    a[i] = a[j];
                    a[j] = temp;
                }
            }
        }
    }
}
