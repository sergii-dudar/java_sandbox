package ua.serhii.application.model;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class UserDto {
    String firstName;
    String secondName;
    int age;
    Address address;

    @Value
    @Builder
    public static class Address {
        String street;
    }
}
