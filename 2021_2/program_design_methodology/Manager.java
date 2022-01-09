// 매니저를 모델
public class Manager extends Employee {
	protected double bonus;
	
	// 생성자 메소드
	public Manager(String name, double salary, double bonus) {
		super(name, salary);
		this.bonus = bonus;
	}
	
	// 보너스 반환
	public double getBonus() {
		return bonus;
	}
	
	// 봉급 올림
	public void raiseSalary() {
		salary = salary * 1.2;
	}
}
