package dao;

import java.sql.SQLException;

import beans.UserBean;

public interface UserDaoIF {
	//insert new user
 public int insert (beans.UserBean user)throws SQLException;
 //validate user for login process
 public boolean validateUser(String email,String password) ;
 public UserBean getUser(String email) ;
 public int updateUserPhoto(UserBean user);
 public int updateUserInfo(UserBean user,String oldEmail);
}
