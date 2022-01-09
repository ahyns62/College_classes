// 자동차 판매원의 평균 판매 대수와 각 분기의 평균 판매 대수를 구한다

public class CalculateAverage {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] salesTable = {{72, 85, 93, 97}, {136, 178, 154, 239}, {52, 178, 154,
			239}, {156, 170, 203, 236}, {94, 123, 156, 178}};
		
		int i, j, sum;
		String[] names = {"홍길동", "임꺽정", "김갑돌", "이칠복", "강진추"};
		double[] rowaverage = new double [5];
		double[] columnaverage = new double [4];
		
		// 판매원들의 분기별 판매 대수 출력
		System.out.println("판매원\t 1분기 \t 2분기 \t 3분기 \t 4분기");
		
		for(i = 0; i < 5; i++) {
			System.out.print(names[i]);
			
			for(j = 0; j < 4; j++) {
				System.out.print("\t" + salesTable[i][j]);
				
			}
			System.out.println();
		}
		System.out.println();
		
		// 각 판매원의 평균 판매 대수를 구한다
		for(i = 0; i < salesTable.length; i++) {
			sum = 0;
			
			for(j = 0; j < salesTable[i].length; j++) {
				sum += salesTable[i][j];
				
				rowaverage[i] = sum / 4.0;
				System.out.println("판매원" + (i+1) + "의 평균 판매대수" + rowaverage[i]);
			}
			
		}
		
		// 각 분기의 평균 판매 대수를 구한다
		System.out.println();
		
		for(j = 0; j < 4; j++) {
			sum = 0;
			
			for(i = 0; i < 5; i++) {
				sum += salesTable[i][j];
				
				columnaverage[j] = sum / 5.0;
				System.out.println("분기" + (j+1) + "의 평균 판매대수" + columnaverage[j]);
			}
		}
		
		}

}
