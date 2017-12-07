package com.yz.center.model.vo.test;
import java.util.Date;

import lombok.Data;
/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月9日 上午9:41:20 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class TestVo {
	private Integer subjectId;
	private Integer courseId;
	private Integer videoId;
	private String title;
	private Integer subjectTypeId;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String trueOption;
	private Integer functionId;
	private Date createDate;
	private Date stateDate;
	private Integer schoolId;
	private Integer userId;
}
