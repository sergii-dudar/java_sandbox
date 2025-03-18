package org.example.java21;

/**
 * https://mydeveloperplanet.com/2023/11/01/whats-new-between-java-17-and-java-21/
 * https://advancedweb.hu/a-categorized-list-of-all-java-and-jvm-features-since-jdk-8-to-21/
 */
public class CodeSnippets {

    public static void main(String[] args) {
        runTest();
    }

    private static void runTest() {
    }

    /**
     * this is an example in Java 17:
     *
     * <pre>{@code
     *    if (success) {
     *        System.out.println("This is a success!");
     *    } else {
     *        System.out.println("This is a failure");
     *    }
     * }
     * </pre>
     * @param success
     */
    public void example1(boolean success) {
        if (success) {
            System.out.println("This is a success!");
        } else {
            System.out.println("This is a failure");
        }
    }

    /**
     * this is an example for inline snippets
     * {@snippet :
     *    if (success) {
     *        System.out.println("This is a success!");
     *    } else {
     *        System.out.println("This is a failure");
     *    }
     * }
     *
     * @param success
     */
    public void example2(boolean success) {
        if (success) {
            System.out.println("This is a success!");
        } else {
            System.out.println("This is a failure");
        }
    }
}
