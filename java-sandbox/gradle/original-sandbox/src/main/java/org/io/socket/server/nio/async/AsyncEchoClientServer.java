package org.example.io.socket.server.nio.async;

import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.example.io.socket.server.nio.async.AsyncEchoClientServer.AsyncEchoCompletionHandlerServer.AsyncClient;

import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.AsynchronousServerSocketChannel;
import java.nio.channels.AsynchronousSocketChannel;
import java.nio.channels.CompletionHandler;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class AsyncEchoClientServer {

    @SneakyThrows
    public static void main(String[] args) {

        final ExecutorService executor = Executors.newSingleThreadExecutor();

        executor.submit(() -> {
            //AsyncEchoServer server = new AsyncEchoServer();
            AsyncEchoCompletionHandlerServer server = new AsyncEchoCompletionHandlerServer();
            System.out.println("starting server...");
            server.runServer();
        });

        Thread.sleep(200);

        System.out.println("run client...");

        final AsyncClient asyncClient = new AsyncClient();
        System.out.println("send 'hello', responded: " + asyncClient.sendMessage("hello"));
        System.out.println("send 'world', responded: " + asyncClient.sendMessage("world"));
        System.out.println("send '!', responded: " + asyncClient.sendMessage("!"));
        System.out.println("done!");
    }

    public static class AsyncEchoServer {

        @SneakyThrows
        public void runServer() {

            AsynchronousServerSocketChannel serverChannel
                = AsynchronousServerSocketChannel.open();
            serverChannel.bind(new InetSocketAddress("127.0.0.1", 4999));

            Future<AsynchronousSocketChannel> acceptResult = serverChannel.accept();

            final AsynchronousSocketChannel clientChannel = acceptResult.get();
            if ((clientChannel != null) && (clientChannel.isOpen())) {
                while (true) {
                    ByteBuffer buffer = ByteBuffer.allocate(32);
                    Future<Integer> readResult = clientChannel.read(buffer);

                    // perform other computations

                    final Integer num = readResult.get();

                    if (num == -1) {
                        break;
                    }

                    buffer.flip();
                    Future<Integer> writeResult = clientChannel.write(buffer);

                    // perform other computations

                    writeResult.get();
                    buffer.clear();
                }
                clientChannel.close();
                serverChannel.close();
            }
        }
    }

    public static class AsyncEchoCompletionHandlerServer {

        @SneakyThrows
        public void runServer() {

            AsynchronousServerSocketChannel serverChannel
                = AsynchronousServerSocketChannel.open();
            serverChannel.bind(new InetSocketAddress("127.0.0.1", 4999));

            while (true) {
                serverChannel.accept(
                    null, new CompletionHandler<AsynchronousSocketChannel, Object>() {

                        @Override
                        public void completed(
                            AsynchronousSocketChannel result, Object attachment) {
                            if (serverChannel.isOpen()) {
                                serverChannel.accept(null, this);
                            }

                            final AsynchronousSocketChannel clientChannel = result;
                            if ((clientChannel != null) && (clientChannel.isOpen())) {
                                ReadWriteHandler handler = new ReadWriteHandler(clientChannel);
                                ByteBuffer buffer = ByteBuffer.allocate(32);

                                Map<String, Object> readInfo = new HashMap<>();
                                readInfo.put("action", "read");
                                readInfo.put("buffer", buffer);

                                clientChannel.read(buffer, readInfo, handler);
                            }
                        }

                        @Override
                        public void failed(Throwable exc, Object attachment) {
                            // process error
                        }
                    });
                System.in.read();
            }
        }

        @AllArgsConstructor
        public static class ReadWriteHandler implements
            CompletionHandler<Integer, Map<String, Object>> {

            private final AsynchronousSocketChannel clientChannel;

            @Override
            public void completed(
                Integer result, Map<String, Object> attachment) {
                Map<String, Object> actionInfo = attachment;
                String action = (String) actionInfo.get("action");

                if ("read".equals(action)) {
                    ByteBuffer buffer = (ByteBuffer) actionInfo.get("buffer");
                    buffer.flip();
                    actionInfo.put("action", "write");

                    clientChannel.write(buffer, actionInfo, this);
                    buffer.clear();

                } else if ("write".equals(action)) {
                    ByteBuffer buffer = ByteBuffer.allocate(32);

                    actionInfo.put("action", "read");
                    actionInfo.put("buffer", buffer);

                    clientChannel.read(buffer, actionInfo, this);
                }
            }

            @Override
            public void failed(Throwable exc, Map<String, Object> attachment) {
                //
            }
        }

        public static class AsyncClient {

            @SneakyThrows
            public String sendMessage(String message) {
                AsynchronousSocketChannel client = AsynchronousSocketChannel.open();
                InetSocketAddress hostAddress = new InetSocketAddress("127.0.0.1", 4999);
                Future<Void> future = client.connect(hostAddress);

                future.get();

                byte[] byteMsg = message.getBytes();
                ByteBuffer buffer = ByteBuffer.wrap(byteMsg);
                Future<Integer> writeResult = client.write(buffer);

                // do some computation

                writeResult.get();
                buffer.flip();
                Future<Integer> readResult = client.read(buffer);

                // do some computation

                readResult.get();
                String echo = new String(buffer.array()).trim();
                buffer.clear();
                return echo;
            }
        }
    }
}
