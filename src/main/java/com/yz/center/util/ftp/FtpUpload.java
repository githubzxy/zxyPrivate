package com.yz.center.util.ftp;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yz.center.util.BaseUtil;
import com.yz.center.util.Static;


public class FtpUpload {

	private static final Logger logger= LoggerFactory.getLogger(FtpUpload.class);
	
	public static boolean uploadToFtp(File file,String sRelativePath,String fileName){
		if("1".equals(BaseUtil.getValueFormProperties(Static.FTP_AVAILABLE))){
			if(file==null||!file.exists()||!file.isFile()||file.length()<=0)
				return false;
			BufferedInputStream bufferInputStream=null;
			boolean  flag=false;
			try {
				bufferInputStream =new BufferedInputStream(new FileInputStream(file));
				flag=FtpTools.uploadPicToFtp(sRelativePath, bufferInputStream, fileName);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				logger.error(e.getMessage());
			}finally{
				if(bufferInputStream!=null){
					try {
						bufferInputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
						logger.error(e.getMessage());
					}
					bufferInputStream=null;
				}
			}
			if(!flag){
				logger.error("upload picture to Ftp fail! RelativePath :: "+sRelativePath+Static.SLASH+fileName);
			}
			return flag;
		}else{
			return true;
		}
	}
	
	public static boolean uploadToFtp(InputStream inputStream,String sRelativePath,String fileName){
		if("1".equals(BaseUtil.getValueFormProperties(Static.FTP_AVAILABLE))){
			boolean  flag=FtpTools.uploadPicToFtp(sRelativePath, inputStream, fileName);
			if(!flag){
				logger.error("upload picture to Ftp fail! RelativePath :: "+sRelativePath+Static.SLASH+fileName);
			}
			return flag;
		}else{
			return true;
		}
	}
}
