package serveimage;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductBean;
import dao.DaoFactory;
import dao.ProductDao;


public class ThumbServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
@Override
protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	try {
	int prodId=Integer.parseInt(request.getParameter("product"));
	//get product path from database
	ProductDao pd=DaoFactory.getInstanceProductDao();
	ProductBean product=pd.getProductByProdId(prodId);
	String productPath=product.getThumb();
	//get image on disk
	File img=new File(productPath);
	FileInputStream fis=new FileInputStream(img);
	//write to output
	ServletOutputStream out=response.getOutputStream();
	byte[] outByte=new byte[(int)img.length()];
	while(fis.read(outByte,0,(int)img.length())!=-1) {
		out.write(outByte,0,(int)img.length());
	}
	fis.close();
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	}//doGet
}//class
