
package com.yz.center.util;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.yz.center.model.form.TeacherForm;


/**  
* @Description: 解析excel 表格文件
* @author: 
* @date: 2017年1月8日 下午4:37:21 
* @version V1.0   
*/
public class ReadExcelOfTeacher {
	
	/**   
	 * 解析excel 表格文件
	* @Title: readXls
	* @Description: 解析excel 表格文件
	* @param excelPath excel文件路径
	* @return 教师信息集合
	* @throws IOException 异常
	* @author:
	*/
	public static List<TeacherForm> readXls(String excelPath) throws IOException {
		InputStream is = new FileInputStream(excelPath);
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
		TeacherForm teacherForm = null;
		List<TeacherForm> list = new ArrayList<TeacherForm>();
		// 循环工作表Sheet
		for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
			XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
			if (xssfSheet == null) {
				continue;
			}
			// 循环行Row
			for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
				XSSFRow xssfRow = xssfSheet.getRow(rowNum);
				if (xssfRow != null) {
					teacherForm = new TeacherForm();
					XSSFCell name = xssfRow.getCell(0);
					XSSFCell gender = xssfRow.getCell(1);
					XSSFCell number = xssfRow.getCell(2);
					XSSFCell loginPwd = xssfRow.getCell(3);
					XSSFCell mobile = xssfRow.getCell(4);
					XSSFCell email = xssfRow.getCell(5);
					XSSFCell idCard = xssfRow.getCell(6);
					XSSFCell department = xssfRow.getCell(7);
					XSSFCell position = xssfRow.getCell(8);
					if (getValue(gender).equals("女")) {
						teacherForm.setGender(0);
					} else if (getValue(gender).equals("男")) {
						teacherForm.setGender(1);
					} else {
						teacherForm.setGender(null);
					}
					teacherForm.setName(getValue(name));
					teacherForm.setNumber(getValue(number));
					teacherForm.setLoginPwd(getValue(loginPwd));
					teacherForm.setMobile(getValue(mobile));
					teacherForm.setEmail(getValue(email));
					teacherForm.setIdCard(getValue(idCard));
					teacherForm.setDepartment(getValue(department));
					teacherForm.setPosition(getValue(position));
					teacherForm.setCreateDate(new Date());
					teacherForm.setRoleCode("teacher");

					list.add(teacherForm);
				}
			}
		}
		return list;
	}

	@SuppressWarnings("static-access")
	private static String getValue(XSSFCell xssfCell) {
		if (xssfCell == null) {
			return null;
		} else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_BOOLEAN) {
			// 返回布尔类型的值
			return String.valueOf(xssfCell.getBooleanCellValue());
		} else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC) {
			DecimalFormat df = new DecimalFormat("0");
			String whatYourWant = df.format(xssfCell.getNumericCellValue());
			// 返回数值类型的值
			return String.valueOf(whatYourWant);
		} else {
			// 返回字符串类型的值
			return String.valueOf(xssfCell.getStringCellValue());
		}
	}
}
