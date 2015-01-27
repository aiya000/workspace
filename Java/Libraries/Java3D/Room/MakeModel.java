/**
 * 2014-05-19
 * @see <a href="http://codezine.jp/article/detail/38">参考</a>
 * @see <a href="http://www.maroon.dti.ne.jp/koten-kairo/works/Java3D/polygon3.html">参考</a>
 */


import javax.media.j3d.*;
import com.sun.j3d.utils.universe.*;
import com.sun.j3d.utils.geometry.*;

import java.awt.*;
import javax.swing.*;
import javax.vecmath.*;

import java.util.Timer;
import java.util.TimerTask;
import java.util.function.*;

import java.util.List;
import java.util.ArrayList;

public class MakeModel {
	public static void main(String[] args){
		new MakeModel("");
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
	 * Getter Created Object.
	 * @return Model Object
	 */
	private Shape3D getObject(){ /*{{{*/
		return new DefineModel().getObject();
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
				new BoundingSphere(new Point3d(0.0f, 0.0f, 0.0f), 1750)  // 物体の原点から半径750を照らす
				);
			return colorLight;
		}).get() );

		return lightBranch;
	} /*}}}*/

	/**
	 * Getter of Structed Screen
	 * @return Structed Screen Panel
	 * depends getColorLightBranch() : BranchGroup
	 * depends getWorldTransform()   : TransformGroup
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
	 * depends getObject() : Shape3D
	 * depends getScreen() : JPanel
	 * depends drawSet()   : void
	 */
	public MakeModel(String title){ /*{{{*/
		JFrame frame = new JFrame(title);
		frame.setBounds(200, 200, FRAME_WIDTH, FRAME_HEIGHT);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		world.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		world.addChild( this.getObject() );
		transF.setTranslation( new Vector3f(0.4f, 0.0f, 0.0f) );
		transF.setScale(0.5f);

		this.drawSet();

		frame.add( this.getScreen() );
		frame.setVisible(true);
	} /*}}}*/

	/* ************** */
}


class DefineModel {
	// 頂点の定義
	private final double[][] VERTEX_DATA = {
		/* P0 */  {-1,  0,  0},
		/* P1 */  { 0,  1,  0},
		/* P2 */  { 0,  0, -1},
		/* P3 */  { 1,  0,  0},
		/* P4 */  { 0,  0,  1},
		/* P5 */  { 0, -1,  0}
	};

	// 面の定義 => (Px, Py, Pz) で三角形1面を構成
	private final int[][] FACE_DATA = {
		{1, 4, 2}, {1, 0, 4}, {1, 2, 0}, {3, 2, 4},
		{0, 5, 4}, {4, 5, 3}, {3, 5, 2}, {2, 5, 0}
	};

	class Vertex {
		// 頂点を表す右手座標系座標
		public double x, y, z;
		public Vertex(double x, double y, double z){
			this.x = x;
			this.y = y;
			this.z = z;
		}
	}
	class Face {
		// 面を構成する3つの頂点
		public Vertex[] v = new Vertex[3];
		public Face(Vertex v0, Vertex v1, Vertex v2){
			v[0] = v0;
			v[1] = v1;
			v[2] = v2;
		}
	}


	public Shape3D getObject(){
		Point3d[] object = new Point3d[VERTEX_DATA.length];
		for(int i=0; i<object.length; i++)
			object[i] = new Point3d(
					VERTEX_DATA[i][0]*10,
					VERTEX_DATA[i][1]*10,
					VERTEX_DATA[i][2]*10);
		Color3f[] objectColor = new Color3f[object.length];
		for(int i=0; i<objectColor.length; i++)
			objectColor[i] = new Color3f(1.0f, 0.0f, 0.0f);

		Appearance ap = new Appearance();
		Material mat = new Material();
		mat.setLightingEnable(true);
		ap.setMaterial(mat);

		GeometryInfo gi = new GeometryInfo(GeometryInfo.TRIANGLE_ARRAY);
		gi.setCoordinates(object);
		gi.setColors(objectColor);

		NormalGenerator ng = new NormalGenerator();
		ng.generateNormals(gi);
		GeometryArray ga = gi.getGeometryArray();
		Shape3D shape = new Shape3D(ga, ap);
		return shape;
	//List<Double>  vertexes = new ArrayList<>();
	//List<Integer> faces    = new ArrayList<>();
	//public DefineModel(){
	//	// 頂点の作成
	//	for(int i=0; i<VERTEX_DATA.length; i++)
	//		vertexes.add(new Vertex(
	//					VERTEX_DATA[i][0],
	//					VERTEX_DATA[i][1],
	//					VERTEX_DATA[i][2]));

	//	// 面の作成
	//	for(int i=0; i<FACE_DATA.length; i++)
	//		faces.add(new Face(
	//					vertexes.get(FACE_DATA[i][0]),
	//					vertexes.get(FACE_DATA[i][1]),
	//					vertexes.get(FACE_DATA[i][2])));
	}
}
