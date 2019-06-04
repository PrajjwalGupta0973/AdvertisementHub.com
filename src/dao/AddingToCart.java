package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

import beans.UserBean;

public class AddingToCart {
	Connection con=null;
	PreparedStatement ps=null;
private String query="insert into cart values(?,?)";
private String alreadyExist="select user_id,prod_id from cart where user_id=? and prod_id=?";

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
//insert into cart
public int addCart(int prodId,String usermail) {
	int result=0;
	//check connection
	if(establishConnection()) {
	try {
		UserDao ud=DaoFactory.getInstanceUserDao();
		UserBean user=ud.getUser(usermail);
		ps=con.prepareStatement(alreadyExist);
		ps.setInt(2, prodId);
		ps.setInt(1, user.getUserId());
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			return (-1);
		}
	ps=con.prepareStatement(query);
	ps.setInt(2, prodId);
	ps.setInt(1, user.getUserId());
	result=ps.executeUpdate();
	return result;
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
	}
	return result;
}
}//class
