import java.io.*;
import java.net.*;


public class TcpClient {
	/* --- --- --- public static method --- --- --- */
	public static void main(String[] args) {
		TcpClient client        = new TcpClient();
		String    serverAddress = null;
		int       serverPort    = -1;
		String    message       = null;
		if (args.length < 2) {
			serverAddress = "localhost";
			serverPort    = 15010;
			message       = "Hello, Net world!!";
		} else {
			serverAddress = args[0];
			serverPort    = Integer.parseInt(args[1]);
			message       = args[2];
		}
		client.send(serverAddress, serverPort, message);
	}

	/* --- --- --- public method --- --- --- */
	public void send(String serverAddress, int serverPort, String messageStr) {
		byte[] message  = messageStr.getBytes();
		try (Socket socket = new Socket(serverAddress, serverPort)) {
			System.out.println("connecting ... " + serverAddress);
			this.sendMessage(socket, message);
			System.out.println("done send message: \"" + new String(message) + "\"");

			String result = this.fetchMessage(socket, message);
			System.out.println("Received: " + result);
		} catch (IOException e) {
			System.out.println("fatal error: " + e.getMessage());
			e.printStackTrace();
		}
	}

	/* --- --- --- private method --- --- --- */
	private void sendMessage(Socket socket, byte[] message) throws IOException {
		InputStream  in  = socket.getInputStream();
		OutputStream out = socket.getOutputStream();
		out.write(message);
	}

	private String fetchMessage(Socket socket, byte[] message) throws IOException {
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
