package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.ProductBean;

public class GetCartItems {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet result=null;
	private String getProductIds="select prod_id from cart where user_id=?";
	//establish connection
	boolean establishConnection() {
		try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/masterdatabase","root","PrajjwalB4@");
		if(con!=null)
			return true;
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		catch(ClassNotFoundException cnf) {
			cnf.printStackTrace();
		}
		return false;
	}

	
public ArrayList<ProductBean> retrieveItems(int userId) {
	ArrayList<ProductBean> products=new ArrayList<ProductBean>();
	if(establishConnection()) {
	try {
	//retrieve products' ids of the products added by the user in the table cart
		ps=con.prepareStatement(getProductIds);
	ps.setInt(1,userId);
	result=ps.executeQuery();
	result.last();
	int countProducts=result.getRow();
	int[] productIds=new int[countProducts]; //array for the products' ids returned from the database
	result.beforeFirst();
	for(int i=0;result.next();i++) {
		productIds[i]=result.getInt(1);
	}//get the products from the "product" table by products' ids
	
ProductDao pd=DaoFactory.getInstanceProductDao();
for(int i=0;i<productIds.length;i++) {
	products.add(pd.getProductByProdId(productIds[i]));
	
}
return products;
	}
	catch (SQLException se) {
		se.printStackTrace();
	}
	finally {
		//close the resources
		try {
		ps.close();
		result.close();
		con.close();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
	}
	}
return products;
}
}//class
