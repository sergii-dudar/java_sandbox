package org.algo.sort;

import java.util.Arrays;

public class QuickSort2 {

    public static void main(String[] args) {
        int[] array = {5, 3, 8, 4, 15, 2, 7, 1, 12, 10, 6, 9};
        System.out.println(Arrays.toString(array));
        System.out.println();

        quickSort(array, 0, array.length - 1);
        System.out.println("Sorted Array: " + Arrays.toString(array));
    }

    public static void quickSort(int[] array, int low, int high) {
        if (low < high) {
            // Partition the array and get the pivot index
            int pivotIndex = partition(array, low, high);

            // Recursively sort elements before and after the pivot
            quickSort(array, low, pivotIndex - 1);
            quickSort(array, pivotIndex + 1, high);
        }
    }

    public static int partition(int[] array, int low, int high) {
        // Choose the pivot (here, we choose the last element)
        int pivot = array[high];

        System.out.printf("[pivot %s]=%s\n", high, pivot);

        // Index of the smaller element
        int i = low - 1;

        // Traverse the array from low to high-1
        for (int j = low; j < high; j++) {
            // If current element is smaller than or equal to the pivot
            if (array[j] <= pivot) {
                // Increment index of smaller element
                i++;

                System.out.printf("[i %s]=%s [j %s]=%s", i, array[i], j, array[j]);

                // Swap array[i] and array[j]
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;

                System.out.println(": " + Arrays.toString(Arrays.copyOfRange(array, low, high + 1)));
            }
        }

        // Swap array[i+1] and array[high] (or the pivot)
        System.out.printf("[i+1 %s]=%s [high %s]=%s: ", i + 1, array[i + 1], high, array[high]);

        int temp = array[i + 1];
        array[i + 1] = array[high];
        array[high] = temp;
        System.out.println(Arrays.toString(Arrays.copyOfRange(array, low, high + 1)));
        System.out.println();


        // Return the pivot index
        return i + 1;
    }
}

