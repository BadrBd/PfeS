package BadrBd.PfeShop.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import BadrBd.PfeShop.model.RegisterModel;
import BadrBd.ShopBackEnd.dao.UserDAO;
import BadrBd.ShopBackEnd.dto.Address;
import BadrBd.ShopBackEnd.dto.Cart;
import BadrBd.ShopBackEnd.dto.User;


@Component
public class RegisterHandler {
     @Autowired
	private UserDAO userDAO;
	
	public RegisterModel init() {
		
		return new RegisterModel();
		
	}
	
	public void addUser(RegisterModel registerModel, User user) {
		
		registerModel.setUser(user);
		
	}
	
	public void addBilling(RegisterModel registerModel, Address billing) {
		
		registerModel.setBilling(billing);
		
	}
	
	
	 public String validateUser(User user, MessageContext error) {
		  String transitionValue = "success";
		   if(!user.getPassword().equals(user.getConfirmPassword())) {
		    error.addMessage(new MessageBuilder().error().source(
		      "confirmPassword").defaultText("Passwords does not match!").build());
		    transitionValue = "failure";    
		   }  
		   if(userDAO.getByEmail(user.getEmail())!=null) {
		    error.addMessage(new MessageBuilder().error().source(
		      "email").defaultText("Email address is already taken!").build());
		    transitionValue = "failure";
		   }
		  return transitionValue;
		 }
	
	
	
	 public String saveAll(RegisterModel registerModel) {
		  String transitionValue = "success";
		  User user = registerModel.getUser();
		  if(user.getRole().equals("USER")) {
		   // create a new cart
		   Cart cart = new Cart();
		   cart.setUser(user);
		   user.setCart(cart);
		  }
		  
		  
		  // save the user
		  userDAO.add(user);
		  // save the billing address
		  Address billing = registerModel.getBilling();
		  billing.setUserId(user.getId());
		  billing.setBilling(true);   
		  userDAO.addAddress(billing);
		  return transitionValue;
		 } 
		}

