import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Hello extends Application {
	
	public static void main(String[] args){
		Application.launch(args);
	}

	@Override
	public void start(Stage stage) throws Exception {
		Parent root = FXMLLoader.load(getClass().getResource("./hello.fxml"));
		
		Scene scene = new Scene(root);
		stage.setScene(scene);
		stage.show();
	}

}
