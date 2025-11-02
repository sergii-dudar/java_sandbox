package org.io.socket.server.nio.selector.demo2;

import lombok.extern.slf4j.Slf4j;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;

@Slf4j
public class SocketChannelWithSelectorServer {

    // https://sergiomartinrubio.com/articles/java-socket-io-and-nio/

    private static Map<SocketChannel, Queue<ByteBuffer>> dataMap = new HashMap<>();

    public static void main(String[] args) throws IOException {
        var serverSocketChannel = ServerSocketChannel.open();
        serverSocketChannel.configureBlocking(false);
        serverSocketChannel.socket().bind(new InetSocketAddress(8080));

        var selector = Selector.open();
        serverSocketChannel.register(selector, SelectionKey.OP_ACCEPT);

        while (true) {
            selector.select();
            var keys = selector.selectedKeys().iterator();

            while (keys.hasNext()) {
                var selectionKey = (SelectionKey) keys.next();

                if (selectionKey.isAcceptable()) {
                    createChannel(serverSocketChannel, selectionKey);
                } else if (selectionKey.isReadable()) {
                    doRead(selectionKey);
                } else if (selectionKey.isWritable()) {
                    doWrite(selectionKey);
                }
                keys.remove();
            }
        }
    }

    private static void createChannel(ServerSocketChannel serverSocketChannel, SelectionKey selectionKey) throws IOException {
        var socketChannel = serverSocketChannel.accept();
        log.info("Accepted connection from " + socketChannel);
        socketChannel.configureBlocking(false);
        socketChannel.write(ByteBuffer.wrap(("Welcome: " + socketChannel.getRemoteAddress() +
                "\nThe thread assigned to you is: " + Thread.currentThread().getId() + "\n").getBytes()));
        dataMap.put(socketChannel, new LinkedList<>()); // store socket connection
        log.info("Total clients connected: " + dataMap.size());
        socketChannel.register(selectionKey.selector(), SelectionKey.OP_READ); // selector pointing to READ operation
    }

    private static void doRead(SelectionKey selectionKey) throws IOException {
        log.info("Reading...");
        var socketChannel = (SocketChannel) selectionKey.channel();
        var byteBuffer = ByteBuffer.allocate(1024); // pos=0 & lim=1024
        int read = socketChannel.read(byteBuffer); // pos=numberOfBytes & lim=1024
        if (read == -1) { // if connection is closed by the client
            doClose(socketChannel);
        } else {
            byteBuffer.flip(); // put buffer in read mode by setting pos=0 and lim=numberOfBytes
            dataMap.get(socketChannel).add(byteBuffer); // find socket channel and add new byteBuffer queue
            selectionKey.interestOps(SelectionKey.OP_WRITE); // set mode to WRITE to send data
        }
    }

    private static void doWrite(SelectionKey selectionKey) throws IOException {
        log.info("Writing...");
        var socketChannel = (SocketChannel) selectionKey.channel();
        var pendingData = dataMap.get(socketChannel); // find channel
        while (!pendingData.isEmpty()) { // start sending to client from queue
            var buf = pendingData.poll();
            socketChannel.write(buf);
        }
        selectionKey.interestOps(SelectionKey.OP_READ); // change the key to READ
    }

    private static void doClose(SocketChannel socketChannel) throws IOException {
        dataMap.remove(socketChannel);
        var socket = socketChannel.socket();
        var remoteSocketAddress = socket.getRemoteSocketAddress();
        log.info("Connection closed by client: " + remoteSocketAddress);
        socketChannel.close(); // closes channel and cancels selection key
    }
}
