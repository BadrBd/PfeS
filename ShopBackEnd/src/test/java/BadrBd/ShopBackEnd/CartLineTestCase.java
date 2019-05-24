package BadrBd.ShopBackEnd;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import static org.junit.Assert.assertEquals;

import BadrBd.ShopBackEnd.dao.CartLineDAO;
import BadrBd.ShopBackEnd.dao.ProductDAO;
import BadrBd.ShopBackEnd.dao.UserDAO;
import BadrBd.ShopBackEnd.dto.Cart;
import BadrBd.ShopBackEnd.dto.CartLine;
import BadrBd.ShopBackEnd.dto.Product;
import BadrBd.ShopBackEnd.dto.User;

public class CartLineTestCase {
private static AnnotationConfigApplicationContext context;
	
	
	private static CartLineDAO cartLineDAO = null;;
	private static ProductDAO productDAO = null;;
	private static UserDAO userDAO = null;;
	
	private User user = null;
	private Cart cart = null;
	private CartLine cartLine = null;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("BadrBd.ShopBackEnd");
		context.refresh();
		cartLineDAO = (CartLineDAO)context.getBean("cartLineDAO");
		productDAO = (ProductDAO)context.getBean("productDAO");
		userDAO = (UserDAO)context.getBean("userDAO");
	}
	

	@Test
	public void testAddCartLine() {
		
		// fetch the user and then cart of that user
		User user = userDAO.getByEmail("zizo@gmail.com");		
		Cart cart = user.getCart();
		
		// fetch the product 
		Product product = productDAO.get(2);
		
		// Create a new CartLine
		cartLine = new CartLine();
		
		
		
		cartLine.setBuyingPrice(product.getUnitPrice());
		cartLine.setProductCount(cartLine.getProductCount() + 1);
		cartLine.setAvailable(true);
		cartLine.setTotal(cartLine.getProductCount()*product.getUnitPrice());
		cartLine.setCartId(cart.getId());
		cartLine.setProduct(product);
		
		
		
		
		assertEquals("Failed to add the CartLine!",true, cartLineDAO.add(cartLine));
		
		
		//update cart
		cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal() );
		cart.setCartLines(cart.getCartLines() + 1);
		
		assertEquals("Failed to update the cart!",true, userDAO.updateCart(cart));
	}
	
	
	/*	
	@Test
	public void testUpdateCartLine() {

		// fetch the user and then cart of that user
		User user = userDAO.getByEmail("absr@gmail.com");		
		Cart cart = user.getCart();
				
		cartLine = cartLineDAO.getByCartAndProduct(cart.getId(), 2);
		
		cartLine.setProductCount(cartLine.getProductCount() + 1);
				
		double oldTotal = cartLine.getTotal();
				
		cartLine.setTotal(cartLine.getProduct().getUnitPrice() * cartLine.getProductCount());
		
		cart.setGrandTotal(cart.getGrandTotal() + (cartLine.getTotal() - oldTotal));
		
		assertEquals("Failed to update the CartLine!",true, cartLineDAO.update(cartLine));	

		
	}
	*/
	
	
}
