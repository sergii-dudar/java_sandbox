package ua.serhii.application;

import org.apache.commons.collections4.CollectionUtils;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<String> list = List.of("");
        System.out.println("Hello, World! " + CollectionUtils.isEmpty(list));
    }
}
