
public class TestIsPrime {

	public static void main(String[] args) {
		int i = 17;
		System.out.println( isPrime(i));
	}
	
	public static int isPrime(int n) {
		int answer = -1;
		if (n < 2) {
			System.out.println("isPrime error: invalid argument" + n);
			
		}
		else {
			boolean item_found = false; // 인수를 찾았니?
			int current = n/2; // 현재 검색 중인 것
			while (!item_found && current > 1)
			{// 루프 불변식:
				// (1) found == false 경우, n이 c+1...n/2로 나누어 지지 않는다.
				// (2) found == true 경우, n이 c로 나누어진다.
				if (n % current == 0)
					item_found = true;
				else
					current = current - 1;
			}
			if (item_found)
				answer = current;
			else
				answer = 1;
		}
		return answer;
	}

}
