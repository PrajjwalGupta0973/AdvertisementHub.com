package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoriesDao implements CategoriesDaoIF{
	private String getQuery="select category from all_categories";
	String allCategories [];
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet result=null;
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
		@Override	
public String[] getCategories(){
	//check whether connection has established
			boolean checkConnection=establishConnection();
	try {
		if(checkConnection) {
	ps=con.prepareStatement(getQuery);
	result=ps.executeQuery();
	result.last();
	allCategories= new String[result.getRow()];
	result.beforeFirst();
	for(int i=0;result.next();i++) {
		allCategories[i]=result.getString(1);
		}
		}
return allCategories;
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
	finally {
		try {
		ps.close();
		result.close();
		con.close();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
	}//finally
	return null;
}//getCategories
}//class
