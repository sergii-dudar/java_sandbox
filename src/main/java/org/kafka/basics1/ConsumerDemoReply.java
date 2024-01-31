package org.kafka.basics1;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.TopicPartition;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.Duration;
import java.util.List;
import java.util.Properties;

public class ConsumerDemoReply {
    private static final Logger logger = LoggerFactory.getLogger(ConsumerDemoReply.class);

    public static void main(String[] args) {
        Properties properties = new Properties();
        properties.setProperty(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        properties.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        //properties.setProperty(ConsumerConfig.CLIENT_ID_CONFIG, "my-service-id");
        //properties.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "my-first-application"); group dont needed for reply

        //need to first run of new consumer-group, for second run for same group will no any effects
        //properties.setProperty(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest" /*earliest/latest/none*/);

        KafkaConsumer<String, String> consumer = new KafkaConsumer<>(properties);

        //assign
        TopicPartition partitionToReadFrom = new TopicPartition("first_topic", 0);
        long offsetToReadFrom = 5L;
        consumer.assign(List.of(partitionToReadFrom));

        //seek
        consumer.seek(partitionToReadFrom, offsetToReadFrom);

        int numberOfMessagesReadProgress = 0;
        int numberOfMessagesToRead = 10;

        while (numberOfMessagesReadProgress < numberOfMessagesToRead) {
            ConsumerRecords<String, String> records = consumer.poll(Duration.ofMillis(100));

            for (ConsumerRecord<String, String> record : records) {
                logger.info("Key: {}, Value: {}, Topic: {}, Partition: {}, Offset: {}, Timestamp: {}"
                        , record.key(), record.value(), record.topic(), record.partition(), record.offset(), record.timestamp());

                if (++numberOfMessagesReadProgress >= numberOfMessagesToRead) {
                    break;
                }
            }
        }


    }
}
