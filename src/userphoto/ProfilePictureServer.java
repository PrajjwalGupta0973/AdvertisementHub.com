package userphoto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ProductBean;
import beans.UserBean;
import dao.DaoFactory;
import dao.ProductDao;
import dao.UserDao;

public class ProfilePictureServer extends HttpServlet{
	private static final long serialVersionUID = 1L;

@Override
protected void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
	HttpSession session=request.getSession();
	//check login
	if(session.getAttribute("user")==null||session.getAttribute("user").toString()=="") {
		request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").include(request, response);
	}
	try {
		//get image path from database	
		UserDao ud=DaoFactory.getInstanceUserDao();
		UserBean user=ud.getUser(session.getAttribute("user").toString());
		String imagePath=user.getUserPhotoThumb();
		System.out.println(user.getUserPhotoThumb());
		
		
		if(imagePath==null) {
			request.getRequestDispatcher("profilemissing.jpg").forward(request, response);
		}
		else{
		//get image from disk
		File img=new File(imagePath);
		FileInputStream fis=new FileInputStream(img);
		//write to output
		ServletOutputStream out=response.getOutputStream();
		byte[] outByte=new byte[(int)img.length()];
		while(fis.read(outByte,0,(int)img.length())!=-1) {
			out.write(outByte,0,(int)img.length());
		}
		fis.close();
		}
	}
		catch(Exception e) {
			e.printStackTrace();
		}
		
}//doGet
}//class
