package beans;

public class UserBean {
private String firstName;
private String lastName;
private String eMail;
private String password;
private long mobNo;
private String userPhoto;
private String userPhotoThumb;
private int userId;
		//setters
public void setUserId(int userId) {
	this.userId=userId;
}
public void setFirstName(String firstName) {
	this.firstName=firstName;
}
public void setLastName(String lastName) {
	this.lastName=lastName;
}
public void setEMail(String eMail) {
	this.eMail=eMail;
}
public void setPassword(String password) {
	this.password=password;
}
public void setMobNo(long mobNo) {
	this.mobNo=mobNo;
}
public void setUserPhoto(String userPhoto) {
	this.userPhoto=userPhoto;
}
public void setUserPhotoThumb(String userPhotoThumb) {
	this.userPhotoThumb=userPhotoThumb;
	}
		//getters
public int getUserId() {
	return userId;
}
public String getFirstName() {
	return firstName;
}
public String getLastName() {
	return lastName;
	
}
public String getEMail() {
	return eMail;
}
public String getPassword() {
	return password;
}
public long getMobNo() {
	return mobNo;
}
public String getUserPhoto() {
	return userPhoto;
}
public String getUserPhotoThumb() {
	return userPhotoThumb;
}
}
