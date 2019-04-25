package BadrBd.ShopBackEnd.dao;

import java.util.List;

import BadrBd.ShopBackEnd.dto.Category;


public interface CategoryDAO {

	
	
	List<Category> list();
	Category get(int id);
	
}
