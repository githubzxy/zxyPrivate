package com.yz.center.util.ftp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.SocketException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

import com.yz.center.util.PropertiesLoader;


public class FtpTools {

	private static FtpConfig ftpConfig;

	static {
		ftpConfig = new FtpConfig();
		PropertiesLoader pl = new PropertiesLoader("/ftp/ftpconfig.properties");
		try {
			BeanUtils.copyProperties(ftpConfig, pl.getProperties());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	public static boolean uploadPicToFtp(String path, InputStream fileStream,
			String fileName) {
		if (StringUtils.isEmpty(path)) {
			return false;
		}
		boolean flag = false;
		FtpUtil ftpUtil = new FtpUtil();
		try {
			ftpUtil.connectServer(ftpConfig);

			ftpUtil.setFileType(FtpUtil.BINARY_FILE_TYPE);
			ftpUtil.setBufferSize(1024 * 1024);
			String[] str = StringUtils.split(path, "/");
			String tmpPath = "";
			for(String s: str){
				tmpPath+="/";
				if(!ftpUtil.existDirectory(tmpPath,s)){
					if(!ftpUtil.createDirectory(s))
					   throw new RuntimeException("创建目录失败！");
				}
				tmpPath+=s;
				ftpUtil.changeDirectory(tmpPath);
			}
			ftpUtil.changeDirectory(path);
			flag = ftpUtil.uploadFile(fileStream, fileName);
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ftpUtil.closeServer();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	public static InputStream downloadPicToFtp(String sourceFileName) {
		FtpUtil ftpUtil = new FtpUtil();
		try {
			ftpUtil.connectServer(ftpConfig);
			ftpUtil.setFileType(FtpUtil.BINARY_FILE_TYPE);
			ftpUtil.setBufferSize(1024 * 1024);
			return ftpUtil.downFile(sourceFileName);

		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static boolean deleteToFtp(String url) {
		System.out.println("删除:"+url);
		if (StringUtils.isEmpty(url)) {
			return false;
		}
		boolean flag = false;
		FtpUtil ftpUtil = new FtpUtil();
		try {
			ftpUtil.connectServer(ftpConfig);
			ftpUtil.setFileType(FtpUtil.BINARY_FILE_TYPE);
			// ftpUtil.changeDirectory(path);
			flag = ftpUtil.deleteFile(url);
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ftpUtil.closeServer();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	public static long getFileSize(String filename){
		if (StringUtils.isEmpty(filename)) {
			return -1;
		}
		FtpUtil ftpUtil = new FtpUtil();
		long size = -1;
		try {
			ftpUtil.connectServer(ftpConfig);
			ftpUtil.setFileType(FtpUtil.BINARY_FILE_TYPE);
			size = ftpUtil.getFileSize(filename);
			
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return size;
	}
	/*
	 * public static void main (String []args) throws FileNotFoundException{
	 * boolean flag=uploadPicToFtp("/upload/user/2013/07/24/", new
	 * BufferedInputStream(new FileInputStream(new
	 * File("C:/Users/yk/Desktop/Koala.jpg"))), "xxx1.jpg" ); //
	 * System.out.println(flag); }
	 */
	  public static HttpServletResponse downloadZip(File file, HttpServletResponse response) {
		    try {
		      // 以流的形式下载文件。
		      InputStream fis = new BufferedInputStream(new FileInputStream(file.getPath()));
		      byte[] buffer = new byte[fis.available()];
		      fis.read(buffer);
		      fis.close();
		      // 清空response
		      response.reset();
		      OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
		      response.setContentType("application/octet-stream");

		      // 如果输出的是中文名的文件，在此处就要用URLEncoder.encode方法进行处理
		      response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(file.getName(), "UTF-8"));
		      toClient.write(buffer);
		      toClient.flush();
		      toClient.close();
		    } catch (IOException ex) {
		      ex.printStackTrace();
		    } finally {
		      try {
		        File f = new File(file.getPath());
		        f.delete();
		      } catch (Exception e) {
		        e.printStackTrace();
		      }
		    }
		    return response;

		  }
}
