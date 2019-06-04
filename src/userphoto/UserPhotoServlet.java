package userphoto;

import java.io.File;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import beans.UserBean;
import dao.DaoFactory;
import dao.UserDao;
import general.ThumbWriter;

public class UserPhotoServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private boolean isMultipart;
	   private int maxFileSize = 50 * 1024*1024;
	   private int maxMemSize =10 * 1024*1024;
	   private String filePath;
	   private String baseLocation;
	   private File file ;
	   String email;
	   
	   public void init( ){
	      // Get the file location where it would be stored.
	       baseLocation=getServletContext().getInitParameter("baseLocation");
	       filePath=baseLocation;
	   }
	   
	   public void doPost(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, java.io.IOException {
		 //adding extra headers for no-cache
		   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
			response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
			response.setHeader("Expires", "0");
		   File pathMaker=null;
		   File thumbFile=null;
		   try {
		   String filePath=this.filePath;
	      // Check that we have a file upload request
	      isMultipart = ServletFileUpload.isMultipartContent(request);
	      response.setContentType("text/html");
	     PrintWriter out = response.getWriter( );
	   
	      if( !isMultipart ) {
	         out.println("<html>");
	         out.println("<head>");
	         out.println("<title>upload</title>");  
	         out.println("</head>");
	         out.println("<body>");
	         out.println("<p>No file uploaded!</p><br><a href=\"editphoto\">Try again</a>"); 
	         out.println("</body>");
	         out.println("</html>");
	         return;
	      }
	  
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	   
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
	   
	      // Location to save data that is larger than maxMemSize.
	      factory.setRepository(new File(baseLocation+"\\temp"));

	      // Create a new file upload handler
	      ServletFileUpload upload = new ServletFileUpload(factory);
	   
	      // maximum file size to be uploaded.
	      upload.setSizeMax( maxFileSize );

	      try { 
	         // Parse the request to get file items.
	         List<FileItem> fileItems = upload.parseRequest(request);
		
	         // Process the uploaded file items
	         Iterator<FileItem> i = fileItems.iterator();

	         out.println("<html>");
	         out.println("<head>");
	         out.println("<title>upload</title>");  
	         out.println("</head>");
	         out.println("<body>");
	   
	 if ( i.hasNext () ) {
	            FileItem fi = (FileItem)i.next();
	            if ( !fi.isFormField () ) {
	               // Get the uploaded file parameters
	               String fieldName = fi.getFieldName();
	               String fileName = fi.getName();
	               String contentType = fi.getContentType();
	               boolean isInMemory = fi.isInMemory();
	               long sizeInBytes = fi.getSize();
	               // get user from session
	               HttpSession session=request.getSession(false);
	               if(session!=null)
	               email=session.getAttribute("user").toString();
	               UserBean user=DaoFactory.getInstanceUserDao().getUser(email);
	             // Writing process begins
	               String thumbPath=filePath.concat("\\"+user.getUserId()+"\\profilephoto\\thumb\\");
	               filePath=filePath.concat("\\"+user.getUserId()+"\\profilephoto\\original\\");
	                    pathMaker=new File(filePath);
	                pathMaker.mkdirs();
	                pathMaker=new File(thumbPath);
		               pathMaker.mkdirs();
	             if( fileName.lastIndexOf("\\") >= 0 ) {
	                  file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
	                  thumbFile=new File( thumbPath + fileName.substring( fileName.lastIndexOf("\\"))) ;
	               } else {
	                  file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	                  thumbFile=new File( thumbPath + fileName.substring( fileName.lastIndexOf("\\")+1)) ;
	               }
	                     if(fileName!="") {
	            	   
	               fi.write( file ) ;
	                Thread thumbCreator=new Thread(new ThumbWriter(thumbFile.getCanonicalPath(),file.getCanonicalPath()));
	               thumbCreator.start();
	               //make entry of photo in the database
	               filePath=file.getCanonicalPath();
	               thumbPath=thumbFile.getCanonicalPath();
	               user.setUserPhoto(filePath);
	               if("1"=="1") {
	               user.setUserPhotoThumb(thumbPath);
	               }
	               user.setEMail(email);
	              new UserDao().updateUserPhoto(user);
	               }
	               else {
	            	   out.print("No file choosen");
	            	   out.print("<a href=\"editphoto\">Back</>");
	            	   return ;
	            	   }
	            	   
	               out.println("Profile picture has been changed with File: " + fileName + "<br><a href=\"profileinfo\">Back</a> <a href=\"welcome\">Go to Hoome</a>");
	            }
	         }
	         out.println("</body>");
	         out.println("</html>");
	         } catch(Exception ex) {
	            ex.printStackTrace();
	         }
		   }//try
		   catch(Exception ex) {
			   ex.printStackTrace();
		   }
	      }//method
	      
	      
	   }

