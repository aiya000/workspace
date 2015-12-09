import lombok.*;

public class SynchronizedAnnotation {
	private final Object readLock = new Object();
	private int count = 0;

	@Synchronized
	public int incrementCount() {
		return this.count++;
	}

	@Synchronized("readLock")
	public int decrementCount() {
		return this.count--;
	}
}
