package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.UserBean;

public class UserDao implements UserDaoIF {
	Connection con =null;
	PreparedStatement ps=null;
private	String insertQuery="insert into user_info(fname,lname,email,password,mob_no) values(?,?,?,?,?)";
private	String validateQuery="select * from user_info where email=? and password=? ";
private	String getUserQuery="select user_id,fname,lname,email,password,user_photo,user_photo_thumb,mob_no from user_info where email=?";
private	String updateUserPhotoQuery="update user_info set user_photo=?,user_photo_thumb=? where email=?";
private String updateUserQuery="update user_info set fname=?,lname=?,email=?,password=?,mob_no=? where email=? ";
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
		
	//insert new user to database
	public int insert(beans.UserBean user) throws SQLException{
		//check whether connection has established
	boolean checkConnection=establishConnection();
	int result=0;
	if(checkConnection) {
		try {
			ps=con.prepareStatement(insertQuery);
			//set column values
ps.setString(1,user.getFirstName());
ps.setString(2,user.getLastName());
ps.setString(3,user.getEMail());
ps.setString(4,user.getPassword());
ps.setLong(5,user.getMobNo());
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
	
	// User validation for login process
@Override
public boolean validateUser(String email,String password) {
	//check whether connection has established
	boolean checkConnection=establishConnection();
	try {
	if(checkConnection) {
		
		ps=con.prepareStatement(validateQuery);
		//set column values
		ps.setString(1,email);
		ps.setString(2,password);
		result=ps.executeQuery();
		return result.next();	
	}//if
	else
		return false;
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
	}//finally
	return false;
}//validateUser

//getUser
@Override
public UserBean getUser(String email) {
	//check whether connection has established
		boolean checkConnection=establishConnection();
		//get object of user bean
		UserBean user=new UserBean();
	try {
		if(checkConnection) {
	ps=con.prepareStatement(getUserQuery);
	ps.setString(1,email);
	result=ps.executeQuery();
	if(result.next()) {
		user.setUserId(result.getInt(1));
		user.setFirstName(result.getString(2));
		user.setLastName(result.getString(3));
		user.setEMail(result.getString(4));
		user.setPassword(result.getString(5));
		user.setUserPhoto(result.getString(6));
		user.setUserPhotoThumb(result.getString(7));
		user.setMobNo(result.getLong(8));
		return user;
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
	return user;
	
}//getUser()

//insertUserPhoto
@Override
public int updateUserPhoto(UserBean user){
	boolean checkConnection=establishConnection();
	try {
		if(checkConnection) {
			//prepare statement
			ps=con.prepareStatement(updateUserPhotoQuery);
			//set values
			ps.setString(1,user.getUserPhoto());
			ps.setString(2, user.getUserPhotoThumb());
			ps.setString(3,user.getEMail());
			//execute query
			int result=ps.executeUpdate();	
			return result;
		}
	}catch(SQLException se) {
		se.printStackTrace();
	}
	finally {
		try {
			ps.close();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
	}
	return 0;
}//updateUserPhoto()

//Update user informations
@Override
public int updateUserInfo(UserBean user,String oldEmail){
	boolean checkConnection=establishConnection();
	try {
		if(checkConnection) {
			//prepare statement
			ps=con.prepareStatement(updateUserQuery);
			//set values
			ps.setString(1,user.getFirstName());
			ps.setString(2,user.getLastName());
			ps.setString(3,user.getEMail());
			ps.setString(4,user.getPassword());
			ps.setLong(5,user.getMobNo());
			ps.setString(6,oldEmail);
			//execute query
			int result=ps.executeUpdate();	
			return result;
		}
	}catch(SQLException se) {
		se.printStackTrace();
	}
	finally {
		try {
			ps.close();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
	}
	return 0;
}//updateUserInfo()

}//class
