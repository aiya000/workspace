// 2014-05-13
// refer to
// http://www7.plala.or.jp/keny01/java3d/java3d_pg_introduction.html#05

import java.util.function.Supplier;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

import javax.media.j3d.*;
import javax.vecmath.*;

import com.sun.j3d.utils.universe.*;
import com.sun.j3d.utils.geometry.ColorCube;
import com.sun.j3d.utils.behaviors.vp.OrbitBehavior;


public class Hello3DE {
	public static void main(String[] args){ new Hello3DE(); }


	/* *** コンポーネント *** */
	private SimpleUniverse universe;
	private Canvas3D canvas;

	/* ********************** */

	public Hello3DE(){
	//{{{
		/* ベースフレーム */
		JFrame frame = new JFrame("今度は簡単に作りたい。");
		frame.setBounds(50, 50, 500, 500);
		frame.setLayout(new BorderLayout());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);


		/* キャンバスの作成 */
		canvas = ((Supplier<Canvas3D>)() -> {
			GraphicsConfiguration config =
				SimpleUniverse.getPreferredConfiguration();
			Canvas3D ccanvas = new Canvas3D(config);
			return ccanvas;
		}).get();
		frame.add(BorderLayout.CENTER, canvas);


		/* 色つき立方体の作成 */
		BranchGroup root = ((Supplier<BranchGroup>)() -> {
			BranchGroup branch = new BranchGroup();
			branch.addChild(new ColorCube(0.4));
			branch.compile();
			return branch;
		}).get();


		/* マウス処理を定義 */
		OrbitBehavior orbit = ((Supplier<OrbitBehavior>)() -> {
			OrbitBehavior mouseListen =
				new OrbitBehavior(canvas, OrbitBehavior.REVERSE_ALL);
			mouseListen.setSchedulingBounds(
				new BoundingSphere(new Point3d(0, 0, 0), 100.0));
			return mouseListen;
		}).get();


		/* カメラの設定 */
		universe = new SimpleUniverse(canvas);
		// 原点から少し後ろに移動
		universe.getViewingPlatform().setNominalViewingTransform();
		// マウスによる移動を設定
		universe.getViewingPlatform().setViewPlatformBehavior(orbit);
		// カメラ空間に立方体を乗せる
		universe.addBranchGraph(root);


		/* ウィンドウの可視化 */
		frame.setVisible(true);
	}//}}}
}
