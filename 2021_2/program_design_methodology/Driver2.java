// 출납원이 줄을 선 고객들을 서비스하는 것을 시뮬레이션함
public class Driver2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 출납원 객체 생성
		Cashier cs = new Cashier();
		
		// 고객들이 줄을 선다
		cs.addCustomer(new Customer("고객 1"));
		cs.addCustomer(new Customer("고객 2"));
		cs.addCustomer(new Customer("고객 3"));
		
		// 고객을 서비스한다
		cs.getNextCustomer();
		cs.getNextCustomer();
		cs.getNextCustomer();
		cs.getNextCustomer();
	}

}
