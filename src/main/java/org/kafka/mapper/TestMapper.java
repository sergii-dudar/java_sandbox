package org.kafka.mapper;

import org.kafka.mapper.model.Test1;
import org.kafka.mapper.model.Test2;
import org.mapstruct.Mapper;

@Mapper
public interface TestMapper {
    Test2 toTest(Test1 test1);

    //Test2.Test2Builder toTestBuilder(Test1 test1);
}
