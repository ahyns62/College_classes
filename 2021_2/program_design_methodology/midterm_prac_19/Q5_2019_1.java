package midterm_prac_19;
import javax.swing.JOptionPane;

class Coins {
	private int quaters; // 25 cents
	private int dimes; // 10 cents
 	private int nickels; // 5 cents
	private int pennies; // 1 cent
	public Coins(int initial_amount) {
		// initial_amount is given in cents 
		// fill here!
		int money = initial_amount;
		if (initial_amount < 0)
			initial_amount = 0;
		quaters = money / 25;
		money = money % 25;
		dimes = money / 10;
		money = money % 10;
		nickels = money / 5;
		money = money % 5;
		pennies = money / 1;
			
	}
	public Coins add(Coins other) {
		// fill here!
		return new Coins(this.tocents() + other.tocents());
	}
	public int tocents() {
		// fill here!
		return quaters * 25 + dimes * 10 + nickels * 5 + pennies;
	}
}

class BankAccount1 {
    private Coins balance;

    public BankAccount1(Coins initial_amount) {
    	// fill here!
    		balance = initial_amount;
    }
    public Coins getBalance() {
    	// fill here!
    	return balance;
    }
    public boolean deposit(Coins coins) {
    	// fill here!
    	int amount = coins.tocents();
    	boolean result = false;
    	if (amount < 0)
    		System.out.println("잘못된 입금액");
    	else {
    		balance = balance.add(coins);
    		result = true;
    	}
    	return result;
    }
}

public class Q5_2019_1 {
 public static void main(String[] args) {
    Coins coins = new Coins(100); 
    BankAccount1 account = new BankAccount1(coins);
    account.deposit(coins);
    System.out.println("balance = " + account.getBalance().tocents()); // balance = 200
  }
}
