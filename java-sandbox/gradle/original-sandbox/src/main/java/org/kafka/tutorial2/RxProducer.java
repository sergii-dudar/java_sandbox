package org.kafka.tutorial2;

import io.reactivex.Observable;
import io.reactivex.disposables.Disposable;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;
import org.kafka.basics1.ConsumerDemoReply;
import org.kafka.helpers.IOStreamsHelper;
import org.kafka.helpers.JacksonHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Properties;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.TimeUnit;

public class RxProducer {
    private static final Logger logger = LoggerFactory.getLogger(ConsumerDemoReply.class);

    public static void main(String[] args) throws IOException {
        final KafkaProducer<String, String> producer = createProducer();
        final Disposable rx_stream = quoteStreamJson().subscribe(q -> producer.send(new ProducerRecord<>(
            "quotes_topic_avro", null, q), (metadata, e) -> {
            if (e != null) {
                logger.error("error: " + e);
            }
        }));

        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            logger.info("Shutdown hook");
            producer.close();
            rx_stream.dispose();
            logger.info("app is exited");
        }));

        System.in.read();
    }

    public static KafkaProducer<String, String> createProducer() {
        Properties properties = new Properties();
        properties.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        properties.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());

        //safe producer
        properties.setProperty(ProducerConfig.ENABLE_IDEMPOTENCE_CONFIG, "true");
        properties.setProperty(ProducerConfig.ACKS_CONFIG, "all");
        properties.setProperty(ProducerConfig.RETRIES_CONFIG, Integer.toString(Integer.MAX_VALUE));
        properties.setProperty(ProducerConfig.MAX_IN_FLIGHT_REQUESTS_PER_CONNECTION, "5"); //if kafka >= 1.1 (5) else (1)

        //high throughput producer
        properties.setProperty(ProducerConfig.COMPRESSION_TYPE_CONFIG, "snappy");
        properties.setProperty(ProducerConfig.LINGER_MS_CONFIG, "20");
        properties.setProperty(ProducerConfig.BATCH_SIZE_CONFIG, Integer.toString(32 * 1024)); //32 KB

        //producer send more data then broker can handle
        //properties.setProperty(ProducerConfig.BUFFER_MEMORY_CONFIG, ""); // 32 MB by default
        //properties.setProperty(ProducerConfig.MAX_BLOCK_MS_CONFIG, ""); //60 sec by default

        return new KafkaProducer<>(properties);
    }

    public static Observable<String> quoteStreamJson() {
        var quotes = IOStreamsHelper.readFileFromResources("/quotes.txt").split("\n");
        String[] authors = new String[]{
                "William Shakespeare",
                "Agatha Christie",
                "Barbara Cartland",
                "Danielle Steel",
                "Harold Robbins",
                "Georges Simenon",
                "Enid Blyton",
                "Sidney Sheldon",
                "J. K. Rowling",
                "Gilbert Patten",
                "Dr. Seuss",
                "Eiichiro Oda"};
        final ThreadLocalRandom random = ThreadLocalRandom.current();
        return Observable.interval(1, TimeUnit.SECONDS)
                .map(n -> n + 1 + ". " + quotes[random.nextInt(0, quotes.length)])
                .map(q -> new QuoteMessage(UUID.randomUUID().toString(), q.replace("\"", "'"), 1,
                        random.nextInt(0, 100000),
                        authors[random.nextInt(0, authors.length)]))
                .map(JacksonHelper::serialize);
    }
}