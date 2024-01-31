package org.kafka.basics1;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Properties;
import java.util.concurrent.ExecutionException;

public class ProducerDemo {

    private static final Logger logger = LoggerFactory.getLogger(ProducerDemo.class);

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        Properties properties = new Properties();
        properties.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        properties.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());

        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(properties);
        for (int i = 0; i < 10; i++) {
            String key = "id_" + i;
            logger.info(key);
            //ProducerRecord<String, String> record = new ProducerRecord<>("first_topic", "hello world " + i);
            ProducerRecord<String, String> record = new ProducerRecord<>("first_topic", key, "hello world " + i);
            producer.send(record, (metadata, e) -> {
                if (e == null) {
                    logger.info("Received new metadata: Topic: {}, Partition: {}, Offset: {}, Timestamp: {}"
                        , metadata.topic(), metadata.partition(), metadata.offset(), metadata.timestamp());
                } else {
                    logger.error("error: " + e);
                }
            });//.get();
            producer.flush();
        }
        producer.close();

    }
}
