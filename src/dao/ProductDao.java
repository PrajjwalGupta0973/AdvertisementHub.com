package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.ProductBean;

public class ProductDao implements ProductDaoIF{
	Connection con =null;
	PreparedStatement ps=null;
	ResultSet result=null;
private	String insertQuery="insert into product(prod_id,user_id,content,name,prod_type,thumb,price,category) values(?,?,?,?,?,?,?,?)";
private	String getProductByUserId="select prod_id,user_id,content,name,prod_type,thumb,price,category from product where userId=?";
private	String getProductByProdId="select prod_id,user_id,content,name,prod_type,thumb,price,category from product where prod_id=?";
private String searchQuery="select prod_id,user_id,content,name,prod_type,thumb,price,category from product where category=? or name=? limit 20 offset ?";	
	
	//establish connection method
	boolean establishConnection() {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/masterdatabase","root","PrajjwalB4@");
		if(con!=null){
			return true;
		}
		}
		catch(SQLException se) {
		se.printStackTrace();
		}
		catch(ClassNotFoundException cnf) {
			cnf.printStackTrace();
		}
		return false;
	}//establishConnection
		
	//insert new user to database
	@Override
	public int insert(beans.ProductBean product) throws SQLException{
	
		//check whether connection has established
	boolean checkConnection=establishConnection();
	int result=0;
	if(checkConnection) {
		try {
			ps=con.prepareStatement(insertQuery);
			//set column values
ps.setInt(1,product.getProductId());
ps.setInt(2,product.getUserId());
ps.setString(3,product.getContent());
ps.setString(4, product.getName());
ps.setString(5,product.getProductType());
ps.setString(6, product.getThumb());
ps.setFloat(7,product.getPrice());
ps.setString(8,product.getCategory());
result=ps.executeUpdate();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
				finally {
					try {
			ps.close();
			}catch(SQLException se) {se.printStackTrace();}
		}

return result;
	}
	else
	return result;
}//insert

//getProduct
	@Override
public ProductBean getProductByUserId(int userId) {
	//check whether connection has established
		boolean checkConnection=establishConnection();
		//get object of user bean
		ProductBean product=new ProductBean();
	try {
		if(checkConnection) {
	ps=con.prepareStatement(getProductByUserId);
	ps.setInt(1,userId);
	result=ps.executeQuery();
	if(result.next()) {
		product.setProductId(result.getInt(1));
		product.setUserId(result.getInt(2));
		product.setContent(result.getString(3));
		product.setName(result.getString(4));
		product.setProductType(result.getString(5));
		product.setThumb(result.getString(6));
		product.setPrice(result.getFloat(7));
		product.setCategory(result.getString(8));
		return product;
	}
	}
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
finally {
	try {
		ps.close();
	}catch(SQLException se) {
		se.printStackTrace();
	}
	}
	return product;
	
}//getProduct()_by userId
	
	//getProductById
	@Override
	public ProductBean getProductByProdId(int prodId) {
		//check whether connection has established
			boolean checkConnection=establishConnection();
			//get object of user bean
			ProductBean product=new ProductBean();
		try {
			if(checkConnection) {
		ps=con.prepareStatement(getProductByProdId);
		ps.setInt(1,prodId);
		result=ps.executeQuery();
		while(result.next()) {
			product.setProductId(result.getInt(1));
			product.setUserId(result.getInt(2));
			product.setContent(result.getString(3));
			product.setName(result.getString(4));
			product.setProductType(result.getString(5));
			product.setThumb(result.getString(6));
			product.setPrice(result.getFloat(7));
			product.setCategory(result.getString(8));
			return product;
		}
		}
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
	finally {
		try {
			ps.close();
		}catch(SQLException se) {
			se.printStackTrace();
		}
		}
		return product;
		
	}//getProduct()by prodId
	
	//getting search results
	@Override
	public ArrayList<ProductBean> search(String keyword){
		//check whether connection has established
		boolean checkConnection=establishConnection();
		//get object of user bean
		ArrayList<ProductBean> products=new ArrayList<ProductBean>();
	try {
		if(checkConnection) {
	ps=con.prepareStatement(searchQuery);
	ps.setString(1,keyword);
	ps.setString(2,keyword);
	ps.setInt(3,0);
	result=ps.executeQuery();
	while(result.next()) {
		ProductBean product=new ProductBean();
		product.setProductId(result.getInt(1));
		product.setUserId(result.getInt(2));
		product.setContent(result.getString(3));
		product.setName(result.getString(4));
		product.setProductType(result.getString(5));
		product.setThumb(result.getString(6));
		product.setPrice(result.getFloat(7));
		product.setCategory(result.getString(8));
		products.add(product);
	}
	}
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
finally {
	try {
		ps.close();
	}catch(SQLException se) {
		se.printStackTrace();
	}
	}
	return products;
	
	}//search()
}//class
