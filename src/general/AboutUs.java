package general;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AboutUs extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		//adding extra headers for no-cache
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Exapires", "0");
	HttpSession session=request.getSession();
	if(session.getAttribute("user")==null||session.getAttribute("user")=="") {
		request.getRequestDispatcher("WEB-INF\\webpages\\AboutUs.html").include(request, response);
		
	}
	else {
		request.getRequestDispatcher("WEB-INF\\webpages\\AboutUs.jsp").include(request, response);
	
	}
	}//doGet()
}//class
