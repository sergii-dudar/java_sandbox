package org.test;

import com.google.common.base.Splitter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.SneakyThrows;
import org.utils.JsonUtil;

import java.util.Arrays;
import java.util.List;
import java.util.UUID;

public class Tests {

    @SneakyThrows
    public static void main(String[] args) {

        List<Data> data = Arrays.asList(
            JsonUtil.OBJECT_MAPPER.reader().forType(Data.class.arrayType()).readValue("[{\"id\": \"tr\"}, {\"id\": \"tr\"}]"));

        System.out.println("someghing test");
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @lombok.Data
    public static class Data {
        private String id;
    }
}