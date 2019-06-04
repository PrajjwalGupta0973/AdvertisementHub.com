package signin;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserBean;
import dao.DaoFactory;
import dao.UserDao;;
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected  void doPost(HttpServletRequest request,HttpServletResponse response)  throws ServletException,
    IOException{
	 UserBean user=new UserBean();
	 HttpSession session;
	//adding extra headers for no-cache
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0");
	 user.setFirstName(request.getParameter("firstname"));
	 user.setLastName(request.getParameter("lastname"));
	user.setEMail(request.getParameter("email"));
	user.setPassword(request.getParameter("password"));
	user.setMobNo(Long.parseLong(request.getParameter("mobile")));
	
	if((user.getFirstName()!=null && user.getLastName()!=null) && (user.getEMail()!=null && user.getPassword()!=null)) {
	//make object of UserDao
	UserDao ud=DaoFactory.getInstanceUserDao();
	try {
	ud.insert(user);
	session=request.getSession();
	session.setAttribute("user",request.getParameter("email"));
	request.getRequestDispatcher("WEB-INF\\webpages\\profileinfo.jsp").include(request, response);
	}
	catch(SQLException se) {
		se.printStackTrace();
	}
	}
	
	}//method
}//servlet