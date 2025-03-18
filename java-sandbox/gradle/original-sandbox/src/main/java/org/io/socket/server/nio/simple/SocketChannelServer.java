package org.example.io.socket.server.nio.simple;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.EnumSet;

import static org.example.io.socket.server.nio.simple.SocketChannelClient.TEMP_FILE_PATH;

public class SocketChannelServer {

    public static void main(String[] args) throws IOException {
        ServerSocketChannel serverSocket = null;
        SocketChannel client = null;
        serverSocket = ServerSocketChannel.open();
        serverSocket.socket().bind(new InetSocketAddress(9000));
        client = serverSocket.accept();

        System.out.println("Connection Set:  " + client.getRemoteAddress());
        Path path = Paths.get(TEMP_FILE_PATH);
        FileChannel fileChannel = FileChannel.open(path,
            EnumSet.of(StandardOpenOption.CREATE,
                StandardOpenOption.TRUNCATE_EXISTING,
                StandardOpenOption.WRITE)
        );
        ByteBuffer buffer = ByteBuffer.allocate(1024);
        while (client.read(buffer) > 0) {
            buffer.flip();
            fileChannel.write(buffer);
            fileChannel.write(ByteBuffer.wrap(": from server".getBytes(StandardCharsets.UTF_8)));
            buffer.clear();
        }
        fileChannel.close();
        System.out.println("File Received");
        client.close();
    }
}