// 10명의 학생들의 점수들을 입력받아 평균을 구하고 각 점수가 평균 이상 혹은 미만인지 보여준다.
import java.util.Scanner;
public class ProcessScore {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] scores = new int[10];
		double sum = 0.0;
		double average;
		Scanner scan = new Scanner(System.in);
		
		System.out.println("10명의 학생들의 점수를 입력하세요:");
		
		for(int i = 0; i < 10; i++) {
			scores[i] = scan.nextInt();
			sum += scores[i];
			
		}
		
		average = sum / 10.0;
		
		System.out.println("평균= " + average);
		
		for(int i = 0; i < 10; i++) {
			System.out.print("점수" + scores[i]);
			
			if(scores[i] > average)
				System.out.println("은 평균 이상이다.");
			else
				System.out.println("은 평균보다 작다.");
		}
	}

}
