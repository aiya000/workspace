import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.net.*;


public class TcpClient {
	/* --- --- --- private static const field --- --- --- */
	private static final String DEFAULT_SERVER_HOST = "127.0.0.1";
	private static final int    DEFAULT_SERVER_PORT = 15010;

	/* --- --- --- private field --- --- --- */
	private final String serverHostName;
	private final int    serverPort;

	/* --- --- --- public constructor --- --- --- */
	public TcpClient(String serverHostName, int serverPort) {
		this.serverHostName = serverHostName;
		this.serverPort     = serverPort;
	}

	/* --- --- --- public static method --- --- --- */
	public static void main(String[] args) {
		String serverHostName = (args.length >= 1) ? args[0]
		                                           : DEFAULT_SERVER_HOST;
		int    serverPort     = (args.length >= 2) ? Integer.parseInt(args[1])
		                                           : DEFAULT_SERVER_PORT;
		String message        = (args.length >= 3) ? args[2]
		                                           : "hello, TCP world !!";
		TcpClient client = new TcpClient(serverHostName, serverPort);
		client.send(message);
	}

	/* --- --- --- public method --- --- --- */
	public void send(String message) {
		try (SocketChannel client = SocketChannel.open()) {
			InetSocketAddress serverAddress = new InetSocketAddress(this.serverHostName, this.serverPort);
			ByteBuffer        messageBuffer = ByteBuffer.wrap(message.getBytes("UTF-8"));
			client.connect(serverAddress);

			System.out.println("client has started on " + client.getLocalAddress());
			client.write(messageBuffer);  // send to Server (this.serverHostName)
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
