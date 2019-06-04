package dao;

public class DaoFactory {
	//get the instance of UserDao class
public static UserDao getInstanceUserDao() {
	return new UserDao();
}
public static ProductDao getInstanceProductDao(){
	return new ProductDao();
}
public static CategoriesDao getInstanceCategoriesDao() {
	return new CategoriesDao();
}
public static ImageRepresentingCategory getInstanceIRC() {
	return new ImageRepresentingCategory();
}
public static AddingToCart getInstannceAddingToCart() {
	return new AddingToCart();
}
public static GetCartItems getInstanceGetCartItem() {
	return new GetCartItems();
}
}
