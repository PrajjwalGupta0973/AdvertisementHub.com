package dao;

import java.sql.SQLException;
import java.util.List;

import beans.ProductBean;

public interface ProductDaoIF {
	public int insert(beans.ProductBean product) throws SQLException;
	public ProductBean getProductByUserId(int userId) ;
	public ProductBean getProductByProdId(int prodId);
	public List<ProductBean> search(String keyword);
}
