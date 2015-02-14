import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public class Executor_Using {
	public static void main(String[] args){
		final int THREADS = 4;
		ExecutorService service = Executors.newFixedThreadPool(THREADS);

		for(int i=0; i<THREADS; i++){
			service.execute(() -> {
				long id = Thread.currentThread().getId();
				for(int j=0; j<10; j++){
					System.out.print(id + " ");
					try{
						Thread.sleep( (long)(Math.random() * 2000.0) );
					}catch(InterruptedException e){
						e.printStackTrace();
					}
				}
				System.out.println("End " + id);
			});
		}

		service.shutdown();
		System.out.println("Exit main");
	}
}
