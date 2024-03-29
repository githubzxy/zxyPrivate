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

import com.yz.center.model.vo.ClassForm;


public class ReadExcelClass {
	 public static List<ClassForm> readXls(String excelPath) throws IOException {
	        InputStream is = new FileInputStream(excelPath);
	         XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
	         ClassForm classForm = null;
	        List<ClassForm> list = new ArrayList<ClassForm>();
	        // 循环工作表Sheet
	       for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
	             XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
	             if (xssfSheet == null) {
	                 continue;
	            }
	             // 循环行Row
	              for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
	            	
	                  XSSFRow xssfRow = xssfSheet.getRow(rowNum);
	                  if (xssfRow!= null) {
	                	  classForm = new ClassForm();
	                     XSSFCell gradeName = xssfRow.getCell(0);
	                     XSSFCell name= xssfRow.getCell(1);
	                     XSSFCell info= xssfRow.getCell(2);
	                      classForm.setGradeName(getValue(gradeName));;
	                      classForm.setName(getValue(name));
	                      classForm.setInfo(getValue(info));
	                    
	                   if(classForm!=null){
	                     list.add(classForm);
	                     
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
