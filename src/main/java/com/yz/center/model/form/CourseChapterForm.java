package com.yz.center.model.form;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月7日 上午11:10:47 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
import java.util.Date;

import lombok.Data;
@Data
public class CourseChapterForm {
	private Integer chapterId;
	private Integer courseId;
	private Integer parentId;
	private Integer videoId;
	private Integer videoIdBefore;//修改前的videoId
	private String fileIds;
	private String fileIds2;
	private String chapterName;
	private String chapterInfo;
	private Integer sort;
	private Integer level;
	private Date createDt;
	private Date stateDt;
	private Integer state;
}
