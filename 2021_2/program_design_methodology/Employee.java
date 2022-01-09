// 직원을 모델
public class Employee {
	protected String name;
	protected double salary;
	
	// 생성자 메소드
	public Employee(String name, double salary) {
		this.name = name;
		this.salary = salary;
	}
	
	// 이름, 봉급 반환
	public String getName() {
		return name;
	}
	
	public double getSalary() {
		return salary;
	}
	
	// 봉급을 올림
	public void raiseSalary() {
		salary = salary * 1.3;
	}

}
