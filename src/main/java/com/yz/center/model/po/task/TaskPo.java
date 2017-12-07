package com.yz.center.model.po.task;





import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class TaskPo implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer Id;
	private Integer useType;
	private Integer openCourseId;
	private Integer schoolId;
	private Integer videoId;
	private Integer isTimeLimit;
	private Integer limitTime;
	private Integer showTime;
	private Integer paperNum;//试卷套数
	private Integer createUserId;
	private String title;
	private String paperIds;
	private Date createDate;
}