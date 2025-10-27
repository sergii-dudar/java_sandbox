package ua.serhii.application;

import org.apache.commons.collections4.CollectionUtils;
import ua.serhii.application.com.TestClassTest;
import ua.serhii.application.mapper.UserMapper;
import ua.serhii.application.mapper.UserMapperImpl;
import ua.serhii.application.model.User;
import ua.serhii.application.model.User.Address;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<String> list = List.of("");
        System.out.println("Hello, World from Maven project! " + CollectionUtils.isEmpty(list));
        System.out.println("Instance: " + TestClassTest.INSTANCE);

        UserMapper mapper = new UserMapperImpl();
        System.out.println(mapper.toUser(User.builder()
                .testAge(25)
                .testFirstName("Serhii")
                .testSecondName("Dudar")
                .testAddress(Address.builder()
                        .testStreet("Kievska")
                        .build())
                .build()));
    }
}
