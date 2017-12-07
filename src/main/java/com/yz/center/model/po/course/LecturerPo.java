package com.yz.center.model.po.course;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
@Data
public class LecturerPo implements Serializable {
	 
    private static final long serialVersionUID = 1L;
	private Integer lecturerId;
	private Integer schoolId;
	private String  schoolName;
	private String position;
	private String name;
	private Integer gender;
	private String birthday;
	private Date birthday2;//用于回显
	private String avatar;
	private String phone;
	private String info;
	private String email;
	private Date createDate;
	private Integer state;
}
