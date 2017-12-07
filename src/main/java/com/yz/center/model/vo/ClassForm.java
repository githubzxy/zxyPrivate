package com.yz.center.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ClassForm {
	private Integer schoolId;
	private Integer classId;
   private Integer gradeId;
   private Integer createUserId;
   private String name;
   private String info;
   private String gradeName;
   private Date createDate;
   private Date stateDate;
 
}
