package uploadcontent;

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

import beans.ProductBean;
import beans.UserBean;
import dao.DaoFactory;
import dao.ProductDao;
import dao.UserDao;
import general.ThumbWriter;

public class SaveContent extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private boolean isMultipart;
	   private int maxFileSize = 50 * 1024*1024;
	   private int maxMemSize =10 * 1024*1024;
	   private String filePath;
	   private String baseLocation;
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
			//get dao instances
            UserDao ud=DaoFactory.getInstanceUserDao();  
             ProductDao pd=DaoFactory.getInstanceProductDao();
             ProductBean product=new ProductBean();
				   UserBean user=new UserBean();
				   String fileName=null;
				   String thumbPath=null;
				   FileItem fi=null;
				   File thumbFile=null;
				   File file=null; 
		   File pathMaker=null;
		   String contentType=null;
		   float price=0;
		   String category="select";
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
	         out.println("<p>No file uploaded!</p><br><a href=\"upload\">Try again</a>"); 
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
	         out.println("<title>Upload content</title>");  
	         out.println("</head>");
	         out.println("<body>");
	        
				 while ( i.hasNext () ) {
					 String name=null;
	             fi = (FileItem)i.next();
	            if (fi.isFormField()) {
	                 name = fi.getFieldName();
	                 
	                 if(name.contentEquals("price")) {
	                 if(!fi.getString().isEmpty())
	                price = Float.parseFloat(fi.getString());
	                 else {
	                	 out.print("Please fill the price");
	  	            	   out.print("<br><a href=\"upload\">Back</>");
	  	            	   return ;
	                 }
	                 }
	                 
	                 if(name.contentEquals("category")) {
	                	 if(!fi.getString().isEmpty() && !fi.getString().contentEquals("select")) {
	                		 category=fi.getString();
	                	 }
	                	 else {
	                		 out.print("No category chosen");
	  	            	   out.print("<br><a href=\"upload\">Back</>");
	  	            	   return ;
	                	 }
	                 }
	  	            }
	            if ( !fi.isFormField () ) {
	               // Get the uploaded file parameters
	               String fieldName = fi.getFieldName();
	                fileName = fi.getName();
	               contentType = fi.getContentType();
	               boolean isInMemory = fi.isInMemory();
	               long sizeInBytes = fi.getSize();
	               // get user from session
	               HttpSession session=request.getSession(false);
	               if(session!=null) {
	            	   if(session.getAttribute("user")!=null)
	               email=session.getAttribute("user").toString();
	            	   else
		            	   request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").forward(request, response);
	               }
	               else
	            	   request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").forward(request, response);
	                //instantiate user and product
	               user=ud.getUser(email);
	               // Writing process begins
	               thumbPath=filePath.concat("\\"+user.getUserId()+"\\content\\thumb\\"+"\\");
	               filePath=filePath.concat("\\"+user.getUserId()+"\\content\\original\\"+"\\"); 
	                pathMaker=new File(filePath);
	               pathMaker.mkdirs();
	               pathMaker=new File(thumbPath);
	               pathMaker.mkdirs();
	             if( fileName.lastIndexOf("\\") >= 0 ) {
	                  file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
	                  thumbFile=new File(thumbPath+fileName.substring(fileName.lastIndexOf("\\")));
	               } else {
	                  file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	                  thumbFile=new File(thumbPath+fileName.substring(fileName.lastIndexOf("\\")+1));
	               }
	             if(fileName!="" && fileName!=null) {
	            	 //write file to disk  
	               fi.write( file ) ;
	               Thread thumbCreator=new Thread(new ThumbWriter(thumbFile.getCanonicalPath(),file.getCanonicalPath()));
	               thumbCreator.start();
	    	             }
	               else {
	            	   out.print("No file chosen");
	            	   out.print("<br><a href=\"upload\">Back</>");
	            	   return ;
	            	   }
	            }
	         }
				//make entry of photo in the database
	               filePath=file.getCanonicalPath();
	               thumbPath=thumbFile.getCanonicalPath();
	               product.setContent(filePath);
	               product.setName(fileName.substring(0,fileName.indexOf(".")));
	               product.setUserId(user.getUserId());
	               product.setProductType(contentType.substring(contentType.lastIndexOf("/")+1));
	              product.setPrice(price);
	              product.setThumb(thumbPath);
	              product.setCategory(category);
	               pd.insert(product);
	               out.println("Upload Successful!<br><a href=\"upload\">Back</a> <a href=\"welcome\">Go to Hoome</a>");
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
}//class
