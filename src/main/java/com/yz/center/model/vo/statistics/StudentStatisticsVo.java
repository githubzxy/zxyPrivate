
/**    
* @Title: StudentStatistics.java
* @Package com.yz.center.model.vo.statistics
* Description: TODO
* @author: 
* @date: 2017年1月4日 下午5:24:22 
* @version V1.0 
*   
*/  

package com.yz.center.model.vo.statistics;



import java.util.Date;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月4日 下午5:24:22 
* @version V1.0   
*/
@Data
public class StudentStatisticsVo {
private String number;
private String name;
private Date startDt;
private Date lastDt;

}
