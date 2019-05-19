package BadrBd.ShopBackEnd.dao;

import java.util.List;

import BadrBd.ShopBackEnd.dto.Address;
import BadrBd.ShopBackEnd.dto.Cart;
import BadrBd.ShopBackEnd.dto.User;

public interface UserDAO {

	
	    // adding a user
		boolean add(User user);
	
		User getByEmail(String email);
		

		
		// adding and updating a new address
		boolean addAddress(Address address);
		Address getBillingAddress(int userId);
		List<Address> listShippingAddresses(int userId);

		// updating a new cart
		boolean updateCart(Cart cart);
	

}