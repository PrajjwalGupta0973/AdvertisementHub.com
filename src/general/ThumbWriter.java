package general;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class ThumbWriter implements Runnable {
	String thumbFile;
	String filePath;
	File pathMaker;
	public ThumbWriter(String thumbFile,String filePath ){
		// TODO Auto-generated constructor stub
		this.thumbFile=thumbFile;
		this.filePath=filePath;
	}
public void run() {
	try {
		BufferedImage temp=ImageIO.read(new File(filePath));
		int height=temp.getHeight();
		int width=temp.getWidth(); 
		BufferedImage img = new BufferedImage(1000, 1000*height/width, BufferedImage.TYPE_INT_RGB);
		img.createGraphics().drawImage(temp.getScaledInstance(1000, 1000*height/width, Image.SCALE_SMOOTH),0,0,null);
		ImageIO.write(img, "jpg", new File(thumbFile));
		}
	catch(Exception e) {
		e.printStackTrace();
	}
}
}
