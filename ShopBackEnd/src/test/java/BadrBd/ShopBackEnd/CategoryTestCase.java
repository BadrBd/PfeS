package BadrBd.ShopBackEnd;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import BadrBd.ShopBackEnd.dao.CategoryDAO;
import BadrBd.ShopBackEnd.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;

	private static CategoryDAO categoryDAO;

	private Category category;
	private Category category2;

	@BeforeClass
	public static void init() {

		context = new AnnotationConfigApplicationContext();
		context.scan("BadrBd.ShopBackEnd");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");

	}

	/*
	 * @Test public void testCRUDCategory() {
	 * 
	 * // add operation category = new Category();
	 * 
	 * category.setName("Laptop");
	 * category.setDescription("This is some description for laptop!");
	 * category.setImageURL("CAT_1.png");
	 * 
	 * assertEquals("Successfully added a category inside the table!",true,
	 * categoryDAO.add(category));
	 * 
	 * 
	 * category2 = new Category();
	 * 
	 * 
	 * category2.setName("Laptop"); category2.setDescription("This is !");
	 * category2.setImageURL("CAT_2.png");
	 * 
	 * assertEquals("Successfully added a category!",true,categoryDAO.add(category2)
	 * );
	 * 
	 * 
	 * 
	 * }
	 */

	/*
	 * @Test public void testGetCategory() {
	 * 
	 * category = categoryDAO.get(3);
	 * assertEquals("Successfully fetched a singlke category from the table !"
	 * ,"Laptop",category.getName());
	 * 
	 * 
	 * }
	 * 
	 * @Test public void testUpdateCategory() {
	 * 
	 * category = categoryDAO.get(3); category.setName("TV");
	 * assertEquals("Successfully updated a singlke category from the table !",true,
	 * categoryDAO.update(category));
	 * 
	 * 
	 * }
	 * 
	 * 
	 * @Test public void testDeleteCategory() {
	 * 
	 * category = categoryDAO.get(3);
	 * assertEquals("Successfully updated a singlke category from the table !",true,
	 * categoryDAO.delete(category));
	 * 
	 * 
	 * }
	 * 
	 * @Test public void testListCategory() {
	 * 
	 * 
	 * assertEquals("Successfully fetched list category from the table !",2,
	 * categoryDAO.list().size());
	 * 
	 * 
	 * }
	 */
	@Test
	public void testCRUDCategory() {
		
		// add operation
		category = new Category();
		
		category.setName("Laptop");
		category.setDescription("This is some description for laptop!");
		category.setImageURL("CAT_1.png");
		
		assertEquals("Successfully added a category inside the table!",true,categoryDAO.add(category));
		
		
		category = new Category();
		
		
		category.setName("Television");
		category.setDescription("This is Television!");
		category.setImageURL("CAT_2.png");
		
		assertEquals("Successfully added a category!",true,categoryDAO.add(category));
		
        category = new Category();
		
		
		category.setName("Phone");
		category.setDescription("This is phone!");
		category.setImageURL("CAT_3.png");
		
		assertEquals("Successfully added a category!",true,categoryDAO.add(category));
		
		
		// fetch
		category = categoryDAO.get(2);
	
		// update operation
		category.setName("TV");
		assertEquals("Successfully updated a singlke category from the table !",true,categoryDAO.update(category));
		
		// delete operation
        assertEquals("Successfully deleted a singlke category from the table !",true,categoryDAO.delete(category));
		
		
		// list operation
		assertEquals("Successfully  list category from the table !",2,categoryDAO.list().size());

		
	}
}
