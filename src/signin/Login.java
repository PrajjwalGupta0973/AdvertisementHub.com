package signin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoFactory;
import dao.UserDao;

public class Login extends HttpServlet{
	private static final long serialVersionUID = 1L;

@Override
protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
	boolean result=false;
	//adding extra headers for no-cache
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Exapires", "0");
		HttpSession session=request.getSession();
		if(session.getAttribute("user")==null||session.getAttribute("user")=="") {
			
	String email=request.getParameter("email");
	String password=request.getParameter("password"); 
	UserDao ud=DaoFactory.getInstanceUserDao();//get userdao instance from factory method
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	//check for null values of email and/or password
	if((email!="" && email!="")&& (password!=null && password!="")) {
	//validate user credentials
	result=ud.validateUser(email,password);
	
	}
	else {
		out.print("Login Failed!<br>Incorrect email or password!<br><a href=\"signin\">Try again</a><br><a href=\"welcome\">Go to Home</a>");
	return;
	}
	if(result) {
		session.setAttribute("user", email);
		//set inactive time interval to infinite (by setting negative value)
		session.setMaxInactiveInterval((1800));
		request.getRequestDispatcher("WEB-INF\\webpages\\images.jsp").include(request, response);
		}
	else {
		out.print("Login Failed!<br>Incorrect email or password!<br><a href=\"signin\">Try again</a><br><a href=\"welcome\">Go to Home</a>");
	return;
	}
	}
		else {
			request.getRequestDispatcher("WEB-INF\\webpages\\images.jsp").include(request, response);
		}
}//doPost()
}//class
