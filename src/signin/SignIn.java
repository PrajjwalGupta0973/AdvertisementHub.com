package signin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignIn extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		HttpSession session=request.getSession();
		//adding extra headers for no-cache
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0");
		if(session.getAttribute("user")==null||session.getAttribute("user")=="") {
			request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").include(request, response);
			
		}
		else {
			request.getRequestDispatcher("WEB-INF\\webpages\\images.jsp").include(request, response);
		
		}
	}

}
