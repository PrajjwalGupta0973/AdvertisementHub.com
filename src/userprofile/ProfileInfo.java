package userprofile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserBean;
import dao.DaoFactory;
import dao.UserDao;

public class ProfileInfo extends HttpServlet{
	private static final long serialVersionUID = 1L;

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
	//adding extra headers for no-cache
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
			response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
			response.setHeader("Expires", "0");
	HttpSession session=request.getSession();
	//check if request url coming manually 
	if(session.getAttribute("user")==null||session.getAttribute("user")=="")
		request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").include(request, response);
	else {
		UserDao ud=DaoFactory.getInstanceUserDao();
	UserBean user= ud.getUser(session.getAttribute("user").toString());
	request.setAttribute("fName", user.getFirstName());
	request.setAttribute("lName", user.getLastName());
	request.setAttribute("email", user.getEMail());
	request.setAttribute("mobNo", user.getMobNo());
	}
	
	
}//doGet()
}//class
