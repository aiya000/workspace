// 2014-05-15

import javax.media.j3d.*;
import com.sun.j3d.utils.universe.*;

import java.awt.*;
import javax.swing.*;

import java.util.function.*;

public class SimpleUniverse001 {
	public static void main(String[] args){ new SimpleUniverse001(); }

	private final int FRAME_WIDTH  = 500;
	private final int FRAME_HEIGHT = 500;

	public SimpleUniverse001(){
		((Supplier<JFrame>)() -> {
			JFrame iframe = new JFrame("空白空間");
			iframe.setBounds(200, 200, FRAME_WIDTH, FRAME_HEIGHT);
			iframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

			iframe.add( ((Supplier<JPanel>)() -> {
				JPanel icp = new JPanel();
				icp.setLayout(null);

				icp.add( ((Supplier<Canvas3D>)() -> {
					GraphicsConfiguration gConfig = SimpleUniverse.getPreferredConfiguration();

					Canvas3D icanvas = new Canvas3D(gConfig);
					icanvas.setBounds(0, 0, FRAME_WIDTH, FRAME_HEIGHT);

					// !?
					SimpleUniverse universe = new SimpleUniverse(icanvas);

					return icanvas;
				}).get() );

				return icp;
			}).get() );

			return iframe;
		}).get() .setVisible(true);
	}
}
