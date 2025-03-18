package org.kafka.tutorial2;

import io.reactivex.Observable;
import org.apache.http.HttpHost;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.kafka.helpers.JacksonHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.Duration;
import java.util.List;
import java.util.Properties;

public class ElasticSearchConsumer {
    private static final Logger logger = LoggerFactory.getLogger(ElasticSearchConsumer.class);

    public static void main(String[] args) {
        //final RestHighLevelClient client = createClient();
        final KafkaConsumer<String, String> consumer = createConsumer();

        //consumer.endOffsets()

        final Observable<QuoteMessage> quoteMessageObservable = quotesStream(consumer);

        quoteMessageObservable.subscribe(quoteMessage -> {
            //IndexRequest request = new IndexRequest("rx_stream")
            //        .id(quoteMessage.getId())
            //        .source(JacksonHelper.serialize(quoteMessage), XContentType.JSON);
            //final IndexResponse indexResponse = client.index(request, RequestOptions.DEFAULT);
            //logger.info("http://localhost:9200/rx_stream/quotes/{}", indexResponse.getId());
            System.out.println(quoteMessage);
        });
    }


    public static RestHighLevelClient createClient() {
        final RestClientBuilder builder = RestClient.builder(new HttpHost("localhost", 9200, "http"));
        return new RestHighLevelClient(builder);
    }

    public static KafkaConsumer<String, String> createConsumer() {
        Properties properties = new Properties();
        properties.setProperty(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        properties.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        properties.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "quotes_topic-application");
        properties.setProperty(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");

        properties.setProperty(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false"); //we want to do it manually
        properties.setProperty(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, "10"); //by 10 records max in one poll batch request

        KafkaConsumer<String, String> consumer = new KafkaConsumer<>(properties);
        consumer.subscribe(List.of("quotes_topic"));
        return consumer;
    }

    public static Observable<QuoteMessage> quotesStream(KafkaConsumer<String, String> consumer) {
        //can be in parallel
        return Observable.create(emitter -> {
            while (true) {
                final ConsumerRecords<String, String> batch = consumer.poll(Duration.ofMillis(100));
                //logger.info("received {} records", batch.count());
                for (ConsumerRecord<String, String> record : batch) {
                    emitter.onNext(JacksonHelper.deserialize(record.value(), QuoteMessage.class));
                }
                //logger.info("committing offsets");
                consumer.commitSync(); //commit offset manually
                //logger.info("offsets committed");
            }
        });
    }
}
