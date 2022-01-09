/** twelveHourClock: 24시간제를 12시간제로 변경
 * @param hour - 시
 * @param minute - 분
 * @return 12시간제 시간(문자열)
 */

public class twelveHourClock{

	public String twelveHourClock(int hour, int minute) {
		// TODO Auto-generated method stub
		String answer = ""; //답을 여기다 누적할 것.
		if (hour<0 || hour>23 || minute<0 || minute>59)
			answer = "입력 오류, " + hour + ":" + minute; //오류
		else {
			if (hour<12)
				answer = answer + "오전 ";
			else
				answer = answer + "오후 ";
			if (hour>=13)
				answer = answer + (hour-12);
			else
				answer = answer + hour;
			answer = answer + ":";
			if (minute<10)
				answer = answer + "0";
			answer = answer + minute;
		}
		return answer;
	}
	
}


