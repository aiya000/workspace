import java.io.*;
import java.net.*;


public class TcpServer {
	/* --- --- --- private static const field --- --- --- */
	public static final int BUFFER_SIZE = 32;
	public static final int SERVER_PORT = 15010;

	/* --- --- --- public static method --- --- --- */
	public static void main(String[] args) {
		try (ServerSocket serverSocket = new ServerSocket(SERVER_PORT)) {
			while (true) {
				waitClientAccess(serverSocket);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* --- --- --- private static method --- --- --- */
	private static void waitClientAccess(ServerSocket serverSocket) throws IOException {
		try (Socket clientSocket = serverSocket.accept()) {
			InputStream   in            = clientSocket.getInputStream();
			OutputStream  out           = clientSocket.getOutputStream();
			SocketAddress clientAddress = clientSocket.getRemoteSocketAddress();
			System.out.println("connecting to ... " + clientAddress);

			byte[] buf = new byte[BUFFER_SIZE];
			int bufSize = 0;
			for (; bufSize != -1; bufSize = in.read(buf)) {
				out.write(buf, 0, bufSize);
			}
		}
	}
}
