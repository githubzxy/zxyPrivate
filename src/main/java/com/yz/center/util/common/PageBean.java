
/**    
* @Title: PageBean.java
* @Package com.yz.center.util.common
* Description: 分页条件类
* @author: lcy
* @date: 2016年12月16日 下午3:08:57 
* @version V1.0 
*   
*/  

package com.yz.center.util.common;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

/**  
* Description: 分页条件类
* @author lcy  
* @date: 2016年12月16日 下午3:08:57 
* @version V1.0   
*/
public class PageBean implements Serializable{
	
	private static final long serialVersionUID = -6273049520975192949L;
	
	private static final int DEFUALT_SIZE = 10;
	private Integer schoolId;                //学校ID
	private Integer userId;				     //用户ID
	private Integer courseId;				 //课程ID
	private Integer videoId;				//视频ID
	private Integer openId;                 //开课ID
	private Integer pageNum = 0;			//查询的当前页数
    private Integer pageSize = 10;			//查询每页条数
    private Integer totalPage;				//总条数
    private Integer totalCount;				//总页数
	private Integer startIndex;				//分页开始条数
    private String keyWords;				//查询关键字
    public Map<String,Object> params = new HashMap<String,Object>();      //查询条件参数
	private List<?> list;                   //从数据库里查询出的数据集合
	private Integer courseTypeId;//前台课程展示页面需要的courseTypeId条件
	
	public Integer getCourseTypeId() {
		return courseTypeId;
	}

	public void setCourseTypeId(Integer courseTypeId) {
		this.courseTypeId = courseTypeId;
	}

	public Integer getOpenId() {
		return openId;
	}

	public void setOpenId(Integer openId) {
		this.openId = openId;
	}

	public Integer getTotalCount() {
		return (totalPage < pageSize) ? 1 : (totalPage +pageSize - 1) / pageSize;//总页数
		//return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	
	public Integer getVideoId() {
		return videoId;
	}
	
	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	public Integer getPageNum() {
		return pageNum >  0 ?pageNum:1;
	}
	
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	
	public Integer getPageSize() {
		return pageSize > 0 ? pageSize : DEFUALT_SIZE;
	}
	
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	public Integer getTotalPage() {
		
		return totalPage;
	}
	
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	
	public Integer getStartIndex() {
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
        return pageNum * this.getPageSize();
	}
	
	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}
	
	public String getKeyWords() {
		return keyWords;
	}
	
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}
    
}
