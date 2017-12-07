
/**    
* @Title: DiscussVo.java
* @Package com.yz.center.model.vo
* Description: TODO
* @author: 
* @date: 2016年12月20日 上午10:44:21 
* @version V1.0 
*   
*/  

package com.yz.center.model.vo;

import java.util.Date;
import java.util.List;

import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.discuss.DiscussPo;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月20日 上午10:44:21 
* @version V1.0   
*/
@Data
public class DiscussVo {
	private Integer themeId;
	private String title;
	private Integer userId;
	private String userName;
	private OpenCoursePo openCoursePo;
	private Date createDate;
	private Integer answerCount;
	private List<DiscussPo> discussPos;
	private Integer isTop;
	private String maxUrl;//课程图片
}
