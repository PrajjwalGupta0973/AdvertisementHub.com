package customcss;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomCss extends HttpServlet{
	private static final long serialVersionUID = 1L;
@Override
protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	RequestDispatcher rd=request.getRequestDispatcher("customcss\\custom.css");
	rd.forward(request, response);
}
}
