package com.yz.center.model.po.test;

import java.util.Date;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月4日 下午5:11:39 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class SubjectTypePo {
	
	private int subjectTypeId;
	private String typeName;
	private Date  createDate;
	private Date  stateDate;
	private int state;
}