/**
 * 
 */

/**
 * @author user
 *
 */
public class TestFindChar {

	public static void main(String[] args) {
		String target = "abcdef";
		char c = 'c';
		int location = findChar(c, target);
		System.out.println(location);
	}
	
	public static int findChar(char c, String s) {
		boolean found = false; // s에서 c를 찾았는지?
		int index = 0; // 지금 s에서 어느 위치를 보고 있는지?
		while (!found && index < s.length()) {
			// 루프 불변식:
			// (1) found==false 경우, c가 s의 0...(index-1)가지 없었다.
			// (2) found==true 경우, c==s.charAt(index)
			if (s.charAt(index) == c)
				found = true;
			else
				index = index + 1;
		}
		if (!found) 
			index = -1; // 못찾은 경우 -1 반환
		return index;
		
	}

}
