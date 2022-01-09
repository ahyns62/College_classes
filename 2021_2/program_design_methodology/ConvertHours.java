import javax.swing.*;

/** ConvertHours: 시를 초로 변환
 * 입력: 양수
 * 출력: 입력 시간을 초로 변환한 수
 */
public class ConvertHours {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s = JOptionPane.showInputDialog("시를 입력하세요:");
		int hours = Integer.parseInt(s);
		if (hours >= 0) {
			// 시가 양수이기 때문에 초를 계산할 수 있다.
			int seconds = hours * 60 * 60;
			JOptionPane.showMessageDialog(null, hours + " 시간은 " +
												seconds + " 초입니다.");
			
		}
		else {
			// 시가 음수이기 때문에 오류이다.
			JOptionPane.showMessageDialog(null,
							"ConvertHours error: negative input " + hours);
		}
	}
}
