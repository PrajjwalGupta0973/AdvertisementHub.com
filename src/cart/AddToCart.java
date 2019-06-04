package cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AddingToCart;
import dao.DaoFactory;

public class AddToCart extends HttpServlet{
		private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException {
AddingToCart atc=DaoFactory.getInstannceAddingToCart();
int prodId=Integer.parseInt(request.getParameter("product"));
String usermail=null;
HttpSession session=request.getSession();
if(session!=null)
	if(session.getAttribute("user")!=null) {
	usermail=session.getAttribute("user").toString();
int result=atc.addCart(prodId, usermail);
if(result==(-1)) {
	response.setContentType("text");
	response.getWriter().write("Already added!");
}
else {
response.setContentType("text");
response.getWriter().write("successful");
}
	}
	else {
		response.setContentType("text");
		response.getWriter().write("Please login first");
	}
}//doGet
}//class
