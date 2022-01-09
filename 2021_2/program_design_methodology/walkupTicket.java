// 일반 입장권
public class walkupTicket extends Ticket {
	// 신용카드로 결제하는지 여부 저장
	private boolean payBYcredit;
	
	// 생성자 메소드
	// 입장권의 변수값을 주어진 값으로 초기화
	public walkupTicket(int number, boolean payBYcredit) {
		super(number);
		this.payBYcredit = payBYcredit;
	}
	
	// 입장권의 가격 반환
	public double getprice() {
		if (payBYcredit) return price * 1.05;
		else return price;
	}
	
	// 입장권의 신용카드 결제 여부
	public boolean getPayByCredit() {
		return payBYcredit;
	}
	
	// 일반 입장권의 현재 상태를 반환
	public String toString() {
		String tempStr = "";
		tempStr += "번호 " + getNumber();
		tempStr += ", 신용카드 결제: " + getPayByCredit();
		tempStr += ", 가격: " + getPrice();
		
		return tempStr;
	}
}
