// 2014-05-13

import javax.media.j3d.*;
import javax.vecmath.*;

import com.sun.j3d.utils.universe.*;
import com.sun.j3d.utils.geometry.*;

import java.awt.*;
import java.awt.event.*;

import javax.swing.*;
import javax.swing.event.*;

import java.util.*;


public class Hello3D {
	public static void main(String[] args){
		new Hello3D();
	}

	private SimpleUniverse universe;
	private BranchGroup group1;
	private TransformGroup tGroup1;
	private Transform3D transform1;
	private float rotateValue;
	
	public Hello3D(){
		JFrame frame = new JFrame();
		frame.setSize(250, 250);
		frame.setTitle("Hello, Java3D !");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JPanel panel = new JPanel();
		panel.setLayout(null);
		frame.add(panel);

		/* ***** */

		// 画面ハードウェア情報の取得
		GraphicsConfiguration gConfig =
			SimpleUniverse.getPreferredConfiguration();

		// 3Dを表示する領域
		Canvas3D canvas = new Canvas3D(gConfig);
		canvas.setBounds(0, 0, 250, 250);
		panel.add(canvas);


		/* ****** */
		/* 3D空間 */
		/* ****** */
		// 空間インスタンス
		universe = new SimpleUniverse(canvas);

		// universe's Leaf
		group1 = new BranchGroup();


		// カラーキューブを作ってみる
		ColorCube cube = new ColorCube(0.4f);
		// 座標変換グラフ
		tGroup1 = new TransformGroup();
		// 座標書き換えを許可
		tGroup1.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		//
		tGroup1.addChild(cube);
		// 座標変換内容
		transform1 = new Transform3D();


		group1.addChild(tGroup1);
		universe.addBranchGraph(group1);
		rotateValue = 0.0f;


		/* ***** */
		/*  視点 */
		/* ***** */
		//
		ViewingPlatform vp = universe.getViewingPlatform();
		// 視点用座標変換クラス
		TransformGroup camera = vp.getViewPlatformTransform();
		// カメラ位置ベクトル
		Transform3D viewPos = new Transform3D();
		// カメラ位置
		Vector3f posVec = new Vector3f(1.4f, 1.4f, 1.4f);
		// 座標変換実行
		viewPos.setTranslation(posVec);
		// カメラの向きベクトル
		Transform3D viewDir  = new Transform3D();
		Transform3D viewDir0 = new Transform3D();
		// カメラ向きの決定
		viewDir.rotY(Math.PI/4);
		viewDir0.rotX(-Math.PI/4 + 0.1f);
		viewDir.mul(viewDir0);
		// カメラ(位置|向き)を統合
		viewPos.mul(viewDir);
		// カメラの位置情報
		camera.setTransform(viewPos);


		java.util.Timer timer = new java.util.Timer();
		timer.schedule(new CubeRotater(), 0, 40);


		/* ***** */
		frame.setVisible(true);

	}
		/* 回転のためのタイマーを設定 */
		class CubeRotater extends TimerTask {
			@Override
			public void run(){
				//
				rotateValue += Math.PI/60;
				// 回転実行
				transform1.rotY(rotateValue);
				// 座標変換を登録
				tGroup1.setTransform(transform1);
				
				// 1周したら回転角をリセット
				if(rotateValue > Math.PI*2)
					rotateValue = 0.0f;
			}
		};

}
