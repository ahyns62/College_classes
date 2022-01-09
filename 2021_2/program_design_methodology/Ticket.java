// 입장권
public class Ticket {
	// 입장권의 번호와 가격에 대한 객체 변수 선언
	protected int number;
	protected double price;
	
	// 생성자 메소드
	// 입장권의 변수 값을 주어진 값으로 초기화
	public Ticket(int number) {
		this.number = number;
	}
	
	// 입장권의 번호, 가격 반환
	public int getNumber() {
		return number;
	}
	
	public double getPrice() {
		return price;
	}
	
	// 입장권의 번호와 가격을 문자열로 반환
	public String toString() {
		return "번호" + number + " 가격" + price;
	}
	
	// 입장권의 가격을 주어진 값으로 변경
	public void setPrice(double price) {
		this.price = price;
	}
}
