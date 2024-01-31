package org.example.io.socket.server.nio.selector.demo2;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;

public class SocketChannelClient {

    public static void main(String[] args) throws IOException {
        SocketChannel client = SocketChannel.open();
        client.connect(new InetSocketAddress( 8080));

        String data = "Hello World\n";

        ByteBuffer buffer = ByteBuffer.allocate(1024);
        buffer.clear();
        buffer.put(data.getBytes());

        buffer.flip();

        while (buffer.hasRemaining()) {
            client.write(buffer);
        }

        buffer.flip();

        StringBuilder read = new StringBuilder();
        while (client.read(buffer) != -1) {
            read.append(new String(buffer.array()).trim());
            buffer.clear();
        }

        System.out.println(read);
    }
}