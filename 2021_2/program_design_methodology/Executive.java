// 임원을 모델
public class Executive extends Manager {
	protected double stockOption;
	
	// 생성자 메소드
	public Executive(String name, double salary, double bonus, double stockOption) {
		super(name, salary, bonus);
		this.stockOption = stockOption;
	}
	
		
	// 스톡 옵션 반환
	public double getStockOption() {
		return stockOption;
	}
	
	// 봉급 올림
	public void raiseSalary() {
		salary = salary * 1.1;
	}
}
