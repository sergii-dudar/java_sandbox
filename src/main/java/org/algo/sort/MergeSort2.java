package org.algo.sort;

import java.util.Arrays;

public class MergeSort2 {

    public static void main(String[] args) {
        int[] array = {5, 3, 8, 4, 15, 2, 7, 1, 12, 10, 6, 9};
        mergeSort(array, 0, array.length - 1);
        System.out.println("Sorted Array: " + Arrays.toString(array));
    }

    public static void mergeSort(int[] array, int low, int high) {
        if (low < high) {
            // Find the middle point to divide the array into two halves
            int mid = low + (high - low) / 2;

            // Recursively sort the first and second halves
            mergeSort(array, low, mid);
            mergeSort(array, mid + 1, high);

            // Merge the sorted halves
            merge(array, low, mid, high);
        }
    }

    public static void merge(int[] array, int low, int mid, int high) {
        // Create temporary arrays to hold the two halves
        int[] leftArray = new int[mid - low + 1];
        int[] rightArray = new int[high - mid];

        // Copy data to temporary arrays
        System.arraycopy(array, low, leftArray, 0, leftArray.length);
        System.arraycopy(array, mid + 1, rightArray, 0, rightArray.length);

        // Merge the two temporary arrays
        int i = 0, j = 0, k = low;
        while (i < leftArray.length && j < rightArray.length) {
            if (leftArray[i] <= rightArray[j]) {
                array[k] = leftArray[i];
                i++;
            } else {
                array[k] = rightArray[j];
                j++;
            }
            k++;
        }

        // Copy remaining elements of leftArray[] if any
        while (i < leftArray.length) {
            array[k] = leftArray[i];
            i++;
            k++;
        }

        // Copy remaining elements of rightArray[] if any
        while (j < rightArray.length) {
            array[k] = rightArray[j];
            j++;
            k++;
        }
    }
}
