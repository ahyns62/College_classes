// 출납원 모델
public class Cashier {
	Queue customerQueue = new Queue();
	
	// 고객들의 줄에 고객을 추가
	public void addCustomer(Object obj) {
		customerQueue.enqueue(obj);
	}
	
	// 줄의 맨 앞에 있는 고객을 서비스한다
	public void getNextCustomer() {
		Customer cust;
		try {
			cust = (Customer)(customerQueue.dequeue());
			System.out.println("고객" + cust.getName() + "님이 계산하셨습니다.");
		}
		catch(QueueEmptyException e) {
			System.out.println("기다리는 고객이 없어서 예외(" + e.toString() + ")이 발생한다");
		}
	}
}
