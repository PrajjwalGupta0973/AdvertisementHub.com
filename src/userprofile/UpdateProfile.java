package userprofile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserBean;
import dao.DaoFactory;
import dao.UserDao;

public class UpdateProfile extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		UserBean user=new UserBean();
		PrintWriter out=response.getWriter();
		out.print("<html><head></head><body>");
		 HttpSession session=request.getSession();
		 String oldEmail=session.getAttribute("user").toString();//get old email to use in "where" clause in query
		 //form UserBean with new data
		 user.setFirstName(request.getParameter("firstname"));
		 user.setLastName(request.getParameter("lastname"));
		user.setEMail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setMobNo(Long.parseLong(request.getParameter("mobile")));
		if((user.getFirstName()!=null && user.getLastName()!=null) && (user.getEMail()!=null && user.getPassword()!=null)) {
		//make object of UserDao
		UserDao ud=DaoFactory.getInstanceUserDao();
		ud.updateUserInfo(user,oldEmail);
		session=request.getSession();
		session.setAttribute("user",request.getParameter("email"));
		out.print("All informations successfully updated!<br><a href=\"welcome\">Go to Home</a>");
		out.print("</body></html>");
		}
		
	}

}
