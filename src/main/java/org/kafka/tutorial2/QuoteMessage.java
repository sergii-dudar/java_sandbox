package org.kafka.tutorial2;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
@AllArgsConstructor
public class QuoteMessage {
    String id;
    String quote;
    int version;

    int likes;
    String author;
}
