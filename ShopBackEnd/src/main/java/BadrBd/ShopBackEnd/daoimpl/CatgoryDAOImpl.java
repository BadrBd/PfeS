package BadrBd.ShopBackEnd.daoimpl;

import java.util.ArrayList;

import java.util.List;

import org.springframework.stereotype.Repository;

import BadrBd.ShopBackEnd.dao.CategoryDAO;
import BadrBd.ShopBackEnd.dto.Category;




@Repository("categoryDAO")
public class CatgoryDAOImpl implements CategoryDAO {

	
	
	private static List<Category> categories = new ArrayList<>();

	
	static {
		
		Category category3 = new Category(); 
		category3.setId(1);
		category3.setName("badreddine");
		category3.setDescription("new");
		category3.setImageURL("CAT.png");
		categories.add(category3);

		
		
		
		Category category2 = new Category();
		category2.setId(2);
		category2.setName("marwane");
		category2.setDescription("new2");
		category2.setImageURL("CAT2.png");
		
		
		categories.add(category2);
		
		
		

	}
	
	
	@Override 
	public List<Category> list(){
		
		return categories;
	}


	@Override
	public Category get(int id) {
		for(Category category:categories) {
		if(category.getId()==id)
		return category; }
		return null;
	}
	
	

}
