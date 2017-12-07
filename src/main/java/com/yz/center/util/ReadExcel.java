package com.yz.center.util;
 import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.yz.center.model.vo.StudentForm;
public class ReadExcel {
	 public static List<StudentForm> readXls(String excelPath) throws IOException {
		        InputStream is = new FileInputStream(excelPath);
		         XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
		         StudentForm studentForm = null;
		        List<StudentForm> list = new ArrayList<StudentForm>();
		        // 循环工作表Sheet
		       for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
		             XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
		             if (xssfSheet == null) {
		                 continue;
		            }
		             // 循环行Row
		              for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
		            	System.out.println(xssfSheet.getLastRowNum());
		                  XSSFRow xssfRow = xssfSheet.getRow(rowNum);
		           
		                  if (xssfRow!= null) {
		                  studentForm = new StudentForm();
		                     XSSFCell name = xssfRow.getCell(0);
		                     XSSFCell gender= xssfRow.getCell(1);
		                     XSSFCell number= xssfRow.getCell(2);
		                     XSSFCell loginPwd= xssfRow.getCell(3);
		                     XSSFCell phone=xssfRow.getCell(4);
		                     XSSFCell email=xssfRow.getCell(5);
		                     XSSFCell idCard=xssfRow.getCell(6);
		                      studentForm.setName(getValue(name));
		                      if(getValue(gender)!=null){
		                      if(getValue(gender).equals("女")){
		                    	  studentForm.setGender(0);
		                      }else if(getValue(gender).equals("男")){
		                    	  studentForm.setGender(1);
		                      }else{
		                    	  studentForm.setGender(null);
		                      }
		                      }else{
		                    	 studentForm.setGender(null); 
		                      }
		                      
		                      studentForm.setNumber(getValue(number));
		                      studentForm.setLoginPwd(getValue(loginPwd));
		                      studentForm.setPhone(getValue(phone));
		                      studentForm.setEmail(getValue(email));
		                      studentForm.setIdCard(getValue(idCard));
		                   if(studentForm!=null){
		                     list.add(studentForm);
		                   }
		                  }
		              }
		         }
		          return list;
		     }
		
	       @SuppressWarnings("static-access")
	     private static String getValue(XSSFCell xssfCell) {
	    	   if(xssfCell==null){
	            	 return null;
	             }else if(xssfCell.getCellType() == xssfCell.CELL_TYPE_BLANK){
	            	 return null;
	             }
	    	   else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_BOOLEAN) {
	                 // 返回布尔类型的值
	                  return String.valueOf(xssfCell.getBooleanCellValue());
	            } else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC) {
	            	DecimalFormat df = new DecimalFormat("0");  
	            	String whatYourWant = df.format(xssfCell.getNumericCellValue()); 
	            	// 返回数值类型的值
	                return String.valueOf(whatYourWant);
	             } 
	            else {
	                 // 返回字符串类型的值
	                 return String.valueOf(xssfCell.getStringCellValue());
	           }
	         }
}
