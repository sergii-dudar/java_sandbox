package org.algo.sort;

import java.util.Arrays;

// https://www.javatpoint.com/quick-sort
public class QuickSort {

    /*
     Average Time Complexity: O(n log n)
     Worst-case Time Complexity: O(n^2) (like Bubble Sort)
     Best-case Time Complexity: O(n log n)
     Space Complexity: O(log n) auxiliary space due to recursion (on average), but O(n) in worst case due to the depth of recursion stack.
     */

    public static void main(String[] args) {
        int a[] = {13, 18, 27, 2, 19, 25};
        /*
       13, 18, 27, 2, 19, *25
       pivot arr[last] = 25

       on loop on normalise 2 partitions:
       1. 13 (not > 25), 18, 27, 2, 19, *25
       2. 13, 18(not > 25), 27, 2, 19, *25
       3. 13, 18, 27(> 25 swap), 2, 19, *25 -> 13, 18, *25, 2, 19, 27
       4. 13, 18, *25, 2(< 25 swap), 19, 27 -> 13, 18, 2, *25, 19, 27
       5. 13, 18, 2, *25, 19(< 25 swap), 27  -> 13, 18, 2, 19, *25, 27

        left  - 13, 18, 2, *19 -> 13, 18, 2, *19
        left  - 13, 18, 2*     -> 2*, 13, 18
        right - 13, 18         ->

         13, 18, 2 -> 2, 18, 13 -> 18, 13 ->
        right - 27

        next continue the same with new partitions recursively
         */

/*
Before sorting array elements are -
[13, 18, 27, 2, 19, 25*]

[[13, 18, 2,    19*], 25, [27]]
[[13, 18, 2*],  19,   25,  27]
[ 2, [18, 13*], 19,   25,  27]
[ 2,  13, 18,   19,   25,  27]

After sorting array elements are -
[2, 13, 18, 19, 25, 27]
 */


        int n = a.length;
        System.out.println("\nBefore sorting array elements are - ");
        QuickSort q1 = new QuickSort();
        q1.printArr(a);
        System.out.println();
        q1.quick(a, 0, n - 1);
        System.out.println("\nAfter sorting array elements are - ");
        q1.printArr(a);
        System.out.println();
    }

    /* function that consider last element as pivot,
    place the pivot at its exact position, and place
    smaller elements to left of pivot and greater
    elements to right of pivot.  */
    int partition(int a[], int start, int end) {
        int pivot = a[end]; // pivot element
        int i = (start - 1);

        for (int j = start; j <= end - 1; j++) {
            // If current element is smaller than the pivot
            if (a[j] < pivot) {
                i++; // increment index of smaller element
                int t = a[i];
                a[i] = a[j];
                a[j] = t;
            }
        }
        int t = a[i + 1];
        a[i + 1] = a[end];
        a[end] = t;


        System.out.println(Arrays.toString(a));
        return (i + 1);
    }

    /* function to implement quick sort */
    void quick(int a[], int start, int end) /* a[] = array to be sorted, start = Starting index, end = Ending index */ {
        if (start < end) {
            int p = partition(a, start, end);  //p is partitioning index
            quick(a, start, p - 1);
            quick(a, p + 1, end);
        }
    }

    /* function to print an array */
    void printArr(int a[]) {
        System.out.println(Arrays.toString(a));
    }


}
