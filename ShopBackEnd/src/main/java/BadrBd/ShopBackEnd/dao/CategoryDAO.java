package BadrBd.ShopBackEnd.dao;

import java.util.List;

import BadrBd.ShopBackEnd.dto.Category;


public interface CategoryDAO {

	Category get(int id);
	List<Category> list();
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);



}
