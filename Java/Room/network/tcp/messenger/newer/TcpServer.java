// see http://www.akirakoyasu.net/category/program/how-to-implement-tcp-server-in-java/

import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.net.*;


class Bytes {
	public static final int BUFFER_SIZE = 32;
	public static void copy(ReadableByteChannel from, WritableByteChannel to) throws IOException {
		ByteBuffer buf = ByteBuffer.allocate(BUFFER_SIZE);
		while (from.read(buf) >= 0 || buf.position() != 0) {
			buf.flip();
			to.write(buf);
			buf.compact();
		}
	}
}


public class TcpServer {
	/* --- --- --- private static const field --- --- --- */
	private static final int DEFAULT_SERVER_PORT = 15010;

	/* --- --- --- public static method --- --- --- */
	public static void main(String[] args) {
		try (ServerSocketChannel listener = ServerSocketChannel.open()) {
			listener.setOption(StandardSocketOptions.SO_REUSEADDR, Boolean.TRUE);
			listener.bind(new InetSocketAddress(DEFAULT_SERVER_PORT));
			System.out.println("server started on port " + DEFAULT_SERVER_PORT);
			while (true) {
				try (SocketChannel channel = listener.accept()) {
					System.out.println("connecting from ... " + channel);
					Bytes.copy(channel, channel);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
