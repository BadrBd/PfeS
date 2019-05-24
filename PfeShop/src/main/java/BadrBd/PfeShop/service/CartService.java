package BadrBd.PfeShop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BadrBd.PfeShop.model.UserModel;
import BadrBd.ShopBackEnd.dao.CartLineDAO;
import BadrBd.ShopBackEnd.dao.ProductDAO;
import BadrBd.ShopBackEnd.dto.Cart;
import BadrBd.ShopBackEnd.dto.CartLine;
import BadrBd.ShopBackEnd.dto.Product;

@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private ProductDAO productDAO;
		
	@Autowired
	private HttpSession session;
	
	
	private Cart getCart() {
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}
	
	public List<CartLine> getCartLines() {

		return cartLineDAO.list(getCart().getId());

	}

	public String manageCartLine(int cartLineId, int count) {
		// Fetch the cart line
		
		
	CartLine cartLine = cartLineDAO.get(cartLineId);
	if(cartLine == null) {
		
		return "result=error";
	
	}
	
	else {
		Product product = cartLine.getProduct();
		double oldTotal = cartLine.getTotal();
		
		
		// check the availability of the product
		if(product.getQuantity() < count) {
			count = product.getQuantity();
			return "result=unavailable";
		}
		cartLine.setProductCount(count);
		cartLine.setBuyingPrice(product.getUnitPrice());
		cartLine.setTotal(product.getUnitPrice() * count);
		cartLineDAO.update(cartLine);
		Cart cart = this.getCart();
		cart.setGrandTotal(cart.getGrandTotal() - oldTotal + cartLine.getTotal());
		cartLineDAO.updateCart(cart);
		
		
		
		return "result=updated";
	}
	}

	public String deleteCartLine(int cartLineId) {
		CartLine cartLine = cartLineDAO.get(cartLineId);
		// deduct the cart
		// update the cart
		
		if(cartLine == null) {
			return "result=error";
		}else {
		Cart cart = this.getCart();	
		cart.setGrandTotal(cart.getGrandTotal() - cartLine.getTotal());
		cart.setCartLines(cart.getCartLines() - 1);		
		cartLineDAO.updateCart(cart);
		
		// remove the cartLine
		cartLineDAO.remove(cartLine);
				
		return "result=deleted";
	}
		}

	public String addCartLine(int productId) {
		Cart cart = this.getCart();
		String response = null;
		CartLine cartLine = cartLineDAO.getByCartAndProduct(cart.getId(), productId);
		if(cartLine==null) {
			// add a new cartLine if a new product is getting added
			cartLine = new CartLine();
			Product product = productDAO.get(productId);
			// transfer the product details to cartLine
			cartLine.setCartId(cart.getId());
			cartLine.setProduct(product);
			cartLine.setProductCount(1);
			cartLine.setBuyingPrice(product.getUnitPrice());
			cartLine.setTotal(product.getUnitPrice());
			
			// insert a new cartLine
			cartLineDAO.add(cartLine);
			
			// update the cart
			cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
			cart.setCartLines(cart.getCartLines() + 1);
			cartLineDAO.updateCart(cart);

			response = "result=added";						
		} 
		else {
			// check if the cartLine has been already reached to maximum count
			if(cartLine.getProductCount() < 3) {
				// call the manageCartLine method to increase the count
				response = this.manageCartLine(cartLine.getId(), cartLine.getProductCount() + 1);				
			}			
			else {				
				response = "result=maximum";				
			}						
		}		
		return response;
	}
	
	
}
