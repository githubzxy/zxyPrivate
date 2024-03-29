package com.yz.center.util.test;
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
public class ReadSubjectExcel {
	 public static List<TestVo> readXls(String excelPath) throws IOException {
		        InputStream is = new FileInputStream(excelPath);
		        Workbook xssfWorkbook = null;
		        if (excelPath.endsWith("xlsx")){
		        	
		        	            //2007
		        	
		        	            xssfWorkbook = new XSSFWorkbook(is);
		        	
		        	        }else if (excelPath.endsWith("xls")){
		        	
		        	            //2003
		        	
		        	             xssfWorkbook = new HSSFWorkbook(is);
		        	
		        	        }

		
		         TestVo testVo = null;
		        List<TestVo> list = new ArrayList<TestVo>();
		        // 循环工作表Sheet
		       for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
		             /*XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);*/
		             Sheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
		             if (xssfSheet == null) {
		                 continue;
		            }
		             // 循环行Row
		              for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
		                  Row xssfRow = xssfSheet.getRow(rowNum);
		           
		                  if (xssfRow!= null) {
		                	 testVo = new TestVo();
		                     Cell title = xssfRow.getCell(0);		                 
		                     Cell subjectTypeId= xssfRow.getCell(1);
		                     Cell optionA= xssfRow.getCell(2);
		                     Cell optionB= xssfRow.getCell(3);
		                     Cell optionC=xssfRow.getCell(4);
		                     Cell optionD=xssfRow.getCell(5);
		                     Cell trueOption=xssfRow.getCell(6);
		                     Cell functionId=xssfRow.getCell(7);
		                      testVo.setTitle(getValue(title));
		                      testVo.setSubjectTypeId(Integer.parseInt(getValue(subjectTypeId)));
		                      testVo.setOptionA(getValue(optionA));
		                      testVo.setOptionB(getValue(optionB));
		                      testVo.setOptionC(getValue(optionC));
		                      testVo.setOptionD(getValue(optionD));
		                      testVo.setTrueOption(getValue(trueOption));
		                      testVo.setFunctionId(Integer.parseInt(getValue(functionId)));
		                   if(testVo!=null){
		                     list.add(testVo);
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
