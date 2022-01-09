// Undergraduate 객체들을 만들어 실험
public class Driver {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 학부생 객체 만들기
		Undergraduate understud1 = new Undergraduate();
		
		understud1.setName("선남");
		understud1.setNumber(1601);
		understud1.setClubName("로봇");
		
		// understud1의 현 상태를 출력
		System.out.println(understud1.toString());
		
		// 이름이 '선녀'이고 학번이 1602이고 소속동아리명이 '독서'인 학부생 객체를 만든다
		Undergraduate understud2 = new Undergraduate("선녀", 1602, "독서");
		
		System.out.println(understud2.toString());
		
		// understud1이 가리키는 객체와 understud2가 가리키는 객체가 서로 같은지 비교
		if (understud1.equals(understud2))
			System.out.println("두 객체가 서로 같다");
		else
			System.out.println("두 객체가 서로 다르다");
		
	}

}
