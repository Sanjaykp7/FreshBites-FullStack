import java.security.Timestamp;
import java.util.Scanner;

import com.tap.daoimplementation.MenuDAOImplimentaion;
import com.tap.daoimplementation.OrderDAOImplimentation;
import com.tap.daoimplementation.RestaurantDAOImplimentation;
import com.tap.daoimplementation.UserDAOImplimentation;
import com.tap.model.Menu;
import com.tap.model.Order;
import com.tap.model.Restaurant;
import com.tap.model.User;

public class Launch {

	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);

		System.out.println("enter email");
		String email= scan.nextLine();
	//	int id = scan.nextInt();

		UserDAOImplimentation userDAOImplimentation = new UserDAOImplimentation();
//		User user = userDAOImplimentation.getUser(id);
//		
//		System.out.println(user.getName());
//		System.out.println(user.getEmail());
//		System.out.println(user.getPassword());
//		System.out.println(user.getPhone());
//		System.out.println(user.getAddress());
		
		
		User userByEmail = userDAOImplimentation.getUserByEmail(email);
		System.out.println(userByEmail.getName());
		System.out.println(userByEmail.getEmail());
		System.out.println(userByEmail.getPhone());
		System.out.println(userByEmail.getAddress());
		System.out.println(userByEmail.getPassword());
	}
}
