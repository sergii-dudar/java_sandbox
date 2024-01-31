package org.example.io.socket.server.nio.simple;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SocketChannelClient {

    public static final String TEMP_FILE_PATH = "/Volumes/MyDisk/serhii.home/java_work/some_tests/src/main/resources/temp1.txt";

    public static void main(String[] args) throws IOException {
        java.nio.channels.SocketChannel server = java.nio.channels.SocketChannel.open();
        SocketAddress socketAddr = new InetSocketAddress(9000);
        server.connect(socketAddr);

        Path path = Paths.get(TEMP_FILE_PATH);
        FileChannel fileChannel = FileChannel.open(path);
        ByteBuffer buffer = ByteBuffer.allocate(1024);
        while(fileChannel.read(buffer) > 0) {
            buffer.flip();
            server.write(buffer);
            buffer.clear();
        }
        fileChannel.close();
        System.out.println("File Sent");
        server.close();
    }
}