/** printPolarity: 인수가 음수인지 양수인지 출력
 * 
 */
public class printPolarity {

	public static void printPolarity(int i) {
		// TODO Auto-generated method stub
		System.out.print("인수 " + i + "는 ");
		if (i<0)
			System.out.print("음수");
		
		else
			System.out.print("양수");
			System.out.print("입니다.");
		
	}
	public static void main(String[] args) {
		printPolarity(-3);
	}
}
