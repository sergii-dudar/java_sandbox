package org.kafka.tutorial5.streams.official.part01.intro;

import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.Topology;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.KTable;
import org.apache.kafka.streams.kstream.Produced;
import org.kafka.tutorial5.streams.official.TestStreamProducerConsumer;

import java.util.Arrays;
import java.util.Properties;

public class WordCountApplication {

    public static void main(final String[] args) throws Exception {
        Properties props = new Properties();
        props.put(StreamsConfig.APPLICATION_ID_CONFIG, "wordcount-application");
        props.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        props.put(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        props.put(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());

        StreamsBuilder builder = new StreamsBuilder();
        KStream<String, String> textLines = builder.stream(TestStreamProducerConsumer.WORLD_SOURCE_TOPIC_NAME);
        KTable<String, Long> wordCounts = textLines
            .flatMapValues(textLine -> Arrays.asList(textLine.toLowerCase().split("\\W+")))
            //.foreach()
            .groupBy((key, word) -> word)
            //.count(Materialized.<String, Long, KeyValueStore<Bytes, byte[]>>as("counts-store"));
            .count();
        wordCounts.toStream().to(TestStreamProducerConsumer.WORLD_SINK_TOPIC_NAME,
            Produced.with(Serdes.String(), Serdes.Long()));

        final Topology topology = builder.build();
        System.out.println("----------------------------");
        System.out.println(topology.describe());
        System.out.println("----------------------------");

        KafkaStreams streams = new KafkaStreams(topology, props);
        streams.start();
    }

}