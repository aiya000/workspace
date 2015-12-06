import java.io.*;
import java.net.*;


public class TcpClient {
	/* --- --- --- private static const field --- --- --- */
	private static final String SERVER_ADDRESS = "localhost";
	private static final int    SERVER_PORT    = 15010;

	/* --- --- --- public static method --- --- --- */
	public static void main(String[] args) {
		byte[] message  = "Hello, Net world!!".getBytes();
		try (Socket socket = new Socket(SERVER_ADDRESS, SERVER_PORT)) {
			System.out.println("connecting ... " + SERVER_ADDRESS);
			sendMessage(socket, message);
			System.out.println("done send message: \"" + new String(message) + "\"");

			String result = fetchMessage(socket, message);
			System.out.println("Received: " + result);
		} catch (IOException e) {
			System.out.println("fatal error: " + e.getMessage());
			e.printStackTrace();
		}
	}

	/* --- --- --- private static method --- --- --- */
	private static void sendMessage(Socket socket, byte[] message) throws IOException {
		InputStream  in  = socket.getInputStream();
		OutputStream out = socket.getOutputStream();
		out.write(message);
	}

	private static String fetchMessage(Socket socket, byte[] message) throws IOException {
		InputStream   in                 = socket.getInputStream();
		OutputStream  out                = socket.getOutputStream();
		byte[]        buffer             = new byte[message.length];
		int           receivedSize       = 0;
		int           currentFetchedSize = 0;
		StringBuilder result             = new StringBuilder();
		while (receivedSize < message.length) {
			int fetchedSize = message.length - receivedSize;
			currentFetchedSize = in.read(buffer, receivedSize, fetchedSize);
			if (currentFetchedSize == -1) {
				throw new SocketException("connection was disconnected (error)");
			}
			result.append(new String(buffer));
			receivedSize += currentFetchedSize;
		}
		return result.toString();
	}
}
