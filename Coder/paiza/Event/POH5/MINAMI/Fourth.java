import java.util.Scanner;


public class Fourth {

	/* ---===---===---===---===---===---===--- */

	private static final int EMPTY_NUMBER  = 0;
	private static final int NORMAL_NUMBER = 1;
	private static final int BOMB_NUMBER   = 2;

	/* -=-=-=-=-=-=-=-=- */

	private static int[][] dimension;

	/* ---===---===---===---===---===---===--- */


	public static void main(String[] args) {
		getDimension();

		executeExplode();

		printDimension();
	}


	/* ---===---===---===---===---===---===--- */


	/*
	 * 空間構築
	 */
	private static void getDimension() { /*{{{*/
		int[][] dimension;

		Scanner in = new Scanner(System.in).useDelimiter("\\s");

		dimension = allocateDimension(in);

		inputDimension(dimension, in);

		Fourth.dimension = dimension;
	} /*}}}*/


	/* -=-=-=-=-=-=-=-=- */


	/* 領域確保 */
	private static int[][] allocateDimension(Scanner in) { /*{{{*/
		int x = in.nextInt();
		int y = in.nextInt();

		return new int[y][x];
	} /*}}}*/


	/* 空間入力 */
	private static void inputDimension(int[][] dimension, Scanner in) { /*{{{*/
		int x = dimension.length;
		int y = dimension[0].length;

		for (int i = 0; i < x; ++i) for (int j = 0; j < y; ++j) {
			dimension[i][j] = in.nextInt();
		}
	} /*}}}*/


	/* ---===---===---===---===---===---===--- */

	/* ---===---===---===---===---===---===--- */


	/*
	 * 空間爆破
	 */
	private static void executeExplode() { /*{{{*/
		bomb(dimension);

		while( !applyGravity(dimension) );
	} /*}}}*/


	/* -=-=-=-=-=-=-=-=- */


	/* 爆破実行 */
	private static void bomb(int[][] dimension) { /*{{{*/
		int x = dimension.length;
		int y = dimension[0].length;

		for (int i = 0; i < x; ++i) for (int j = 0; j < y; ++j) {
			if (dimension[i][j] == BOMB_NUMBER) {
				dimension[i][j] = EMPTY_NUMBER;
			}
		}
	} /*}}}*/


	/* 重力適用 */
	private static boolean applyGravity(int[][] dimension) { /*{{{*/
		boolean completed = true;

		for (int j = 0; j < dimension[0].length; ++j) {
			for (int i = dimension.length - 2; i >= 0; --i) {
				boolean canDown = dimension[i + 1][j] == EMPTY_NUMBER;
				boolean doDown  = dimension[i][j] == NORMAL_NUMBER;

				if (doDown && canDown) {
					dimension[i + 1][j] = NORMAL_NUMBER;
					dimension[i][j]     = EMPTY_NUMBER;
					completed           = false;
				}
			}
		}

		return completed;
	} /*}}}*/


	/* ---===---===---===---===---===---===--- */

	/* ---===---===---===---===---===---===--- */


	/*
	 * 空間発現
	 */
	private static void printDimension() { /*{{{*/
		for (int i = 0; i < dimension.length; ++i) {
			int j;

			for (j = 0; j < dimension[0].length - 1; ++j) {
				System.out.print(dimension[i][j] + " ");
			}

			System.out.println(dimension[i][j]);
		}
	} /*}}}*/


	/* ---===---===---===---===---===---===--- */

}
