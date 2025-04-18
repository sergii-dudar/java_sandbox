import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Stream;

public class Reactivity {
    // GetInstantLePaymentAvailabilityIT

    public static <T> void stubSystemAccountOwnersApi(WireMockServer wireMockServer, String iban, T response,
            HttpStatus returnHttpStatus) {
        // wireMockServer.stubFor(get(WireMock.urlPathEqualTo(PAYMENT_SYSTEM_ACCOUNT_OWNERS_URI_API
        // + iban))
        wireMockServer.stubFor(get(WireMock.anyUrl())
                .willReturn(aResponse()
                        .withHeader(CONTENT_TYPE, APPLICATION_JSON_VALUE)
                        .withBody(toJson(response))
                        .withStatus(returnHttpStatus.value())));
    }

    // ----------------------

    @Test
    public void test12() {
        stubKeycloakApi(wireMockServer(), RAW_VALID_KEYCLOAK_RESPONSE);
        stubSystemAccountOwnersApi(wireMockServer(), BMRS_IBAN, BMRS);

        AtomicInteger atomicInteger = new AtomicInteger();
        List<String> urls = Stream
                .generate(() -> "http://localhost:%s/v2/system-account-owners/%s".formatted(WIRE_MOCK_SERVER.port(),
                        BMRS_IBAN))
                .map(url -> url + "?number=%02d".formatted(atomicInteger.incrementAndGet()))
                .limit(10)
                .toList();

        WebClient webClient = WebClient.builder().build();
        logMessage(StdColors.YELLOW, "entering main");

        List<String> list = Flux.fromIterable(urls)
                .doOnNext(url -> logMessage(StdColors.GREEN, "   >>> %s BEFORE", url))
                .flatMapSequential(url -> webClient.get()
                        .uri(url)
                        .retrieve()
                        .bodyToMono(String.class)
                        // .publishOn(Schedulers.boundedElastic())
                        .doOnNext(responseBody -> logMessage(StdColors.RED, ">>>>>> %s OP RESPONSE %s", url,
                                responseBody))
                        .map(body -> url))
                .doOnNext(url -> logMessage(StdColors.BLUE, "   >>> %s AFTER", url))
                // .subscribeOn(Schedulers.boundedElastic())
                .collectList()
                .block();

        logMessage(StdColors.YELLOW, "finishing main");
    }

    public static void main(String[] args) {
        logMessage(StdColors.YELLOW, "entering main");
        Flux.fromIterable(Stream.iterate(1, i -> i + 1).limit(10).toList())
                // .parallel()
                // .runOn(Schedulers.boundedElastic())
                .doOnNext(number -> logMessage(StdColors.GREEN, "   >>> %02d - BEFORE", number))
                .flatMap(value -> Mono.just(value)
                        .delayElement(Duration.ofMillis(2))
                        .map(val -> {
                            logMessage(StdColors.RED, ">>>>>> %02d - OPERATION ", val);
                            return val;
                        })
                        .subscribeOn(Schedulers.boundedElastic()))
                .doOnNext(number -> logMessage(StdColors.BLUE, "   >>> %02d - AFTER", number))
                .then()
                // .subscribeOn(Schedulers.boundedElastic())
                .block();
        logMessage(StdColors.YELLOW, "finishing main");
    }

    public static void logMessage(String color, String template, Object... args) {
        System.out.println(StdColors.ofColor(color, String.format("[ %-20s ] ",
                Thread.currentThread().getName()) + String.format(template, args)));
    }
}
