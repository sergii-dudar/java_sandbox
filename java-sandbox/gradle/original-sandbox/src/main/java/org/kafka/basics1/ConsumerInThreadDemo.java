package org.kafka.basics1;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.errors.WakeupException;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.Duration;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.CountDownLatch;

public class ConsumerInThreadDemo {
    private static final Logger logger = LoggerFactory.getLogger(ConsumerInThreadDemo.class);

    public static void main(String[] args) {
        CountDownLatch latch = new CountDownLatch(1);
        ConsumerRunnable runnable = new ConsumerRunnable(latch);

        new Thread(runnable).start();

        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            logger.info("Shutdown hook");
            runnable.shutdown();
            try {
                latch.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            logger.info("app is exited");
        }));

        try {
            latch.await();
        } catch (InterruptedException e) {
            logger.error("app is interrupted", e);
        } finally {
            logger.error("app is closing");
        }
    }

    public static class ConsumerRunnable implements Runnable {
        private final KafkaConsumer<String, String> consumer;
        private final CountDownLatch latch;
        private static final Logger logger = LoggerFactory.getLogger(ConsumerRunnable.class);

        public ConsumerRunnable(CountDownLatch latch) {
            this.latch = latch;

            Properties properties = new Properties();
            properties.setProperty(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
            properties.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
            properties.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
            //properties.setProperty(ConsumerConfig.CLIENT_ID_CONFIG, "my-service-id");
            properties.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "my-first-application");

            //need to first run of new consumer-group, for second run for same group will no any effects
            properties.setProperty(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest" /*earliest/latest/none*/);

            consumer = new KafkaConsumer<>(properties);
            consumer.subscribe(List.of("first_topic"));
        }

        @Override
        public void run() {
            try {
                while (true) {
                    ConsumerRecords<String, String> records = consumer.poll(Duration.ofMillis(100));
                    for (ConsumerRecord<String, String> record : records) {
                        logger.info("Key: {}, Value: {}, Topic: {}, Partition: {}, Offset: {}, Timestamp: {}"
                                , record.key(), record.value(), record.topic(), record.partition(), record.offset(), record.timestamp());
                    }
                }
            } catch (WakeupException e) {
                logger.info("received shutdown signal!");
            } finally {
                consumer.close();
                latch.countDown();
            }
        }

        public void shutdown(){
            //to interrupt consumer.poll()
            //throw WakeUpException
            consumer.wakeup();
        }
    }
}
