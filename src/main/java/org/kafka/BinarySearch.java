package org.kafka;

public class BinarySearch {

    // Function to perform binary search on a sorted array
    static int binarySearch(int[] arr, int target) {
        int low = 0;
        int high = arr.length - 1;

        while (low <= high) {
            int mid = (low + high) / 2;

            // Check if target is present at mid
            if (arr[mid] == target)
                return mid;

                // If target is greater, ignore the left half
            else if (arr[mid] < target)
                low = mid + 1;

                // If target is smaller, ignore the right half
            else
                high = mid - 1;
        }

        // If we reach here, then the element was not present
        return -1;
    }

    // Example usage
    public static void main(String[] args) {
        int[] sortedArray = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        int targetValue = 7;

        int result = binarySearch(sortedArray, targetValue);

        if (result != -1) {
            System.out.println("Target " + targetValue + " found at index " + result + ".");
        } else {
            System.out.println("Target " + targetValue + " not found in the array.");
        }
    }
}
