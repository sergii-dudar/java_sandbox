package ua.serhii.application;

import org.apache.commons.collections4.CollectionUtils;
import ua.serhii.application.com1.TestClass;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<String> list = List.of("");
        System.out.println("Hello, World from Maven project! " + CollectionUtils.isEmpty(list));
        System.out.println("Instance: " + TestClass.INSTANCE);
    }
}
