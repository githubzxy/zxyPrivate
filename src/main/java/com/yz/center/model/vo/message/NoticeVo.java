package com.yz.center.model.vo.message;

import java.io.Serializable;
import java.util.Date;

import com.yz.center.model.po.user.UserPo;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月15日 下午4:42:25 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class NoticeVo  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer noticeId;
	private String title;
	private String content;
	private Integer clickNum;
	private UserPo user;
	private Date createDate;
	private Integer sort;
	private Integer isDelete;
}