package org.example.io;

import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.client.WireMock;
import lombok.SneakyThrows;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.StandardCharsets;

import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;

public class BlockingNonBlockingReadSimple {

    private static final WireMockServer WIRE_MOCK =
        new WireMockServer(wireMockConfig().dynamicPort().portNumber());

    private static final String REQUESTED_RESOURCE = "/test.json";
    public static final String GET_JSON_REQUEST_OP = "GET " + REQUESTED_RESOURCE + " HTTP/1.0\r\n\r\n";

    public static void main(String[] args) {
        runServer();

        //readDataFromServerBlocking();
        readDataFromServerNonBlocking();

        System.out.println();
    }

    @SneakyThrows
    private static void readDataFromServerNonBlocking() {
        final StringBuilder responseBuilder = new StringBuilder();

        // add request command
        InetSocketAddress address = new InetSocketAddress("localhost", WIRE_MOCK.port());
        try(SocketChannel socketChannel = SocketChannel.open(address)) {

            Charset charset = StandardCharsets.UTF_8;
            socketChannel.write(charset.encode(CharBuffer.wrap(GET_JSON_REQUEST_OP)));

            // read data
            ByteBuffer byteBuffer = ByteBuffer.allocate(1192);
            CharsetDecoder charsetDecoder = charset.newDecoder();
            CharBuffer charBuffer = CharBuffer.allocate(1192);

            //socketChannel.read(byteBuffer);

            while (socketChannel.read(byteBuffer) != -1 || byteBuffer.position() > 0) {
                byteBuffer.flip();
                storeBufferContents(byteBuffer, charBuffer, charsetDecoder, responseBuilder);
                byteBuffer.compact();
            }
        }

        System.out.println(responseBuilder.toString());
    }

    public static void storeBufferContents(ByteBuffer byteBuffer, CharBuffer charBuffer,
        CharsetDecoder charsetDecoder, StringBuilder ourStore) {
        charsetDecoder.decode(byteBuffer, charBuffer, true);
        charBuffer.flip();
        ourStore.append(charBuffer);
        charBuffer.clear();
    }

    @SneakyThrows
    private static void readDataFromServerBlocking() {
        try (Socket socket = new Socket("localhost", WIRE_MOCK.port())) {

            // add request command
            OutputStream clientOutput = socket.getOutputStream();
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(clientOutput));
            writer.print(GET_JSON_REQUEST_OP);
            writer.flush();

            // read data
            try (InputStream serverInput = socket.getInputStream()) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(serverInput));
                StringBuilder ourStore = new StringBuilder();

                for (String line; (line = reader.readLine()) != null; ) {
                    ourStore.append(line);
                    ourStore.append(System.lineSeparator());
                }

                System.out.println("data was read: " + ourStore.toString());
            }
        }
    }

    public static void runServer() {
        WIRE_MOCK.stubFor(WireMock.get(WireMock.urlEqualTo(REQUESTED_RESOURCE))
            .willReturn(WireMock.aResponse()
                .withStatus(200)
                .withBody("{ \"response\" : \"It worked!\" }")));
        WIRE_MOCK.start();
    }
}
