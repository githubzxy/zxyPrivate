package com.yz.center.model.po.school;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
@Data
public class SchoolPo implements Serializable {
	    private static final long serialVersionUID = 1L;
		private Integer schoolId;
		private Integer cityId;
		private Integer state;
		private Integer isUsed;
		private String schoolName;
		private String info;
		private String logo;
		private String contacts;
		private String tel;
		private String website;//官网地址
		private String url;//平台访问地址
		private Date createDate;
		private Date startDate;
		private Date finishDate;
		private String startDateForm;
		private String finishDateForm;
}