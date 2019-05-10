package BadrBd.PfeShop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import BadrBd.PfeShop.exception.ProductNotFoundException;
import BadrBd.ShopBackEnd.dao.CategoryDAO;
import BadrBd.ShopBackEnd.dao.ProductDAO;
import BadrBd.ShopBackEnd.dto.Category;
import BadrBd.ShopBackEnd.dto.Product;


@Controller
public class PageController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	
	@RequestMapping(value = {"/", "/home", "/index"})
	public ModelAndView index() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Home");
		
		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - DEBUG");
		
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("userClickHome",true);

		
		return mv;
}
	
	@RequestMapping(value = {"/about"})
	public ModelAndView about() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","About Us");
		mv.addObject("userClickAbout",true);

		return mv;
}
	
	@RequestMapping(value = {"/contact"})
	public ModelAndView contact() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Contact Us");
		mv.addObject("userClickContact",true);

		return mv;
}
	
	@RequestMapping(value = {"/show/all/products"})
	public ModelAndView showAllProducts() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","All Products");
		
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("userClickAllProducts",true);

		return mv;
}
	
	

	@RequestMapping(value = {"/show/category/{id}/products"})
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {		
		ModelAndView mv = new ModelAndView("page");
		
		
		Category category= null;
		category = categoryDAO.get(id);
		category = categoryDAO.get(id);

		
		mv.addObject("title",category.getName());
		
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("category",category);

		mv.addObject("userClickCategoryProducts",true);

		return mv;
}
	

	/*
	 * Viewing a single product
	 * */
	
	@RequestMapping(value = "/show/{id}/product") 
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
		
		ModelAndView mv = new ModelAndView("page");
		
		Product product = productDAO.get(id);
		if(product == null) throw new ProductNotFoundException();
		
		
		// update the view count
		product.setViews(product.getViews() + 1);
		productDAO.update(product);
		//---------------------------
		
		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		
		mv.addObject("userClickShowProduct", true);
		
		
		return mv;
		
	}
	
	
/*@RequestMapping(value="/test")	
public ModelAndView test(@RequestParam(value="greeting",required=false)String greeting) {	
	{
		if(greeting == null) {
			greeting = "Hello there";
		}
	}
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("greeting",greeting);
		return mv;
}
	@RequestMapping(value="/test/{greeting}")	
	public ModelAndView test(@PathVariable(value="greeting")String greeting) {	
		{
			if(greeting == null) {
				greeting = "Hello there";
			}
		}
			ModelAndView mv = new ModelAndView("page");		
			mv.addObject("greeting",greeting);
			return mv;
	}
	
	*/
	
	
	
}
