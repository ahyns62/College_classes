import javax.swing.JOptionPane;

public class TestAverage {

	public static double computeAverageModified(int i) {
		// TODO Auto-generated method stub
		double total_points = 0.0; // 총점
		int count = 0; // 얼마나 읽었나? 루프 카운터
		boolean processing = true;
		while (processing)
		// 매 반복마다 다음을 만족한다. 루프 불변식 (loop invariant) 
		// count >= 0
		// total_score == exam_1 + exam_2 + ... + exam_count
		{
			//시험점수 입력 받는다.
			String input = JOptionPane.showInputDialog("Type next exam score:");
			if (input == null) processing = false;
			else {
			int score = new Integer(input).intValue();
			total_points = total_points + score; //누적
			count = count + 1;
			// 진행결과를 인쇄
			System.out.println("count = " + count + "; total = " + total_points);
			
		}
		}
		if (count == 0) {
			throw new RuntimeException("error: no input supplied.");
		}
		
		// 결론 : total_points = exam_1 + exam_2 + ... + exam_how_many
		return (total_points / count); 
	}
	
	public static void main(String[] args) {
		System.out.println("The average score is " + computeAverageModified(5));
	}
}
