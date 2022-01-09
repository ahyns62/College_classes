import javax.swing.*;
/** MakeChange - calculates the change for the amounts in variables
 * dollars and cents.
 */

public class MakeChange {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s = JOptionPane.showInputDialog("Type dollars, an integer:");
		int dollars = Integer.parseInt(s);
		
		int dollars1 = getInt("달러?");
		int cents = getInt("센트?");
		if (dollars1 < 0 || cents < 0 || cents > 99)
			showError(dollars1 + " 또는 " + cents + "는 잘못된 입력입니다.");
		else {
			int money = (dollars1 * 100) + cents;
			String output = ("quarters = " + (money / 25));
			money = money % 25;
			output = output + "\n dimes = " + (money / 10);
			money = money % 10;
			output = output + "\n nickels = " + (money / 5);
			money = money % 5;
			output = output + "\n pennies = " + money;
			JOptionPane.showMessageDialog(null, output);
		}
		
		
	}

	private static void showError(String string) {
		// TODO Auto-generated method stub
		
	}

	private static int getInt(String string) {
		// TODO Auto-generated method stub
		return 0;
	}

}
