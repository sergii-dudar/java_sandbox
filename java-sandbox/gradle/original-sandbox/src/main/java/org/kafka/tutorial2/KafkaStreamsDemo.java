package org.kafka.tutorial2;

import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.KeyValue;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.kstream.KTable;
import org.kafka.helpers.JacksonHelper;

import java.util.Properties;

public class KafkaStreamsDemo {
    public static void main(String[] args) {
        Properties properties = new Properties();
        properties.setProperty(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        properties.setProperty(StreamsConfig.APPLICATION_ID_CONFIG, "demo-kafka-stream");
        properties.setProperty(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG, Serdes.StringSerde.class.getName());
        properties.setProperty(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG, Serdes.StringSerde.class.getName());
        //properties.setProperty(StreamsConfig.STATE_DIR_CONFIG, "/temp");

        /*File f = new File("/temp");
        if(!f.exists()) {
            f.mkdir();
        }*/

        StreamsBuilder streamsbuilder = new StreamsBuilder();
        /*final KStream<String, String> kStream = streamsbuilder.<String, String>stream("rx_stream_json6")
                .map((k, v) -> new KeyValue<>(k, JacksonHelper.deserialize(v, QuoteMessage.class)))
                .filter((k, v) -> v.getLikes() >= 10_000)
                .map((k, v) -> new KeyValue<>(k, JacksonHelper.serialize(v)));
        kStream.to("rx_stream_popular_json6");*/

        final KTable<String, Long> kTable = streamsbuilder.<String, String>stream("rx_stream_json6")
                .map((k, v) -> new KeyValue<>(k, JacksonHelper.deserialize(v, QuoteMessage.class)))
                .filter((k, v) -> v.getLikes() >= 50_000)
                .selectKey((k, v) -> v.getAuthor())
                .map((k, v) -> new KeyValue<>(k, JacksonHelper.serialize(v)))
                .groupByKey()
                .count();


        kTable.toStream()
                .map((k, v) -> new KeyValue<>(k, Long.toString(v))) //just to see strings (not bytes) in kafka-console-consumer
                //.to("rx_stream_popular_json7", Produced.with(Serdes.String(), Serdes.Long()));
                .to("rx_stream_popular_json7");

        KafkaStreams kafkaStreams = new KafkaStreams(streamsbuilder.build(), properties);
        kafkaStreams.start();
    }
}
