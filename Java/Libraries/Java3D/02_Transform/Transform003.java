/**
			hasVector.rotX(Math.PI/3);
 * 2014-05-16
 * @see <a href="http://www.maroon.dti.ne.jp/koten-kairo/works/Java3D/transform3.html">参考</a>
 */

/* Relations */
// Universe <-|<- Branch <- DirectionalLight
//            |<- Branch <- TransformGroup <-|<- Box
//                                           |<- Vector3f
//                                           |(rotY)
/* ********* */


import javax.media.j3d.*;
import com.sun.j3d.utils.universe.*;
import com.sun.j3d.utils.geometry.Box;

import java.awt.*;
import javax.swing.*;
import javax.vecmath.*;

import java.util.function.*;

public class Transform003 {
	public static void main(String[] args){
		new Transform003("ちょっと小さくなりし四角き物");
	}

	/* *** Field *** */
	private final int FRAME_WIDTH  = 500;
	private final int FRAME_HEIGHT = 500;

	/* ************* */

	/* *** GetObjects *** */

	/**
	 * Getter of a Box Object.
	 * @return Constant Box Object
	 */
	private Box getBoxObject(){ /*{{{*/
		Box box = null;

		Material material = new Material();
		material.setDiffuseColor(0.5f, 0.3f, 0.5f);  // RGB
		Appearance appearance = new Appearance();
		appearance.setMaterial(material);

		box = new Box(0.2f, 0.5f, 0.3f, appearance);
		return box;
	} /*}}}*/

	/**
	 * Getter of a Color Light Branch.
	 * @return Color and Light property in a Branch
	 */
	private BranchGroup getColorLightBranch(){ /*{{{*/
		BranchGroup lightBranch = new BranchGroup();

		lightBranch.addChild( ((Supplier<DirectionalLight>)() -> {
			DirectionalLight colorLight = new DirectionalLight(
				new Color3f(1.7f, 1.7f, 1.7f),
				new Vector3f(0.2f, -0.2f, -0.6f)
				);
			colorLight.setInfluencingBounds(
				new BoundingSphere()
				);
			return colorLight;
		}).get() );

		return lightBranch;
	} /*}}}*/

	/**
	 * Getter of a World(TransformGroup), that has Vector and Object.
	 * @return Main World(TransformGroup)
	 * depends getBoxObject() : Box
	 */
	private TransformGroup getWorldTransform(){ /*{{{*/
		TransformGroup world = new TransformGroup();
		world.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		world.addChild( this.getBoxObject() );

		world.setTransform( ((Supplier<Transform3D>)() -> {
			Transform3D hasVector = new Transform3D();
			hasVector.setTranslation( new Vector3f(0.4f, 0.0f, 0.0f) );
			hasVector.rotY(Math.PI/4);
			hasVector.setScale(0.5f);
			return hasVector;
		}).get() );

		return world;
	} /*}}}*/

	/**
	 * Getter of Structed Screen
	 * @return Structed Screen Panel
	 * depends getColorLightBranch() : BranchGroup
	 * depends getWorldTransform() : TransformGroup
	 */
	private JPanel getScreen(){ /*{{{*/
		JPanel screen = new JPanel();
		screen.setLayout(null);

		screen.add( ((Supplier<Canvas3D>)() -> {
			Canvas3D icanvas;

			GraphicsConfiguration gConfig = SimpleUniverse.getPreferredConfiguration();
			icanvas = new Canvas3D(gConfig);
			icanvas.setBounds(0, 0, FRAME_WIDTH, FRAME_HEIGHT);

			// 照明を追加
			SimpleUniverse universe = new SimpleUniverse(icanvas);
			universe.addBranchGraph( this.getColorLightBranch() );

			// 図形入り座標空間を追加
			BranchGroup world = new BranchGroup();
			world.addChild( this.getWorldTransform() );
			universe.addBranchGraph(world);

			// !
			ViewingPlatform camera = universe.getViewingPlatform();
			camera.setNominalViewingTransform();

			return icanvas;
		}).get() );

		return screen;
	} /*}}}*/

	/* ************** */

	/**
	 * This Constructor is Main Frame
	 * @param title ウィンドウのタイトル
	 * depends getScreen() : JPanel
	 */
	public Transform003(String title){ /*{{{*/
		JFrame frame = new JFrame(title);
		frame.setBounds(200, 200, FRAME_WIDTH, FRAME_HEIGHT);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		frame.add( this.getScreen() );
		frame.setVisible(true);
	} /*}}}*/

	/* ************** */
}
