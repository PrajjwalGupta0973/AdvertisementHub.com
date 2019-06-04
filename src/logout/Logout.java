package logout;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//adding extra headers for no-cache
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0");
    	try {
    	HttpSession session=request.getSession();
    	//check whether request is coming by forced manually typed url but user is already logged out 
    	if(session.getAttribute("user")!=null || session.getAttribute("user")!="") {
    		//if not already logged out then perform logout
    session.setAttribute("user","");
		session.invalidate();
		RequestDispatcher rd=request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html");
		//using include because of adding extra headers from this class
		rd.include(request, response);
    	}
    	else {
    		//use include not forward because adding extra headers from this class
    		request.getRequestDispatcher("WEB-INF\\webpages\\images.html").include(request, response);
       	}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	
}
