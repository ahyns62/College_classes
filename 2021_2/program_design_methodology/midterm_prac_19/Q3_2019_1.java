package midterm_prac_19;

public class Q3_2019_1 {
	public static int getOccurrence (String s, String sub) {
			int count = 0; 
			for (int i = 0; i <= s.length() - sub.length(); i++) {
				// fill here!
				// 다음을 사용: s.substring(i1,i2): 구간 i1 ~  i2-1에 해당하는 s의 부분문자열 반환
				if(sub.equals(s.substring(i, i + sub.length())))
			         count++;
			   
		}
		return count;
	}
		
	public static void main(String[] args) {
		System.out.println(getOccurrence("abcd ab", "ab")); // 2
		System.out.println(getOccurrence("bbbb", "bb")); // 3
	}
}
	
	
