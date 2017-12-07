package com.yz.center.model.vo.frontPage;

import lombok.Data;

@Data
public class VideoPlayVo {
	private Integer courseId;
	private Integer openId;
	private Integer chapterId;
	private Integer videoId;
	private String courseName;
	private String chapterName;
	private String name;
	private String videoUrl;
	private Integer parentId;
    private String parentName;
	private Integer level; 
}
