package com.yz.center.util.course;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.yz.center.model.vo.test.TestVo;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月28日 下午3:46:58 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public  class readStudentExcel {
	
	public static List<Integer> readXls(String excelPath) throws IOException {
		
		 InputStream is = new FileInputStream(excelPath);
	        Workbook xssfWorkbook = null;
	        if (excelPath.endsWith("xlsx")){
	        	
	        	            //2007
	        	
	        	            xssfWorkbook = new XSSFWorkbook(is);
	        
	        	        }else if (excelPath.endsWith("xls")){
	        	
	        	            //2003
	        	
	        	             xssfWorkbook = new HSSFWorkbook(is);
	        
	        	        }
	     
	        List<Integer> list = new ArrayList<Integer>();
	     
	        for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
	             /*XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);*/
	             Sheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
	             if (xssfSheet == null) {
	                 continue;
	            }
	          
	             // 循环行Row
	              for (int rowNum = 1; rowNum <=xssfSheet.getLastRowNum(); rowNum++) {
	                  Row xssfRow = xssfSheet.getRow(rowNum);
	           
	                  if (xssfRow!= null) {

	                     Cell StudentNum1 = xssfRow.getCell(0);	
	                   
	                     String num=getValue(StudentNum1);
	                     if(num!=null&&num!=""){
	                     Integer StudentNum = Integer.parseInt(num);
	                  
	                   if(StudentNum!=null){
	                	   
	                	   list.add(StudentNum);
	                	
	                   }
	                     }
	                  }
	              }
	         }
		
		return list;
	}
	
	
	
	
	 @SuppressWarnings("static-access")
     private static String getValue(Cell title) {
    	   if(title==null){
            	 return null;
             }else if(title.getCellType() == title.CELL_TYPE_BLANK){
            	 return null;
             }
    	   else if (title.getCellType() == title.CELL_TYPE_BOOLEAN) {
                 // 返回布尔类型的值
                  return String.valueOf(title.getBooleanCellValue());
            } else if (title.getCellType() == title.CELL_TYPE_NUMERIC) {
            	DecimalFormat df = new DecimalFormat("0");  
            	String whatYourWant = df.format(title.getNumericCellValue()); 
            	// 返回数值类型的值
                return String.valueOf(whatYourWant);
             } 
            else {
                 // 返回字符串类型的值
                 return String.valueOf(title.getStringCellValue());
           }
         }
}
