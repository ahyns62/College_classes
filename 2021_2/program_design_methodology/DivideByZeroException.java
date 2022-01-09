
public class DivideByZeroException extends Exception {
	public DivideByZeroException() {
		super("0으로 나누려고 시도!");
	}
	public DivideByZeroException(String Message) {
		super(Message);
	}
}
