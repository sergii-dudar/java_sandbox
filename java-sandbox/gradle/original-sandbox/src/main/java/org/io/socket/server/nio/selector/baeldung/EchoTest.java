package org.io.socket.server.nio.selector.baeldung;

import lombok.SneakyThrows;

/**
 * https://www.baeldung.com/java-nio-selector
 */
public class EchoTest {

    public static final int PORT = 4561;

    @SneakyThrows
    public static void main(String[] args) {

        org.io.socket.server.nio.selector.baeldung.EchoServer.start();
        org.io.socket.server.nio.selector.baeldung.EchoClient client = org.io.socket.server.nio.selector.baeldung.EchoClient.start();

        System.out.println("Send 'hello', response is: " + client.sendMessage("hello"));
        System.out.println("Send 'world', response is: " + client.sendMessage("world"));

        org.io.socket.server.nio.selector.baeldung.EchoClient.stop();
        org.io.socket.server.nio.selector.baeldung.EchoServer.stop();

        System.out.println("Done!");
    }
}
