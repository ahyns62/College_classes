// 학부생
public class Undergraduate extends Student {
	private String clubName;
	
	// 학부생의 변수들 값을 기본 값으로 초기화하면서 객체 생성
	public Undergraduate() {
		super();
		clubName = "";
	}
	
	// 학부생의 변수들 값을 매개변수 값으로 초기화하면서 객체 생성
	public Undergraduate(String Name, int Number, String ClubName) {
		super(Name, Number);
		setClubName(ClubName);
	}
	
	// 학부생의 동아리 이름 반환
	public String getClubName() {
		return clubName;
	}
	
	// 현 객체의 현재 상태를 나타내는 문자열 반환
	public String toString() {
		return super.toString() + ", 동아리 이름: " + getClubName();
	}
	
	// 현 객체의 현재 상태가 other 객체와 같은지 알려준다
	public boolean equals(Undergraduate other) {
		return (super.equals(other)) & (this.clubName.equals(other.clubName));
	}
	
	// 학부생의 동아리 이름을 주어진 값으로 변경
	public void setClubName(String ClubName) {
		clubName = ClubName;
	}
}
