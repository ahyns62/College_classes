
public class LocationTester {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Location erica = new Location(37.32, 126.83);
		Location seoul = new Location(37.55, 127.04);
		
		System.out.println("한양대 ERICA - 서울 캠 간 거리: "+erica.distance(seoul) + " km");
	}

}
