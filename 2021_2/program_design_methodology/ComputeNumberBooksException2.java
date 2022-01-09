import java.util.Scanner;

public class ComputeNumberBooksException2
{
    public static void main(String[] args)
    {
        int money;  // 금액
        int price;  // 책의 가격
        int count;  // 책들의 최대 갯수

        Scanner scan = new Scanner(System.in);

        try {
            System.out.print("금액을 입력하세요: " );
            money = scan.nextInt();

            System.out.print("책의 가격을 입력하세요: ");
            price = scan.nextInt();

            // 구매 가능한 책들의 최대 권수를 계산한다
            if (price == 0) 
                throw new DivideByZeroException("예외 발생: 책의 가격이 0이다!");

            count = money / price;
            System.out.println("책들의 최대 권수: " + count);
        }
        catch (DivideByZeroException e) {
            System.out.println(e.getMessage());
            System.out.println("예외 처리: 책의 가격은 0보다 커야 한다.");
        }
    }
}       
