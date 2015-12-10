// 2014-05-15

import javax.media.j3d.*;
import com.sun.j3d.utils.universe.*;
import com.sun.j3d.utils.geometry.*;

import java.awt.*;
import javax.swing.*;

import java.util.function.*;

public class SimpleUniverse003 {
	public static void main(String[] args){ new SimpleUniverse003(); }

	private final int FRAME_WIDTH  = 500;
	private final int FRAME_HEIGHT = 500;

	public SimpleUniverse003(){
		((Supplier<JFrame>)() -> {
			JFrame iframe = new JFrame("カメラがあっても光がないので空白空間");
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
					universe.addBranchGraph( ((Supplier<BranchGroup>)() -> {
						BranchGroup group = new BranchGroup();
						group.addChild( /**/ new Sphere(0.5f)  );
						return group;
					}).get() );

					// スコープとはなんだったのか！？
					ViewingPlatform camera = universe.getViewingPlatform();
					camera.setNominalViewingTransform();

					return icanvas;
				}).get() );

				return icp;
			}).get() );

			return iframe;
		}).get() .setVisible(true);
	}
}
