
/**    
* @Title: PlayRecordPo.java
* @Package com.yz.center.model.po.student
* Description: TODO
* @author: 
* @date: 2016年12月16日 下午2:34:49 
* @version V1.0 
*   
*/  

package com.yz.center.model.po.student;

import java.util.Date;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月16日 下午2:34:49 
* @version V1.0   
*/
@Data
public class PlayRecordPo {
	private Integer recordId;
	private Integer videoId;
	private Integer selectId;
	private Integer studentId;
	private Integer second;
	private Integer isover;
	private Date startDate;
	private Date lastDate;
	private Integer state;
	private Integer sign;//标志，是某个视频结束后修改startDate，还是这个视频播放中不修改startDate

}
