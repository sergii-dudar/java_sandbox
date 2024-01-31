package org.kafka.helpers;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer;
import com.fasterxml.jackson.databind.module.SimpleModule;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import one.util.streamex.StreamEx;

import java.io.IOException;
import java.util.Comparator;
import java.util.Map;
import java.util.Set;

@Slf4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class JacksonHelper {
    private static final ObjectMapper OBJECT_MAPPER = createObjectMapper();
    private static final TypeReference<Map<String, Object>> typeRefMap = new TypeReference<>() {
    };
    private static final TypeReference<Map<String, String>> typeRefMapStr = new TypeReference<>() {
    };

    public static ObjectMapper getObjectMapper() {
        return OBJECT_MAPPER;
    }

    public static ObjectMapper getNewObjectMapper() {
        return createObjectMapper();
    }

    public static String serialize(Object o) {
        try {
            return OBJECT_MAPPER.writeValueAsString(o);
        } catch (JsonProcessingException e) {
            log.error(e.toString());
            throw new RuntimeException(e);
        }
    }

    public static Map<String, Object> toMap(Object o) {
        return OBJECT_MAPPER.convertValue(o, typeRefMap);
    }

    public static Map<String, String> toMapStr(String o) {
        return Unchecked.supplier(() -> OBJECT_MAPPER.readValue(o, typeRefMapStr));
    }

    public static <T> T deserializeIfNotMatchType(Object obj, Class<T> clazz) {
        if (obj.getClass() == clazz) {
            return clazz.cast(obj);
        } else if (obj.getClass() == String.class) {
            return deserialize((String) obj, clazz);
        }

        return deserialize(serialize(obj), clazz); //in case obj is Map<> for example
    }

    public static class A {
        int i = 10;
    }

    public static <T> T deserialize(Object map, Class<T> clazz) {
        return deserialize(serialize(map), clazz);
    }

    public static <T> T deserialize(Object map, TypeReference<T> typeReference) {
        return deserialize(serialize(map), typeReference);
    }

    public static <T> T deserialize(String json, Class<T> clazz) {
        try {
            return OBJECT_MAPPER.readValue(json, clazz);
        } catch (IOException e) {
            log.error(e.toString());
            throw new RuntimeException(e);
        }
    }

    public static <T> T deserialize(String json, TypeReference<T> typeReference) {
        try {
            return OBJECT_MAPPER.readValue(json, typeReference);
        } catch (IOException e) {
            log.error(e.toString());
            throw new RuntimeException(e);
        }
    }

    public static boolean isJsonObject(String jsonObject) {
        return jsonObject.startsWith("{") && jsonObject.endsWith("}");
    }

    public static boolean isJsonArray(String jsonObject) {
        return jsonObject.startsWith("[") && jsonObject.endsWith("]");
    }

    @SuppressWarnings("unchecked")
    public static <T> T clone(T source) {
        return (T) deserialize(serialize(source), source.getClass());
    }

    private static ObjectMapper createObjectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        objectMapper.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        objectMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
        objectMapper.findAndRegisterModules();
        /*
        alternative to register
           .registerModule(new ParameterNamesModule())
           .registerModule(new Jdk8Module())
           .registerModule(new JavaTimeModule());
         for supporting new Java DateTime Api etv
        */

        objectMapper.registerModule(new StringTrimModule());
        return objectMapper;
    }

    public static class StringTrimModule extends SimpleModule {
        public StringTrimModule() {
            addDeserializer(String.class, new StringTrimStdScalarDeserializer(String.class));
        }

        public static class StringTrimStdScalarDeserializer extends StdScalarDeserializer<String> {
            private final Set<String> lowerCaseProps = Set.of("mail", "gmail", "email");
            protected StringTrimStdScalarDeserializer(Class<?> vc) {
                super(vc);
            }

            @Override
            public String deserialize(JsonParser jsonParser, DeserializationContext ctx) throws IOException {
                final String stringValue = jsonParser.getValueAsString();
                if(stringValue == null) {
                    return null;
                }

                if ("password".equals(jsonParser.getCurrentName())) {
                    return stringValue;
                }
                if (jsonParser.getCurrentName() != null && lowerCaseProps.contains(jsonParser.getCurrentName())) {
                    return stringValue.trim().toLowerCase();
                }
                return stringValue.trim();
            }
        }
    }

    public static void main(String[] args) {
        //Expected :[TRfe9380b9, TRfe778aef, TRfe628947, TRf824c19b, TRf5c201e3, TRefd3d443, TRe6884afb, TRe3eac89c, TRdfdf20f6, TRdd790924]
        //Actual   :[TRfe9380b9, TRfe778aef, TRfe628947, TRf824c19b, TRf5c201e3, TRe3eac89c, TRefd3d443, TRe6884afb, TRdfdf20f6, TRdd790924]

        System.out.println(
            StreamEx.of(
                    "TRfe9380b9", "TRfe778aef", "TRfe628947", "TRf824c19b", "TRf5c201e3", "TRefd3d443", "TRe6884afb", "TRe3eac89c", "TRdfdf20f6", "TRdd790924")
                .sorted(Comparator.reverseOrder())
                .toList());
    }
    /*
    SQL:
    TRfe9380b9
    TRfe778aef
    TRfe628947
    TRf824c19b
    TRf5c201e3
    TRefd3d443
    TRe6884afb
    TRe3eac89c
    TRdfdf20f6
    TRdd790924
    */
}
