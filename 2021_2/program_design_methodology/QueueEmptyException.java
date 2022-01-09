public class QueueEmptyException extends Exception{
	public QueueEmptyException() {
		
	}
	
	public QueueEmptyException(String strMessage) {
		super(strMessage);
	}
}