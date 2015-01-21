/** @See http://waman.hatenablog.com/entry/20120816/1345150695 **/

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.nio.file.FileSystems;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.FileVisitResult;
import java.nio.file.PathMatcher;
import java.nio.file.attribute.BasicFileAttributes;

public class FileVistorImpl {
	public static void main(String[] args){
		Path   root    = Paths.get(".");
		String pattern = "*.java";

		FindFileVisitor finder = new FindFileVisitor(pattern);
		try{
			Files.walkFileTree(root, finder);
		}catch(IOException e){
			System.out.println(e.getClass().getName());
		}
		finder.done();
	}
}


class FindFileVisitor extends SimpleFileVisitor<Path> {

	/* *** プロパティ *** */

	private final PathMatcher matcher;
	private int matches = 0;


	/* *** ********** *** */

	public FindFileVisitor(String pattern){
		// glob: or regex:
		matcher = FileSystems.getDefault()
					.getPathMatcher("glob:" + pattern);
	}

	public void done(){
		System.out.println("Matches: " + matches);
	}


	@Override
	public FileVisitResult visitFile(Path file, BasicFileAttributes atts){
		final Path name = file.getFileName();
		if(name != null && matcher.matches(name)){
			this.matches++;
			System.out.println(file);
		}
		return FileVisitResult.CONTINUE;
	}

	@Override
	public FileVisitResult visitFileFailed(Path file, IOException e){
		System.err.println(e);
		return FileVisitResult.CONTINUE;
	}

}
