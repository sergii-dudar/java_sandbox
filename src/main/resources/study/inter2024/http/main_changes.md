# http/1
- Supported various request methods (GET, POST, HEAD).
- Connection had to be re-established for each request.

------------

# http/1.1
- Improved performance by allowing multiple requests to be sent over a single persistent connection (keep-alive).
- Introduced various optimizations, chunked transfer encoding, and other features to enhance efficiency.

### keep-alive

- HTTP Keep-Alive, introduced in HTTP/1.1, addresses this issue by enabling persistent connections. With Keep-Alive, a single TCP connection can be reused for multiple requests and responses between a client and a server. Here are the key aspects of HTTP
  Persistent Connections:

- In HTTP/1.1 and later versions, the default behavior is to keep the connection alive unless explicitly specified otherwise.
After a response is received, the connection remains open, and subsequent requests can reuse the same connection.

*Connection Header:*

- The Connection header is used to control the persistence of connections.
- The value keep-alive is used to request a persistent connection.
- The value close is used to indicate that the connection should be closed after the current request/response.

```Connection: keep-alive```

*Benefits of Keep-Alive:*

- Reduced Latency: Keeping the connection alive eliminates the need to establish a new connection for each request, reducing the overall latency.
- Efficiency: Reusing existing connections is more efficient in terms of both server and client resources.
- Improved Performance: Especially beneficial for web pages with multiple resources (e.g., images, scripts, stylesheets) as they can be fetched over the same connection.

```Connection: close```

*Keep-Alive Timeout:*

- Servers may set a timeout for how long a connection can remain idle before it is closed. This helps manage resources on the server side.
- If the client or server wishes to close the connection explicitly, it can send a Connection: close header.

*Use with HTTPS:*

- Keep-Alive is commonly used with HTTPS (HTTP Secure), where the connection is encrypted using TLS (Transport Layer Security).

*While HTTP Keep-Alive significantly improves the efficiency of web communication, it's worth noting that HTTP/2, the subsequent version of the protocol, further enhances this by introducing multiplexing, allowing multiple requests and responses to be interleaved over a single connection. The use of Keep-Alive is still relevant and beneficial in HTTP/1.1 and is typically enabled by default in modern web servers and clients.*

-----------------

# http/2

*HTTP/2 is intended to make web pages load faster and improve the overall user experience by optimizing the way data is exchanged between clients and servers*

*It is the successor to HTTP/1.1 and introduces several key features aimed at addressing the limitations of its predecessor*

- Multiplexing: HTTP/2 supports multiplexing, allowing multiple requests and responses to be sent concurrently over a single connection. This is in contrast to HTTP/1.1, where only one request could be in flight at a time on a given connection.
- Binary Framing: HTTP/2 uses a binary framing layer to encapsulate and transmit data. This binary format is more efficient to parse and results in reduced overhead compared to the text-based format used in HTTP/1.1.
- Header Compression: HTTP/2 employs header compression mechanisms to reduce the size of headers, resulting in lower latency and improved performance. This is especially beneficial for websites with numerous resources.
- Backward Compatibility: HTTP/2 is designed to be backward compatible with HTTP/1.1. If a client or server doesn't support HTTP/2, they can still communicate using HTTP/1.1 without issues.

# Combining Multiplexing and Keep-Alive:

- In HTTP/2, multiplexing and connection reuse work together to provide a more efficient and responsive communication mechanism.
- Multiple streams can be multiplexed over a single, persistent connection (keep-alive), allowing for parallel and concurrent data exchange.

*It's important to note that while HTTP/2 encourages the use of persistent connections, the underlying TCP connection may still be closed due to factors like inactivity, server or client preferences, or network conditions. The combination of multiplexing and connection reuse significantly contributes to the performance improvements seen in HTTP/2 compared to its predecessor, HTTP/1.1.*

-----------------

# http/3

*aiming to improve performance, security, and reliability compared to its predecessors.*

### Key Features:

*Built on QUIC (Quick UDP Internet Connections): Unlike HTTP/1.1 and HTTP/2 which rely on TCP, HTTP/3 leverages the QUIC protocol. QUIC utilizes UDP(User Datagram Protocol) instead of TCP, offering several advantages:*
- Reduced latency: Faster connection establishment and improved handling of packet loss, particularly on mobile networks.
- Multiplexing: Enables simultaneous sending and receiving of multiple requests and responses on a single connection, eliminating head-of-line blocking.
- Congestion control: Built-in congestion control mechanisms for efficient bandwidth usage.
- Encryption by default: All communication in HTTP/3 is encrypted by default using TLS 1.3, enhancing security and privacy.
- Improved performance: Overall faster loading times and smoother web experiences due to the combined benefits of QUIC and encryption.
- Backward Compatibility: HTTP/3 is designed to be backward compatible with HTTP/2 and HTTP/1.1. This means that if a client or server does not support HTTP/3, they can fall back to using HTTP/2 or HTTP/1.1.

### QUIC's features directly contribute to HTTP/3's benefits:
- Faster loading times: Reduced latency translates to quicker data transfer.
- Improved responsiveness: Multiplexing enables smoother user interaction.
- Enhanced security: Encryption protects data from interception.
- More reliable connections: QUIC handles network issues efficiently.

*Overall, HTTP/3 represents a significant step forward for web communication, offering exciting possibilities for faster, more secure, and reliable web experiences.*

----------------

# SSH (Secure Shell):

- Purpose:

SSH is a protocol used for secure remote login to a computer system. It provides an encrypted channel for secure communication between a client and a server, allowing users to access a remote machine securely.

- Typical Usage:

SSH is commonly used for secure command-line access to servers, file transfers (e.g., using SCP or SFTP), and secure tunneling for other protocols.
- Protocol Layer:

SSH operates at the application layer and provides both encryption and authentication for secure communication.
- Key Exchange:

SSH uses asymmetric key exchange for secure key negotiation between the client and server. Once keys are exchanged, symmetric encryption is used for the remainder of the session.
- Certificates:

SSH also uses digital certificates for authentication, allowing users to log in without entering passwords. SSH certificates can be self-signed or managed by a central authority.

- Common Implementations:

OpenSSH is the most widely used implementation of the SSH protocol. Other implementations include SSH2 by Tectia and Dropbear.

# TLS (Transport Layer Security)

- Purpose:

TLS is primarily used to secure communication between applications and services over a network. It is commonly employed in web browsers to secure the transfer of data between a client (e.g., a web browser) and a server (e.g., a web server).

- Typical Usage:

HTTPS (HTTP Secure) is the most common application of TLS, securing the transmission of data over the web. It is used for securing online transactions, login credentials, and other sensitive information.

- Protocol Layer:

TLS operates at the transport layer and provides encryption and authentication services to higher-layer protocols.

- Key Exchange:

TLS supports various key exchange mechanisms, including both symmetric and asymmetric cryptography. It allows for negotiation between the client and server to agree on a shared secret.

- Certificates:

TLS relies on digital certificates issued by Certificate Authorities (CAs) to authenticate the identities of servers. This helps users verify the legitimacy of the server they are communicating with.

- Common Implementations:

Popular implementations of TLS include OpenSSL, Microsoft SChannel, and Java Secure Socket Extension (JSSE).

### TLS vs SSH Key Differences:

- TLS is typically used for securing communication between applications (e.g., web browsers and servers), while SSH is designed for secure remote access to computer systems.
- TLS operates at the transport layer, securing higher-layer protocols like HTTP, whereas SSH operates at the application layer.
- TLS commonly uses digital certificates issued by CAs for server authentication, while SSH allows for self-signed certificates or certificates managed by a central authority.