package com.yz.center.model.vo.course;

import java.util.List;

import com.yz.center.model.po.course.CoursePo;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月18日 上午11:21:02 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class CourseInfoVo {
	private Integer courseTypeId;
	private String courseTypeName;
	private List<CoursePo> coursePos;
}
