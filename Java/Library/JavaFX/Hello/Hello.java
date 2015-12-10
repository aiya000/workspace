// see http://naokirintechnews.hatenablog.com/entry/2012/01/19/134715

import java.io.PrintWriter;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.File;
import java.io.IOException;
import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.layout.HBox;
import javafx.scene.control.Label;


public class Hello extends Application {

	/* --- --- --- private field --- --- --- */

	private String message;
	private Stage  stage;

	/* --- --- --- public static method --- --- --- */

	public static void main(String[] args) {
		Application.launch(Hello.class, args);
	}

	/* --- --- --- public method --- --- --- */

	@Override
	public void init() {
		this.message = "Hello, world!!";
	}

	@Override
	public void start(Stage stage) {
		HBox hbox   = new HBox();
		Scene scene = new Scene(hbox);
		this.stage  = stage;
		hbox.getChildren().add(new Label(this.message));
		stage.setScene(scene);
		stage.setTitle("Hello");
		stage.show();
	}

	@Override
	public void stop() throws IOException {
		try (PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(new File("Hello.log"))))) {
			out.println("Goodbye!");
		}
	}

}
