import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;

public class EventController implements Initializable {
	
	@FXML private Button eventButton;
	@FXML private Label  eventLabel;
	private int count;
	
	@FXML
	public void onEventButtonClicked(ActionEvent event){
		eventLabel.setText("count : " + ++count);	
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		this.count = 10;	
	}

}
