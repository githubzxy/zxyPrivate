package com.yz.center.model.po.course;

import java.util.Date;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月29日 上午9:40:45 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class StudentCoursePo {
	private Integer id;
	private Integer openId;
	private Integer studentId;
	private Integer studyStatus;
	private float score;
	private Date createDate;
	private Integer state;
}