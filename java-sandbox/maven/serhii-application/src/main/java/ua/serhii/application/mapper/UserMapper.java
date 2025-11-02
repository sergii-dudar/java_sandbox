package ua.serhii.application.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;
import ua.serhii.application.model.User;
import ua.serhii.application.model.UserDto;

@Mapper(unmappedTargetPolicy = ReportingPolicy.ERROR)
public interface UserMapper {

    @Mapping(source = "testFirstName", target = "firstName")
    @Mapping(source = "testSecondName", target = "secondName")
    @Mapping(source = "testAge", target = "age")
    @Mapping(source = "testAddress", target = "address")
    UserDto toUser(User user);

    @Mapping(source = "testStreet", target = "street")
    UserDto.Address toAddress(User.Address address);
}
