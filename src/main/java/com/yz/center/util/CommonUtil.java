package com.yz.center.util;

import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yz.center.model.form.FileForm;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.util.ftp.FtpTools;

public class CommonUtil {
	    
	    public static final int FLAG_SUCESS = 1;
	    public static final int FLAG_FAILD = 0; 
	    public static FileForm add(CommonsMultipartFile uploadItem, String url, HttpServletRequest request,int type) throws Exception{
	    	SchoolPo school = (SchoolPo)request.getSession().getAttribute(Static.SCHOOL_SESSION);
	    	Integer schoolId=school.getSchoolId();
            FileForm attachment = new FileForm();
            String originalFilename = uploadItem.getOriginalFilename();
            System.out.println("初始名："+originalFilename+"url:"+url);
            String md5str = getMd5ByFile(uploadItem);
            String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
            //SimpleDateFormat format = new SimpleDateFormat("/yyyyMM/yyyyMMdd");
            //String attachPath = format.format(new Date());
            // attachPath = LocalDateTime.now().format(DateTimeFormatter.ofPattern("/yyyyMM/yyyyMMdd"));
            String realPath = request.getSession().getServletContext().getRealPath("") +"\\"+ url;
            String fileName = md5str+System.currentTimeMillis();
            // ****上传文件****
            // 上传路径://真实路径/文件上传路径/日期/时间.后缀
            // String targetPathNameWithoutSuffix = realPath;
            // 写入文件
            FileUtils.copyInputStreamToFile(uploadItem.getInputStream(), new File(realPath, fileName+"."+suffix));
            if(type == 1){
                //压缩图片
                File file = new File(realPath, fileName+"."+suffix);
                File min = createThumbPic(file,realPath,"_min.");
                File max = createThumbPic(file,realPath,"_middle.");
              //上传至FTP
                if("1".equals(BaseUtil.getValueFormProperties(Static.FTP_AVAILABLE))){
                    boolean flag = FtpTools.uploadPicToFtp(url, new FileInputStream(min),fileName+"_min."+suffix);
                    flag = FtpTools.uploadPicToFtp(url, new FileInputStream(max),fileName+"_middle."+suffix);
                    attachment.setMinUrl(url+"/"+fileName+"_min."+suffix);
                    attachment.setMiddleUrl(url+"/"+fileName+"_middle."+suffix);
                }
            }
            attachment.setName(originalFilename);
            attachment.setFileSize(Long.valueOf(uploadItem.getSize()));
            attachment.setUrl(url +"/"+fileName+"."+suffix);
            attachment.setFileSuffix(suffix);
            attachment.setFileType(1);
            attachment.setCreateDate(new Date());
            attachment.setSchoolId(schoolId);
            
            //上传至FTP
            if("1".equals(BaseUtil.getValueFormProperties(Static.FTP_AVAILABLE))){
                boolean flag=FtpTools.uploadPicToFtp(url, uploadItem.getInputStream(),fileName+"."+suffix);
            }
            System.out.println(attachment.getUrl());
            //相对路径
            
            String absolutePath=fileName+"."+suffix;
           /* System.out.println(absolutePath);*/
            attachment.setAbsolutePath(absolutePath);
            //删除本地文件
            File localfile = new File(realPath, fileName+"."+suffix);
            if(localfile.exists()){
            	localfile.delete();
            }
            // ****保存数据****
            return attachment;
        }
	    
        
        public static String getMd5ByFile(CommonsMultipartFile uploadItem) throws Exception{
            byte[] uploadBytes = uploadItem.getBytes();
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] digest = md5.digest(uploadBytes);
            String hashString = new BigInteger(1, digest).toString(16);
            return hashString.toUpperCase();
        }
        
        /**
        * 压缩图片 文件名为原图名_min,_middle
        * 
        * @param fileName
        * @return
        * @throws IOException
        */
        @Deprecated
        public static File createThumbPic(File file,String realPath,String imageType) throws IOException {

	        String path = realPath + "/" + file.getName().replace(".", imageType);
	        String fileName = file.getName();
	        File fo = new File(path); // 将要转换出的小图文件
	        int nw = 0;
	        if(imageType.equals("_min.")){
	            nw = Static.MIN_WIDTH;
	        }else{
	            nw = Static.MIDDLE_WIDTH;
	        }
	        AffineTransform transform = new AffineTransform();
	        BufferedImage buffer = ImageIO.read(file); // 读取图片
	        int width = buffer.getWidth();
	        int height = buffer.getHeight();
	        int nh = (nw * height) / width;
	        double sx = (double)nw / width;
	        double sy = (double)nh / height;
	        transform.setToScale(sx, sy);
	        AffineTransformOp ato = new AffineTransformOp(transform, null);
	        BufferedImage bid = new BufferedImage(nw, nh, BufferedImage.TYPE_3BYTE_BGR);
	        ato.filter(buffer, bid);
	        String type = fileName.substring(fileName.indexOf('.') + 1, fileName.length());
	        ImageIO.write(bid, type, fo);
	        return fo;
        }
        
         
        /**   
        * @Title: createThumbPic
        * @Description: TODO  
        * @param file
        * @param realPath
        * @param imageType  1:中图，2：小图
        * @param width
        * @param height
        * @return
        * @throws IOException
        * @author:
        */
        public static String createThumbPic(File file,String localPath,int imageType, int w, int h) throws IOException {
        	String path = "";
        	if(imageType == 2){
        		path = localPath.substring(0, localPath.lastIndexOf("."))+"_min_"+localPath.substring(localPath.lastIndexOf("."));
        	}else if(imageType == 1){
        		path = localPath.substring(0, localPath.lastIndexOf("."))+"_middle_"+localPath.substring(localPath.lastIndexOf("."));
        	}
 	        String fileName = file.getName();
 	        File fo = new File(path); // 将要转换出的小图文件
 	        AffineTransform transform = new AffineTransform();
 	        BufferedImage buffer = ImageIO.read(file); // 读取图片
 	        int width = buffer.getWidth();
 	        int height = buffer.getHeight();
 	        //int nh = (nw * height) / width;
 	        double sx = (double)w / width;
 	        double sy = (double)h / height;
 	        transform.setToScale(sx, sy);
 	        AffineTransformOp ato = new AffineTransformOp(transform, null);
 	        BufferedImage bid = new BufferedImage(w, h, BufferedImage.TYPE_3BYTE_BGR);
 	        ato.filter(buffer, bid);
 	        String type = fileName.substring(fileName.indexOf('.') + 1, fileName.length());
 	        ImageIO.write(bid, type, fo);
 	        return path;
         }
        
        
        public static String uploadSchooolLogo(CommonsMultipartFile file){
        	if(file.isEmpty() || file == null){
        		return null;
        	}
        	String originalFilename = file.getOriginalFilename();
        	String realPath = "";
            try {
				String md5str = getMd5ByFile(file);
				String dirStr = BaseUtil.getValueFormProperties("uploadPath")+"/logo";
				File dir = new File(dirStr);
				if(!dir.exists()&&!dir.isDirectory()){
					dir.mkdir();
				}
				realPath = dirStr +"/"+ md5str+originalFilename.substring(originalFilename.indexOf("."));
				File newFile = new File(realPath);
				file.transferTo(newFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
            return realPath;
        }
        
        
        public static String uploadImg(CommonsMultipartFile file,String url, HttpServletRequest request){
        	if(file == null || file.isEmpty()){
        		return null;
        	}
        	String originalFilename = file.getOriginalFilename();
        	String realPath = "";
            try {
				String md5str = getMd5ByFile(file);
				String localStr = request.getSession().getServletContext().getRealPath("")+url;
				File dir = new File(localStr);
				if(!dir.exists()&&!dir.isDirectory()){
					dir.mkdir();
				}
				String localPath = localStr +"/"+ md5str+originalFilename.substring(originalFilename.indexOf("."));
				File localFile = new File(localPath);
				FileUtils.copyInputStreamToFile(file.getInputStream(), localFile);
				//file.transferTo(localFile);  //生成本地文件
				
				int w = Integer.parseInt(BaseUtil.getValueFormProperties("typeWidth"));
				int h = Integer.parseInt(BaseUtil.getValueFormProperties("typeHeight"));
				String newLocalUrl = createThumbPic(localFile,localPath,1,w,h);
				SimpleDateFormat format = new SimpleDateFormat("/yyyyMM/yyyyMMdd");
				String attachPath = format.format(new Date());
				realPath = url+attachPath +newLocalUrl.substring(newLocalUrl.lastIndexOf("/"));
				File newLocalFile = new File(newLocalUrl);  
				FileInputStream fis = new FileInputStream(newLocalFile);
				FtpTools.uploadPicToFtp(url+attachPath, fis, newLocalUrl.substring(newLocalUrl.lastIndexOf("/")+1));
				//relativeUrl = url+attachPath +realPath.substring(realPath.lastIndexOf("/"));
				localFile.delete();
				fis.close();
				newLocalFile.delete();
		        
			} catch (Exception e) {
				e.printStackTrace();
			}
            return realPath;
        }
}
