package cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ProductBean;
import beans.UserBean;
import dao.DaoFactory;
import dao.GetCartItems;
import dao.UserDao;

public class ViewCart extends HttpServlet{
	private static final long serialVersionUID = 1L;

@Override
protected void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0");
	HttpSession session=request.getSession();
	if(session!=null) {
		if(session.getAttribute("user")!=null) {
			UserBean user=new UserBean();
			UserDao ud=DaoFactory.getInstanceUserDao();
			//getUser
			user=ud.getUser(session.getAttribute("user").toString());
			int userId=user.getUserId();
			GetCartItems Gci=DaoFactory.getInstanceGetCartItem();
			ArrayList<ProductBean> itemArray=Gci.retrieveItems(userId);
			request.setAttribute("itemArray", itemArray);
			request.getRequestDispatcher("WEB-INF\\webpages\\cart.jsp").include(request, response);
				
				 
		}
		else
			request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").include(request, response);
	}
	else
		request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").include(request, response);
	
}//doGet()
}//class
