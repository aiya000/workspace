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


public final class Test3D implements MouseListener, MouseMotionListener {
	public static void main(String[] args){ new Test3D(); }


	/* *** メンバ定数 *** */
	private int FRAME_WIDTH  = 500;
	private int FRAME_HEIGHT = 500;

	/* *** メンバ変数 *** */
	private float  rotateX = 0.0f;
	private float  rotateY = 0.0f;
	private double mouseX  = 0.0;
	private double mouseY  = 0.0;

	private final SimpleUniverse universe;
	private final BranchGroup group1;
	private final TransformGroup tGroup1;
	private final Transform3D transform1;

	/* ****************** */

	
	public Test3D(){
		//{{{
		JFrame frame = new JFrame();
		frame.setSize(FRAME_WIDTH, FRAME_HEIGHT);
		frame.setTitle("Test, Java3D !");
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
		canvas.setBounds(0, 0, FRAME_WIDTH, FRAME_HEIGHT);
		canvas.addMouseListener(this);
		canvas.addMouseMotionListener(this);
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


		/* ***** */
		frame.setVisible(true);

	}//}}}

	private void draw(){//{{{
		transform1.rotX(rotateX);
		tGroup1.setTransform(transform1);
		transform1.rotY(rotateY);
		tGroup1.setTransform(transform1);
	}//}}}

	@Override public void mouseClicked(MouseEvent e){ }
	@Override public void mouseEntered(MouseEvent e){ }
	@Override public void mouseExited(MouseEvent e){ }
	@Override public void mousePressed(MouseEvent e){ }
	@Override public void mouseReleased(MouseEvent e){ }
	@Override public void mouseMoved(MouseEvent e){ }
	@Override
	public void mouseDragged(MouseEvent e){
		System.out.println(e.getPoint());
		Point p = e.getPoint();
		double newMouseX = p.getX();
		double newMouseY = p.getY();
		rotateX += newMouseX - mouseX;
		rotateY += newMouseY - mouseY;
		this.mouseX = newMouseX;
		this.mouseY = newMouseY;

		this.draw();
	}

}
