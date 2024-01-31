package org.kafka.tutorial3avro;

public class AvroProducer {

/*    private final static String TOPIC = "new-employees";

    public static void main(String... args) {

        Producer<Long, Employee> producer = createProducer();

        Employee bob = Employee.newBuilder().setAge(35)
            .setFirstName("Bob")
            .setLastName("Jones")
            .setPhoneNumber(
                PhoneNumber.newBuilder()
                    .setAreaCode("301")
                    .setCountryCode("1")
                    .setPrefix("555")
                    .setNumber("1234")
                    .build())
            .build();

        IntStream.range(1, 100).forEach(index -> {
            producer.send(new ProducerRecord<>(TOPIC, 1L * index, bob));
        });

        producer.flush();
        producer.close();
    }

    private static Producer<Long, Employee> createProducer() {
        Properties props = new Properties();
        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        props.put(ProducerConfig.CLIENT_ID_CONFIG, "AvroProducer");
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
            LongSerializer.class.getName());

        // Configure the KafkaAvroSerializer.
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,
            KafkaAvroSerializer.class.getName());

        // Schema Registry location.
        props.put(KafkaAvroSerializerConfig.SCHEMA_REGISTRY_URL_CONFIG,
            "http://localhost:8081");

        return new KafkaProducer<>(props);
    }*/

}