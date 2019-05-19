package BadrBd.ShopBackEnd;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import BadrBd.ShopBackEnd.dao.UserDAO;
import BadrBd.ShopBackEnd.dto.Address;
import BadrBd.ShopBackEnd.dto.Cart;
import BadrBd.ShopBackEnd.dto.User;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("BadrBd.ShopBackEnd");
		context.refresh();
		
		userDAO = (UserDAO) context.getBean("userDAO");
	}
	
	
	/*
	@Test
	public void testAddUser() {
		
		user = new User() ;
		user.setFirstName("Hrithik");
		user.setLastName("Roshan");
		user.setEmail("hr@gmail.com");
		user.setContactNumber("1234512345");
		user.setRole("USER");
		user.setPassword("12345");
		
		// add the user
	    assertEquals("Failed to add the user!", true, userDAO.add(user));	
		
		address = new Address();
		address.setAddressLineOne("101/B Jadoo Society, Krissh Nagar");
		address.setAddressLineTwo("Near Kaabil Store");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("400001");
		address.setBilling(true);
		
		
		
		// linked the address with the user
		address.setUserId(user.getId());
		
		
		// add the address
		assertEquals("Failed to add the billing address!", true, userDAO.addAddress(address));

	if(user.getRole().contentEquals("USER")) {
		//create a cart for this user
		cart=new Cart();
		cart.setUser(user);
		
		//add the cart
		assertEquals("Failed to add cart!",true,userDAO.addCart(cart));
		
		// add a shipping adress for the user
		address = new Address();
		address.setAddressLineOne("201/B Jadoo Society, Kishan Kanhaiya Nagar");
		address.setAddressLineTwo("Near Kudrat Store");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("400001");
		address.setShipping(true);
		
		//link it with the user
		address.setUserId(user.getId());
		
		//add the shipping address
		assertEquals("Failed to add shipping address!",true, userDAO.addAddress(address));
		
		
	}
	}
	*/
	/*
	@Test
	public void testAdd() {
		
		user = new User() ;
		user.setFirstName("Hrithik");
		user.setLastName("Roshan");
		user.setEmail("hr@gmail.com");
		user.setContactNumber("1234512345");
		user.setRole("USER");
		user.setPassword("12345");
		
		
		
		

	if(user.getRole().contentEquals("USER")) {
		//create a cart for this user
		cart=new Cart();
		cart.setUser(user);
		
		
		//attach cart to the user
		user.setCart(cart);
		
	}
	// add the user
    assertEquals("Failed to add the user!", true, userDAO.add(user));	
    
	}
	
	*/
	
	/*
	@Test
	public void testUpdateCart() {
		user =userDAO.getByEmail("hr@gmail.com");
		cart = user.getCart();
		cart.setGrandTotal(4633);
		cart.setCartLines(3);
		assertEquals("Failed update cart",true,userDAO.updateCart(cart));
	} 

	
	
	
	@Test
	public void testAddAddress() {
		
		//create a new user
		user = new User() ;
		user.setFirstName("Hrithik");
		user.setLastName("Roshan");
		user.setEmail("hr@gmail.com");
		user.setContactNumber("1234512345");
		user.setRole("USER");
		user.setPassword("12345");
		
		//add the user
		 assertEquals("Failed to add the user!", true, userDAO.add(user));
		
		 //add address
		address = new Address();
		address.setAddressLineOne("301/B Jadoo Society, King Uncle Nagar");
		address.setAddressLineTwo("Near Store");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("400001");
		address.setBilling(true);
		
		
		
			// attach the user to the adress	
		address.setUser(user);
		
		// add the address
		assertEquals("Failed to add the address!", true, userDAO.addAddress(address));	
		
		
		// add a shipping adress for the user
				address = new Address();
				address.setAddressLineOne("201/B Jadoo Society, Kishan Kanhaiya Nagar");
				address.setAddressLineTwo("Near Kudrat Store");
				address.setCity("Mumbai");
				address.setState("Maharashtra");
				address.setCountry("India");
				address.setPostalCode("400001");
				address.setShipping(true);
				
				// attach the user to the adress	
				address.setUser(user);
				
				// add the address
				assertEquals("Failed to add the shipping address!", true, userDAO.addAddress(address));
				
				
	}
	*/
	
	
	/*
	@Test
	public void testAddAddress() {
		
		user = userDAO.getByEmail("hr@gmail.com");
		// add a shipping adress for the user
		address = new Address();
		address.setAddressLineOne("201/B Jadoo Society, Kishan Kanhaiya Nagar");
		address.setAddressLineTwo("Near Kudrat Store");
		address.setCity("Casa");
		address.setState("h1n1");
		address.setCountry("Morocco");
		address.setPostalCode("20600");
		address.setShipping(true);
		
		// attach the user to the adress	
		address.setUser(user);
		
		// add the address
		assertEquals("Failed to add the shipping address!", true, userDAO.addAddress(address));
		
	}
	
	*/
	@Test
	public void testGetAddresses() {
		user = userDAO.getByEmail("hr@gmail.com");
		assertEquals("Failed to the list of addresses  and size doesnt match !", 2, userDAO.listShippingAddresses(user.getId()).size());

		assertEquals("Failed to the list of addresses  and size doesnt match !","Mumbai", userDAO.getBillingAddress(user.getId()).getCity());

		
	}
	
}
