package org.kafka.tutorial5.streams.official;

import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.LongDeserializer;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.kafka.helpers.IOStreamsHelper;

import java.time.Duration;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

@Slf4j
public class TestStreamProducerConsumer {

    public static final String WORLD_SOURCE_TOPIC_NAME = "streams-plaintext-input";
    //String singTopicName = "streams-plaintext-input";// "streams-wordcount-output";
    public static final String WORLD_SINK_TOPIC_NAME = "streams-wordcount-output";

    public static void main(String[] args) {
        new Thread(() -> runProducerJobValueToTopic(WORLD_SOURCE_TOPIC_NAME)).start();
        runConsumeJobValueFromTopic(WORLD_SINK_TOPIC_NAME);

        System.out.println("done");
    }

    @SneakyThrows
    private static void runProducerJobValueToTopic(String topicName) {
        var quotes = IOStreamsHelper.readFileFromResources("/quotes.txt").split("\n");
        final ThreadLocalRandom random = ThreadLocalRandom.current();

        Properties properties = new Properties();
        properties.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        properties.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());

        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(properties);
        for (int i = 0; ; i++) {
            //String key = "id_" + i;
            String key = "id_";
            //String value = i + 1 + ". " + quotes[random.nextInt(0, quotes.length)];
            String value = "hello world";
            System.out.println("produced - " + key + "/" + value);

            ProducerRecord<String, String> record = new ProducerRecord<>(topicName, key, value);
            producer.send(record);
            producer.flush();
            Thread.sleep(1000);
        }
        //producer.close();
    }

    @SneakyThrows
    private static void runConsumeJobValueFromTopic(String topicName) {
        Properties properties = new Properties();
        properties.setProperty(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        //properties.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        properties.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, LongDeserializer.class.getName());
        //properties.setProperty(ConsumerConfig.CLIENT_ID_CONFIG, "my-service-id");
        properties.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "my-stream-application");

        //need to first run of new consumer-group, for second run for same group will no any effects
        properties.setProperty(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest" /*earliest/latest/none*/);

        KafkaConsumer<String, Long> consumer = new KafkaConsumer<>(properties);
        consumer.subscribe(List.of(topicName));

        try {
            while (true) {
                ConsumerRecords<String, Long> records = consumer.poll(Duration.ofMillis(100));

                for (ConsumerRecord<String, Long> record : records) {
                /*log.info("Key: {}, Value: {}, Topic: {}, Partition: {}, Offset: {}, Timestamp: {}"
                    , record.key(), record.value(), record.topic(), record.partition(), record.offset(), record.timestamp());*/

                    System.out.println("consumed - " + record.key() + "/" + record.value());
                }
                Thread.sleep(500);
            }
        } catch (Throwable ex) {
            System.out.println(ex);
            throw ex;
        }
    }
}
