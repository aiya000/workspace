/**
 * 2014-05-16
 * @see <a href="http://www.maroon.dti.ne.jp/koten-kairo/works/Java3D/transform6.html">参考</a>
 */

/* Relations */
// Universe <-|<- Branch  <- DirectionalLight
//            |<- Branch <- TransformGroup <-|<- Box
//                                           |<- Vector3f
//                                           |<- Transform3D(rotY)
//                                           |<- Transform3D(rotX)
/* ********* */


import javax.media.j3d.*;
import com.sun.j3d.utils.universe.*;
import com.sun.j3d.utils.geometry.Box;

import java.awt.*;
import javax.swing.*;
import javax.vecmath.*;

import java.util.Timer;
import java.util.TimerTask;
import java.util.function.*;

public class Transform005 {
	public static void main(String[] args){
		new Transform005("そろそろ動く四角き物");
	}

	/* *** Field *** */
	private final int FRAME_WIDTH  = 500;
	private final int FRAME_HEIGHT = 500;

	private TransformGroup world = new TransformGroup();
	private Transform3D transF = new Transform3D();
	private Transform3D transS = new Transform3D();
	private Transform3D transT = new Transform3D();

	/* ************* */

	/* *** GetObjects *** */

	/**
	 * Drawing Screen by Timer
	 */
	private void drawSet(){ /*{{{*/
		class Drawer extends TimerTask {
			private float radX = 0;
			private float radY = 0;
			private float radZ = 0;
			@Override
			public void run(){
				radX += Math.PI/10;
				radY += Math.PI/15;
				radZ += Math.PI/20;
				radX %= Math.PI*2;
				radY %= Math.PI*2;
				radZ %= Math.PI*2;

				transF.rotX(radX);
				transS.rotY(radY);
				transT.rotZ(radZ);

				transS.mul(transT);
				transF.mul(transS);

				world.setTransform(transF);
			}
		};
		new Timer().schedule(new Drawer(), 0, 100);
	} /*}}}*/

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
			BranchGroup worldBranch = new BranchGroup();
			worldBranch.addChild( this.world );
			universe.addBranchGraph(worldBranch);

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
	 * depends getBoxObject() : Box
	 * depends getScreen() : JPanel
	 * depends drawSet() : void
	 */
	public Transform005(String title){ /*{{{*/
		JFrame frame = new JFrame(title);
		frame.setBounds(200, 200, FRAME_WIDTH, FRAME_HEIGHT);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		world.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		world.addChild( this.getBoxObject() );
		transF.setTranslation( new Vector3f(0.4f, 0.0f, 0.0f) );
		transF.setScale(0.5f);
		this.drawSet();

		frame.add( this.getScreen() );
		frame.setVisible(true);
	} /*}}}*/

	/* ************** */
}
