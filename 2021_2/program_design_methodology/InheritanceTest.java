// Employee, Manager, Executive 객체 만들어 시험
public class InheritanceTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 객체들 만든다
		Employee emp = new Employee("홍길동", 100000.0);
		Manager mng = new Manager("강감찬", 200000.0, 50000.0);
		Executive exc = new Executive("이순신", 400000.0, 100000.0, 100000.0);
		
		// 각 객체의 봉급을 올린다
		emp.raiseSalary();
		mng.raiseSalary();
		exc.raiseSalary();
		
		// 결과 출력
		System.out.println(emp.getName() + ":봉급 = " + emp.getSalary());
		System.out.println(mng.getName() + ":봉급 = " + mng.getSalary() + " 보너스 = " + mng.getBonus());
		System.out.println(exc.getName() + ":봉급 = " + exc.getSalary() + " 보너스 = " + mng.getBonus()
													+ " 스톡 옵션 = " + exc.getStockOption());
	}

}
