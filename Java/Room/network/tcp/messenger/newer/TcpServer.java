// see http://www.akirakoyasu.net/category/program/how-to-implement-tcp-server-in-java/

import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.net.*;


public class TcpServer {
	/* --- --- --- private static const field --- --- --- */
	private static final int DEFAULT_SERVER_PORT = 15010;
	private static final int MAX_BUFFER_SIZE     = 10000;  // 10,000 bytes

	/* --- --- --- private field --- --- --- */
	private final int serverPort;

	/* --- --- --- public constructor  --- --- --- */
	public TcpServer(int serverPort) {
		this.serverPort = serverPort;
	}

	/* --- --- --- public static method --- --- --- */
	public static void main(String[] args) {
		int port = (args.length == 1) ? Integer.parseInt(args[0])
		                              : DEFAULT_SERVER_PORT;
		TcpServer server = new TcpServer(port);
		server.start();  // blocking
	}

	/* --- --- --- public method --- --- --- */
	public void start() {
		try (ServerSocketChannel listener = ServerSocketChannel.open()) {
			listener.setOption(StandardSocketOptions.SO_REUSEADDR, Boolean.TRUE);
			listener.bind(new InetSocketAddress(this.serverPort));
			System.out.println("server started on port " + this.serverPort);
			this.waitMessage(listener);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* --- --- --- private method --- --- --- */
	private void waitMessage(ServerSocketChannel listener) throws IOException {
		while (true) {
			try (SocketChannel channel = listener.accept()) {
				ByteBuffer message = ByteBuffer.allocate(MAX_BUFFER_SIZE);
				channel.read(message);
				System.out.println("- - - - -");
				System.out.println("connecting from ... " + channel);
				System.out.println("message:\n" + new String(message.array()));
				System.out.println();
			}
		}
	}
}
