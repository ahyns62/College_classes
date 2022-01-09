/** TotalVariables computes the amount of change I have,
 * based on the values named by the four variables,
 * quarters, dimes, nickels, and pennies.
 */

public class CoinsVariables {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int quarters = 9;
		int dimes = 2;
		int nickels = 0;
		int pennies = 6;
		System.out.println("For these quantities of coins:");
		System.out.println("Quarters =" + quarters);
		System.out.println("Dimes =" + dimes);
		System.out.println("Nickes =" + nickels);
		System.out.println("Pennies =" + pennies);
		System.out.print("The total is " );
		int total = (quarters*25) + (dimes*10) + (nickels*5) + (pennies*1);
		System.out.print("The total is $");
		System.out.print(total/100);
		System.out.print(".");
		System.out.println(total % 100);
	}

}
