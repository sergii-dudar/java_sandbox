package org.utils;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.module.SimpleModule;
import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;
import java.util.TimeZone;
import java.util.regex.Pattern;

@Slf4j
@UtilityClass
public class JsonUtil {

    public static final ObjectMapper OBJECT_MAPPER = createObjectMapper();
    private static final Pattern JSON_SPECIAL_SYMBOLS_PATTERN = Pattern.compile("[\\n\\r\\t]");

    private static ObjectMapper createObjectMapper() {
        SimpleModule module = new SimpleModule();
        module.addDeserializer(BigDecimal.class, new JsonDeserializer<>() {
            @Override
            public BigDecimal deserialize(JsonParser p, DeserializationContext context) throws IOException {
                return new BigDecimal(p.getValueAsString()).setScale(2, RoundingMode.HALF_UP);
            }
        });

        final ObjectMapper objectMapper = new Jackson2ObjectMapperBuilder()
                //.modules(new Jdk8Module(), new JavaTimeModule())
                .serializationInclusion(JsonInclude.Include.NON_NULL)
                .featuresToDisable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS,
                        DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
                .visibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY)
                .visibility(PropertyAccessor.GETTER, JsonAutoDetect.Visibility.NONE)
                .visibility(PropertyAccessor.SETTER, JsonAutoDetect.Visibility.NONE)
                .visibility(PropertyAccessor.CREATOR, JsonAutoDetect.Visibility.NONE)
                .timeZone(TimeZone.getTimeZone("GMT"))
                .simpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                .build();

        objectMapper.registerModule(module);

        return objectMapper;
    }

    /**
     * Serialize to json.
     */
    @SneakyThrows
    public static String serialize(Object o) {
        return o == null ? null : OBJECT_MAPPER.writeValueAsString(o);
    }

    /**
     * Convert object.
     */
    public static <T> T convert(Object obj, Class<T> clazz) {
        return obj == null ? null : OBJECT_MAPPER.convertValue(obj, clazz);
    }

    /**
     * Convert object.
     */
    public static <T> T convert(Object obj, TypeReference<T> typeReference) {
        return obj == null ? null : OBJECT_MAPPER.convertValue(obj, typeReference);
    }

    /**
     * Convert object to map.
     */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> convertToMap(Object obj) {
        return (Map<String, Object>) convert(obj, Map.class);
    }

    /**
     * Deserialize json.
     */
    @SneakyThrows
    public static <T> T deserialize(String json, Class<T> clazz) {
        if (json == null) {
            return null;
        }

        try {
            return OBJECT_MAPPER.readValue(json, clazz);
        } catch (JsonMappingException ex) {
            return OBJECT_MAPPER.readValue(escapeSpecialSymbols(json), clazz);
        }
    }

    /**
     * Deserialize json.
     */
    @SneakyThrows
    public static <T> T deserialize(String json, TypeReference<T> typeReference) {
        if (json == null) {
            return null;
        }

        try {
            return OBJECT_MAPPER.readValue(json, typeReference);
        } catch (JsonMappingException ex) {
            return OBJECT_MAPPER.readValue(escapeSpecialSymbols(json), typeReference);
        }
    }

    /**
     * Deserialize bytes.
     */
    @SneakyThrows
    public static <T> T deserialize(byte[] bytes, Class<T> clazz) {
        return bytes == null ? null : OBJECT_MAPPER.readValue(bytes, clazz);
    }

    private String escapeSpecialSymbols(String json) {
        return JSON_SPECIAL_SYMBOLS_PATTERN.matcher(json).replaceAll("");
    }
}
