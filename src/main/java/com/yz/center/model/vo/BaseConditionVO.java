/**
  * @FileName: Ba.java
  * @Author 
  * @Description:
  * @Date 2016年5月26日 上午9:37:16
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class BaseConditionVO implements Serializable{
    /**
	 * @Description
	 * @author
	 * @Title
	 * @param
	 * @return
	 */
	private static final long serialVersionUID = 1L;
	public final static int PAGE_SHOW_COUNT = 5;
    private int pageNum = 1;
    private int pageSize = 5;
    private int totalCount ;
    private int pageCount;
    @SuppressWarnings("unused")
	private int startIndex;
    @SuppressWarnings("unused")
	private int endIndex;
    private String orderField;
    private String orderDirection;
    private String keywords;
    private Integer enabled;
    private String type;
    private Date startDate;
    private Date endDate;
    private Integer schoolId;
    private Integer userId;
    private Integer id;
    public String getType() {
        return "".equals(type) ? null : type;
    }
    public void setType(String type) {
        this.type = type;
    }
  
    public Date getStartDate() {
        return startDate;
    }
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    public Date getEndDate() {
        return endDate;
    }
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    public int getPageNum() {
        return pageNum;
    }
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }
    public int getPageSize() {
        return pageSize > 0 ? pageSize : PAGE_SHOW_COUNT;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public String getOrderField() {
        return orderField;
    }
    public void setOrderField(String orderField) {
        this.orderField = orderField;
    }
    public String getOrderDirection() {
        return "desc".equals(orderDirection) ? "desc" : "asc";
    }
    public void setOrderDirection(String orderDirection) {
        this.orderDirection = orderDirection;
    }
    
    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
    
    public String getKeywords() {
        return "".equals(keywords)? null : keywords;
    }
    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }
    public void setStartIndex(int startIndex){
        this.startIndex = startIndex;
    }
    public int getStartIndex() {
        int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
        return pageNum * this.getPageSize();
    }
    public void setEndIndex(int endIndex){
        this.endIndex = endIndex;
    }
    public int getEndIndex(){
    	return this.getStartIndex()+this.getPageSize();
    }
    public Integer getEnabled(){
        return "".equals(enabled) ? null : enabled;
    }
    public void setEnabled(Integer enabled){
        this.enabled = enabled;
    }
    public Integer getSchoolId(){
        return "".equals(schoolId) ? null :schoolId;
    }
    public void setSchoolId(Integer schoolId){
        this.schoolId = schoolId;
    }
    public int getPageCount(){
        int pageCount1 = this.getTotalCount()/this.getPageSize();
        int pageCount2 = this.getTotalCount()%this.getPageSize();
        int pageCount3 = this.getTotalCount() == 0 ? this.pageCount :(this.getTotalCount() <= this.getPageSize() ? 1 : (pageCount2==0?pageCount1:pageCount1+1));
        return pageCount3;
    }
    public void setPageCount(int pageCount){
        this.pageCount = pageCount;
    }
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	
	public BaseConditionVO(Integer pageNum, String keywords) {
		super();
        if(pageNum !=null&&!pageNum.equals("")){
        	this.setPageNum(pageNum);
        }else {
        	this.setPageNum(1);
		}
		this.pageNum = pageNum;
		this.keywords = keywords;
	}
    
	public BaseConditionVO(){}
	
	/** 
	* Title:BaseConditionVO.java 
	* Description: 
	* @author: 
	* @date: 2016年12月28日 下午2:55:18 
	*/  
	
	public BaseConditionVO(BaseConditionVO baseConditionVO) {
		this.setPageNum(baseConditionVO.getPageNum());
		this.setSchoolId(baseConditionVO.getSchoolId());
		this.setKeywords(baseConditionVO.getKeywords());
	}
}
