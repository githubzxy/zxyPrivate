package com.yz.center.model.po.test;

import java.util.Date;

import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.po.video.VideoPo;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月4日 下午4:12:32 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class TestPo {
	
	private CoursePo coursePo;
	private int subjectId;
	private String title;
	private SubjectTypePo subjectTypePo;

	private String optionsA;
	private String optionsB;
	private String optionsC;
	private String optionsD;
	private String trueOption;
	private int schoolId;
	private VideoPo video;
	private FunctionPo functionPo;
	private UserPo userPo ;
	private Date createDate;
	private Date stateDate;
	private int state;
}
