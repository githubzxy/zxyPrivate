
/**    
* @Title: PaperVo.java
* @Package com.yz.center.model.vo.paper
* Description: TODO
* @author: 
* @date: 2017年1月12日 下午4:01:59 
* @version V1.0 
*   
*/  

package com.yz.center.model.vo.paper;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月12日 下午4:01:59 
* @version V1.0   
*/
@Data
public class PaperVo {
   private Integer paperId;
   private String  title;
   private String  courseName;
   private String  videoName;
   private Integer subjectNum;
   private Integer totalScore;
   private String  teacherName;
}
