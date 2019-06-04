package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImageRepresentingCategory {
private String getCategoryImage="select prod_id from product where category=? limit 1";
static Connection con=null;
static ResultSet result=null;
static PreparedStatement ps=null;
static boolean checkConnection=false;
		//establish connection
static {
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/masterdatabase","root","PrajjwalB4@");
	if(con!=null) {
		checkConnection= true;
	}
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
	catch(ClassNotFoundException cnf) {
		cnf.printStackTrace();
	}
}
	//getImage (returns only product Id)
	public int getImage(String category){
		if(checkConnection) {
			try {
				ps=con.prepareStatement(getCategoryImage);
				ps.setString(1, category);
				result=ps.executeQuery();
				if(result.next())
				return result.getInt(1);
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			}
		return -1;
	}
}//class
