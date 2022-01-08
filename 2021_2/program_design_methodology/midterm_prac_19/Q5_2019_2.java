package midterm_prac_19;
class Currency {
	private double dollars;
	private double won;
 	private double yen;
	
	public Currency(double initial_amount) {
		// initial_amount is given in won 
		// fill here! 
		double money = initial_amount;
		if (initial_amount < 0)
			initial_amount = 0;
		dollars = money / 1000.0;
		won = money;
		yen = money / 10.0;
		
	}
	public Currency add(Currency other) {
		// fill here!
		return new Currency(this.getWon() + other.getWon());
	}
	public double getDollars() {
		// fill here!
		return dollars;
	}
	public double getWon() {
		// fill here!
		return won;
	}
	public double getYen() {
		// fill here!
		return yen;
	}
}

class BankAccount2{
    private Currency balance;

    public BankAccount2(Currency initial_amount) {
    	// fill here!
    	balance = initial_amount;
    }

    public Currency getBalance() {
    	// fill here!
    	return balance;
    }

    public boolean deposit(Currency money) {
    	// fill here!
    	double amount = money.getWon();
    	boolean result = false;
    	if (amount < 0)
    		System.out.println("잘못된 입금액");
    	else {
    		balance = balance.add(money);
    		result = true;
    	}
    	return result;
    }
}

public class Q5_2019_2 {
  public static void main(String[] args) {
	Currency money = new Currency(100); 
    BankAccount2 account = new BankAccount2(money);
    account.deposit(money);
    System.out.println("balance = " + account.getBalance().getDollars()); // balance = 0.2
  }
}
