/**
  * @FileName: UploadController.java
  * @Author 
  * @Description:
  * @Date 2016��10��24�� ����3:46:27
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yz.center.model.form.FileForm;
import com.yz.center.service.iface.resource.ResourceService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.ftp.FtpTools;

@Controller
@RequestMapping("upload")
public class UploadController{
	
	@Resource
	private ResourceService resourceService;
    /**
     * FTP下载
     */
    @RequestMapping(value = "/downFile", method = RequestMethod.GET)
    public String downloadFile(HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        String url = request.getParameter("fn");
        String filename = request.getParameter("fName");
         response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(filename, "utf-8"));  
         response.setContentType("application/x-download");//设置为下载application/x-download  
        
        InputStream inputStream = FtpTools.downloadPicToFtp(url);
        if (inputStream!=null) {
            FileCopyUtils.copy(inputStream, response.getOutputStream());
        }
        return null;
    }
    
    /**
     * FTP下载
     */
    @RequestMapping(value = "{type}/downFiles", method = RequestMethod.GET)
    public String downloadAllFile(HttpServletRequest request,@RequestParam("fileIds")String fileIds,
    		@PathVariable Integer type, HttpServletResponse response) throws IOException {
    	String[] strArr = fileIds.split(",");
    	Integer[] intArr = new Integer[strArr.length];
    	for(int i = 0; i < strArr.length; i++){
    		intArr[i] = Integer.parseInt(strArr[i]);
    	}
    	List<FileForm> files = null;
    	if(type == 1){ //公开资源
    		files = resourceService.getFilesByIds(intArr);	
    	}else{
    		files = resourceService.getCourseFilesByIds(intArr);
    	}
        String path = request.getSession().getServletContext().getRealPath("");
        File file = new File(path+"/资源.rar");
        if(!file.exists()){
        	file.createNewFile();
        }
        FileOutputStream fous = new FileOutputStream(file);
        ZipOutputStream zipOut = new ZipOutputStream(fous);
        for(FileForm fileForm : files){
        	ZipEntry entry = new ZipEntry(fileForm.getName());
        	zipOut.putNextEntry(entry);
        	InputStream inputStream = FtpTools.downloadPicToFtp(fileForm.getUrl());
        	int len = 0;
        	byte[] buf = new byte[1024];
        	while((len =inputStream.read(buf)) != -1){
        		zipOut.write(buf, 0, len);
        	}
        	inputStream.close();
        	/*response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileForm.getName(), "utf-8"));  
        	response.setContentType("application/x-download");//设置为下载application/x-download  
        	
        	OutputStream os = response.getOutputStream();
        	if (inputStream!=null) {
        		FileCopyUtils.copy(inputStream, os);
        		inputStream.close();
        	}*/
        }
        zipOut.close();
        fous.close();
        FtpTools.downloadZip(file, response);
        return null;
    }
    
    /**
     * 删除文件
     * @param session
     * @param request
     * @param response
     * @param fileName
     * @return
     * @throws IOException
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    public Map<String,Object> deleteVideo(HttpSession session, 
                            HttpServletRequest request, 
                                HttpServletResponse response,
                                String url) throws IOException {
        response.setContentType("application/json");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("success", false);
        map.put("error", "");
        boolean flag=false;
        try{
            FtpTools.deleteToFtp(url);
            map.put("success", true);
            map.put("error", "");
            flag = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        if(!flag){
            map.put("error", "未知错误");
        }
        return map; 
    }
    
    @RequestMapping(value="/uploadImg", produces="application/json;charset=UTF-8")
    @ResponseBody
    public ModelMap uploadImg(ModelMap map,
    		@RequestParam(value="file")CommonsMultipartFile file,
    		HttpServletRequest request,Integer type) throws Exception{
    	FileForm fileForm = new FileForm();
    	if(type == 1){
    		fileForm = CommonUtil.add(file, "logo", request, 2);
    	}else if(type == 2){
    		fileForm = CommonUtil.add(file, "avatar", request, 2);
    	}else if(type == 3){
    		fileForm = CommonUtil.add(file, "logo", request, 2);
    	}else if(type==4){
    		fileForm = CommonUtil.add(file, "banner", request, 2);
    	}
		map.addAttribute("url", fileForm.getUrl());
		System.out.println("controller   "+fileForm.getUrl());
		//String jsonStr = String.valueOf(JSONObject.fromObject(map));
		return map;
    }
}