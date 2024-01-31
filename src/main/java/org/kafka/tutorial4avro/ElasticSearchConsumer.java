package org.kafka.tutorial4avro;

public class ElasticSearchConsumer {

/*    private static final Logger logger = LoggerFactory.getLogger(ElasticSearchConsumer.class);

    public static void main(String[] args) {
        //final RestHighLevelClient client = createClient();
        final KafkaConsumer<String, QuoteMessageAvro> consumer = createConsumer();
        final Observable<QuoteMessageAvro> quoteMessageObservable = quotesStream(consumer);

        quoteMessageObservable.subscribe(quoteMessage -> {
            System.out.println(quoteMessage);
        });
    }


    public static KafkaConsumer<String, QuoteMessageAvro> createConsumer() {
        Properties properties = new Properties();
        properties.setProperty(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());

        properties.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, KafkaAvroDeserializer.class.getName()); //++++
        properties.setProperty(KafkaAvroDeserializerConfig.SPECIFIC_AVRO_READER_CONFIG, "true"); //++++
        properties.setProperty(KafkaAvroDeserializerConfig.SCHEMA_REGISTRY_URL_CONFIG, "http://localhost:8081"); //++++

        properties.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "quotes_topic_avro-application");
        properties.setProperty(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");

        properties.setProperty(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false"); //we want to do it manually
        properties.setProperty(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, "10"); //by 10 records max in one poll batch request

        KafkaConsumer<String, QuoteMessageAvro> consumer = new KafkaConsumer<>(properties);
        consumer.subscribe(List.of("quotes_topic_avro"));
        return consumer;
    }

    public static Observable<QuoteMessageAvro> quotesStream(KafkaConsumer<String, QuoteMessageAvro> consumer) {
        //can be in parallel
        return Observable.create(emitter -> {
            while (true) {
                final ConsumerRecords<String, QuoteMessageAvro> batch = consumer.poll(Duration.ofMillis(100));
                for (ConsumerRecord<String, QuoteMessageAvro> record : batch) {
                    //emitter.onNext(JacksonHelper.deserialize(record.value(), QuoteMessage.class));
                    emitter.onNext(record.value());
                }
                consumer.commitSync();
            }
        });
    }*/
}
