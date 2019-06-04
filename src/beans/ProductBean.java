package beans;

import java.io.Serializable;

public class ProductBean implements Serializable{
	private static final long serialVersionUID = 1L;
private int productId;
private int userId;
private String content;
private String name;
private String productType;
private String thumb;
private float price;
private String category;

		//setters
public void setProductId(int productId) {
	this.productId=productId;
}
public void setUserId(int userId) {
	this.userId=userId;
}
public void setContent(String content) {
	this.content=content;
}
public void setName(String name) {
	this.name=name;
}
public void setProductType(String productType) {
	this.productType=productType;
}
public void setThumb(String thumb) {
	this.thumb=thumb;
}
public void setPrice(float price) {
	this.price=price;
}
public void setCategory(String category) {
	this.category=category;
}

		//getters
public int getUserId() {
	return userId;
}
public int getProductId() {
	return productId;
}
public String getContent() {
	return content;
}
public String getName() {
	return name;
}
public String getProductType() {
	return productType;
}
public String getThumb() {
	return thumb;
}
public float getPrice() {
	return price;
}
public String getCategory() {
	return category;
}
}//class
