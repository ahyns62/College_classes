// 예약 입장권
public class AdvanceTicket extends Ticket {
	// 입장권의 사전 예약일수에 대한 객체 변수 선언
	private int advancedays;
	
	// 생성자 메소드
	// 입장권의 변수 값을 주어진 값으로 초기화
	public AdvanceTicket(int number, int advancedays) {
		super(number);
		this.advancedays = advancedays;
	}
	
	// 입장권의 가격 반환
	public double getPrice() {
		if (advancedays >= 30) price = price * 0.5;
		else if (advancedays >= 10) price = price * 0.8;
		else if (advancedays >= 5) price = price * 0.9;
		
		return price;
	}
	
	// 예약 입장권의 사전 예약일수 반환
	public int getAdvancedays() {
		return advancedays;
	}
	
	// 예약 입장권의 현재 상태 반환
	public String toString() {
		String tempStr = "";
		
		tempStr += "번호: " + getNumber();
		tempStr += ", 사전 예약일수: " + getAdvancedays();
		tempStr += ", 가격: " + getPrice();
		
		return tempStr;
	}
}
