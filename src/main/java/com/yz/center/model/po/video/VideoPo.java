package com.yz.center.model.po.video;

import java.util.Date;

import com.yz.center.model.po.course.CourseChapterPo;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月4日 下午5:30:40 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class VideoPo {
	private int videoId;
	private int chapterId;
	private int courseId;
	private int schoolId;
	private int userId;
	private String name;
	private String url;
	private String info;
	private Integer sort;
	private int videoSize;
	private Integer second;
	private String videoSuffix;
	private Date stateDate;
	private Date createDate;
	private int state;
	private int isshow ;
	private String courseName;//开课课程名
	private Integer watchNumber;//观看人数
	private Integer isover;
}
