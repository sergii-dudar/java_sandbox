package org.kafka.tutorial5.streams.official.part02.processorapi;

import one.util.streamex.StreamEx;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.KeyValue;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.Topology;
import org.apache.kafka.streams.processor.AbstractProcessor;
import org.apache.kafka.streams.processor.ProcessorContext;
import org.apache.kafka.streams.processor.PunctuationType;
import org.apache.kafka.streams.state.KeyValueIterator;
import org.apache.kafka.streams.state.KeyValueStore;
import org.apache.kafka.streams.state.Stores;
import org.kafka.tutorial5.streams.official.TestStreamProducerConsumer;

import java.time.Duration;
import java.util.Properties;
import java.util.stream.Collectors;

public class WordCountProcessor extends AbstractProcessor<String, String> {

    public static void main(final String[] args) throws Exception {
        Properties props = new Properties();
        props.put(StreamsConfig.APPLICATION_ID_CONFIG, "wordcount-application");
        props.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "127.0.0.1:9092");
        props.put(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        props.put(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());

        Topology topology = new Topology();
        // add the source processor node that takes Kafka topic "source-topic" as input
        topology.addSource("Source",
            Serdes.String().deserializer(),
            Serdes.String().deserializer(),
            TestStreamProducerConsumer.WORLD_SOURCE_TOPIC_NAME)
            // add the WordCountProcessor node which takes the source processor as its upstream processor
            .addProcessor("Process", WordCountProcessor::new, "Source")
            // add the count store associated with the WordCountProcessor processor
            .addStateStore(Stores.keyValueStoreBuilder(
                Stores.persistentKeyValueStore("persistent-counts"),
                Serdes.String(),
                Serdes.Long()), "Process")
            // add the sink processor node that takes Kafka topic "sink-topic" as output
            // and the WordCountProcessor node as its upstream processor

            /*.addSink("Sink",
                TestStreamProducerConsumer.WORLD_SINK_TOPIC_NAME,
                Serdes.String().serializer(),
                Serdes.Long().serializer(),
                "Process")*/;

        System.out.println("----------------------------");
        System.out.println(topology.describe());
        System.out.println("----------------------------");

        KafkaStreams streams = new KafkaStreams(topology, props);
        streams.start();
    }

    //------------------------------------


    private ProcessorContext context;
    private KeyValueStore<String, Long> kvStore;

    @Override
    @SuppressWarnings("unchecked")
    public void init(ProcessorContext context) {
        // keep the processor context locally because we need it in punctuate() and commit()
        this.context = context;

        // retrieve the key-value store named "Counts"
        kvStore = (KeyValueStore<String, Long>) context.getStateStore("persistent-counts");

        // schedule a punctuate() method every second based on stream-time
        this.context.schedule(Duration.ofSeconds(10), PunctuationType.WALL_CLOCK_TIME, (timestamp) -> {
            KeyValueIterator<String, Long> iter = this.kvStore.all();
            while (iter.hasNext()) {
                KeyValue<String, Long> entry = iter.next();
                //context.forward(entry.key, entry.value);
                System.out.println("grouped result to db: " + entry.key + "/" + entry.value);
            }
            iter.close();

            // commit the current processing progress
            context.commit();
        });
    }

    /*@Override
    public void process(Record<String, String> record) {

    }*/

    @Override
    public void process(String key, String value) {
        System.out.println("process " + key + "/" + value);
        StreamEx.of(value.toLowerCase().split("\\W+"))
            .groupingBy(k -> k, Collectors.counting())
            .forEach((sKey, sCount) -> {
                Long storeValue = kvStore.get(sKey);
                storeValue = storeValue == null ? 0L : storeValue;
                kvStore.put(sKey, storeValue + sCount);
            });
    }

    @Override
    public void close() {
        // close any resources managed by this processor
        // Note: Do not close any StateStores as these are managed by the library
    }

}
