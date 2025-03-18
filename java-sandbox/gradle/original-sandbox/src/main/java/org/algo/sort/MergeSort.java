package org.algo.sort;

import java.util.Arrays;

public class MergeSort {
    /*
    Time Complexity: O(n log n) in all cases (average, worst, and best)
    Space Complexity: O(n) auxiliary space for the additional array required for merging.
     */

    public static void main(String args[]) {
        int[] array = {11, 30, 24, 7, 31, 16, 39, 41};

        System.out.println("\nBefore sorting array elements are - " + Arrays.toString(array));

        mergeSort(array, 0, array.length - 1);

        System.out.println("\nAfter sorting array elements are - " + Arrays.toString(array));
    }

    public static void mergeSort(int[] array, int beg, int end) {
        if (beg < end) {
            int mid = (beg + end) / 2;
            mergeSort(array, beg, mid);
            mergeSort(array, mid + 1, end);
            merge(array, beg, mid, end);
        }
    }

    public static void merge(int[] array, int beg, int mid, int end) {
        int i, j, k;
        int n1 = mid - beg + 1;
        int n2 = end - mid;

        /* temporary Arrays */
        int[] leftArray = new int[n1];
        int[] rightArray = new int[n2];

        /* copy data to temp arrays */
        for (i = 0; i < n1; i++) {
            leftArray[i] = array[beg + i];
        }
        for (j = 0; j < n2; j++) {
            rightArray[j] = array[mid + 1 + j];
        }

        i = 0; /* initial index of first sub-array */
        j = 0; /* initial index of second sub-array */
        k = beg;  /* initial index of merged sub-array */

        while (i < n1 && j < n2) {
            if (leftArray[i] <= rightArray[j]) {
                array[k] = leftArray[i];
                i++;
            } else {
                array[k] = rightArray[j];
                j++;
            }
            k++;
        }
        while (i < n1) {
            array[k] = leftArray[i];
            i++;
            k++;
        }

        while (j < n2) {
            array[k] = rightArray[j];
            j++;
            k++;
        }
    }
}
