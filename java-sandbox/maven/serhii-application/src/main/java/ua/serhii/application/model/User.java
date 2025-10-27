package ua.serhii.application.model;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class User {
    String testFirstName;
    String testSecondName;
    int testAge;
    Address testAddress;

    @Value
    @Builder
    public static class Address {
        String testStreet;
    }
}
