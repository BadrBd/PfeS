package BadrBd.PfeShop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import BadrBd.PfeShop.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	
	@Autowired
	private CartService cartService;

	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "User Cart");
		mv.addObject("userClickShowCart", true);
		
		if(result!=null) {
			switch(result) {
			
			case "added":
				mv.addObject("message", "Product has been successfully added inside cart!");					
			
				break;
				
				case "updated":
					mv.addObject("message", "cart updated!");					
					break;
					
				case "deleted":
					mv.addObject("message", "CartLine removed successfully!");
					break;
					
				case "error":
					mv.addObject("message", "smtg went wrong!");
					break;
					
				case "unavailable":
					mv.addObject("message", "Product quantity is not available!");					
					break;
					
				case "maximum":
					mv.addObject("message", "Maximum limit for the item has been reached!");
					break;

			}
		}
		
		
		mv.addObject("cartLines", cartService.getCartLines());
		return mv;
		
	}
	
	
	
	@RequestMapping("/{cartLineId}/update")
	public String udpateCartLine(@PathVariable int cartLineId, @RequestParam int count) {
		String response = cartService.manageCartLine(cartLineId, count);		
		return "redirect:/cart/show?"+response;		
	}
	
	@RequestMapping("/{cartLineId}/delete")
	public String removeCartLine(@PathVariable int cartLineId) {
		String response = cartService.deleteCartLine(cartLineId);
		return "redirect:/cart/show?"+response;
	}
	
	@RequestMapping("/add/{productId}/product")
	public String addCart(@PathVariable int productId) {
		String response = cartService.addCartLine(productId);
		return "redirect:/cart/show?"+response;
	}
	
}
