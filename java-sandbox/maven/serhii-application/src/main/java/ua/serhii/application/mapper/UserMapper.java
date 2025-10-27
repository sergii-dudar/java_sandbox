package ua.serhii.application.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;
import ua.serhii.application.model.User;
import ua.serhii.application.model.UserDto;

@Mapper(unmappedTargetPolicy = ReportingPolicy.ERROR)
public interface UserMapper {

    @Mapping(target = "age", source = "testAge")
    @Mapping(target = "firstName", source = "testFirstName")
    @Mapping(target = "secondName", source = "testSecondName")
    @Mapping(target = "address", source = "testAddress")
    UserDto toUser(User user);

    @Mapping(target = "street", source = "testStreet")
    UserDto.Address toAddress(User.Address address);
}
