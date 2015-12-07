import java.io.*;
import java.net.*;


class Bytes {
	public static final int BUFFER_SIZE = 32;
	public static void copy(InputStream from, OutputStream to) throws IOException {
		byte[] buf  = new byte[BUFFER_SIZE];
		int bufSize = 0;
		for (; bufSize != -1; bufSize = from.read(buf)) {
			to.write(buf, 0, bufSize);
		}
	}
}


public class TcpServer {
	/* --- --- --- private static const field --- --- --- */
	public static final int DEFAULT_SERVER_PORT = 15010;

	/* --- --- --- private field --- --- --- */
	public final int serverPort;

	/* --- --- --- pubilc constructor --- --- --- */
	public TcpServer(int serverPort) {
		this.serverPort = serverPort;
	}

	/* --- --- --- public static method --- --- --- */
	public static void main(String[] args) {
		TcpServer server = (args.length == 0) ? new TcpServer(DEFAULT_SERVER_PORT)
		                                      : new TcpServer(Integer.parseInt(args[0]));
		server.start();
	}

	/* --- --- --- public method --- --- --- */
	public void start() {
		try (ServerSocket serverSocket = new ServerSocket(this.serverPort)) {
			System.out.println("server started on port " + this.serverPort);
			while (true) {
				this.waitClientAccess(serverSocket);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* --- --- --- private method --- --- --- */
	private void waitClientAccess(ServerSocket serverSocket) throws IOException {
		try (Socket clientSocket = serverSocket.accept()) {
			InputStream   in            = clientSocket.getInputStream();
			OutputStream  out           = clientSocket.getOutputStream();
			SocketAddress clientAddress = clientSocket.getRemoteSocketAddress();
			System.out.println("connecting from ... " + clientAddress);
			Bytes.copy(in, out);
		}
	}
}
