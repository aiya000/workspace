// 2014-05-15

import javax.media.j3d.*;
import com.sun.j3d.utils.universe.*;
import com.sun.j3d.utils.geometry.*;

import java.awt.*;
import javax.swing.*;
import javax.vecmath.*;

import java.util.function.*;

public class SimpleUniverse004 {
	public static void main(String[] args){ new SimpleUniverse004(); }

	private final int FRAME_WIDTH  = 500;
	private final int FRAME_HEIGHT = 500;

	public SimpleUniverse004(){
		((Supplier<JFrame>)() -> {
			JFrame iframe = new JFrame("一方向からの光と色に照らされた丸いもの");
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
						group.addChild(
							new Sphere(0.5f)
						);
						return group;
					}).get() );

					// !
					universe.addBranchGraph( ((Supplier<BranchGroup>)() -> {
						BranchGroup group = new BranchGroup();
						group.addChild( ((Supplier<DirectionalLight>)() -> {
							DirectionalLight light = new DirectionalLight(
								new Color3f(1.7f, 1.7f, 1.7f),
								new Vector3f(0.2f, -0.2f, -0.6f)
							);
							light.setInfluencingBounds(
								new BoundingSphere()
							);
							return light;
						}).get() );
						return group;
					}).get() );

					// !?
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
