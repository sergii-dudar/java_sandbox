package org.example.io.socket.server.nio.selector.baeldung;

import lombok.SneakyThrows;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.Executors;

import static org.example.io.socket.server.nio.selector.baeldung.EchoTest.PORT;

public class EchoServer {

    private static final String POISON_PILL = "POISON_PILL";
    private static ServerSocketChannel SERVER_SOCKET;
    private static Selector SELECTOR;

    @SneakyThrows
    public static void main(String[] args) {
        Selector selector = SELECTOR = Selector.open();
        ServerSocketChannel serverSocket = SERVER_SOCKET = ServerSocketChannel.open();
        serverSocket.bind(new InetSocketAddress("localhost", PORT));
        serverSocket.configureBlocking(false);
        serverSocket.register(selector, SelectionKey.OP_ACCEPT);
        ByteBuffer buffer = ByteBuffer.allocate(256);

        while (true) {
            selector.select();
            Set<SelectionKey> selectedKeys = selector.selectedKeys();
            Iterator<SelectionKey> iter = selectedKeys.iterator();
            while (iter.hasNext()) {

                SelectionKey key = iter.next();

                if (key.isAcceptable()) {
                    register(selector, serverSocket);
                }

                if (key.isReadable()) {
                    answerWithEcho(buffer, key);
                }
                iter.remove();
            }
        }
    }

    private static void answerWithEcho(ByteBuffer buffer, SelectionKey key)
        throws IOException {

        SocketChannel client = (SocketChannel) key.channel();
        int r = client.read(buffer);
        if (r == -1 || new String(buffer.array()).trim().equals(POISON_PILL)) {
            client.close();
            System.out.println("Not accepting client messages anymore");
        } else {
            buffer.flip();
            client.write(buffer);
            buffer.clear();
        }
    }

    private static void register(Selector selector, ServerSocketChannel serverSocket)
        throws IOException {

        SocketChannel client = serverSocket.accept();
        client.configureBlocking(false);
        client.register(selector, SelectionKey.OP_READ);
    }

    public static void start() {
        Executors.newSingleThreadExecutor()
            .submit(() -> {
                System.out.println("Server is started and listening incoming requests...");
                main(new String[0]);
            });
    }

    @SneakyThrows
    public static void stop() {
        SELECTOR.close();
        SERVER_SOCKET.close();
    }
}
