package org.example.io.socket.server.nio.selector.baeldung;

import lombok.SneakyThrows;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;

import static org.example.io.socket.server.nio.selector.baeldung.EchoTest.PORT;

public class EchoClient {

    private static SocketChannel client;
    private static ByteBuffer buffer;
    private static EchoClient instance;

    public static EchoClient start() {
        if (instance == null)
            instance = new EchoClient();

        return instance;
    }

    public static void stop() throws IOException {
        client.close();
        buffer = null;
    }

    @SneakyThrows
    private EchoClient() {
        client = SocketChannel.open(new InetSocketAddress("localhost", PORT));
        buffer = ByteBuffer.allocate(256);
    }

    @SneakyThrows
    public String sendMessage(String msg) {
        buffer = ByteBuffer.wrap(msg.getBytes());
        client.write(buffer);
        buffer.clear();
        client.read(buffer);
        final String response = new String(buffer.array()).trim();
        System.out.println("response=" + response);
        buffer.clear();
        return response;

    }
}