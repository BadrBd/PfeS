package BadrBd.ShopBackEnd.dao;

import java.util.List;

import BadrBd.ShopBackEnd.dto.Cart;
import BadrBd.ShopBackEnd.dto.CartLine;
import BadrBd.ShopBackEnd.dto.OrderDetail;



public interface CartLineDAO {

	public List<CartLine> list(int cartId);
	public CartLine get(int id);	
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean remove(CartLine cartLine);
	
	// fetch the CartLine based on cartId and productId
	public CartLine getByCartAndProduct(int cartId, int productId);		
		
	// updating the cart
		boolean updateCart(Cart cart);
		
	// list of available cartLine
	public List<CartLine> listAvailable(int cartId);
	
	// adding order details
		boolean addOrderDetail(OrderDetail orderDetail);

	
}
