
/**    
* @Title: HomeWorkForm.java
* @Package com.yz.center.model.form
* Description: TODO
* @author: 
* @date: 2016年12月16日 下午3:19:54 
* @version V1.0 
*   
*/  

package com.yz.center.model.form;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.yz.center.model.po.course.LecturerPo;
import com.yz.center.model.po.resource.FileType;
import com.yz.center.model.po.school.SchoolPo;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月16日 下午3:19:54 
* @version V1.0   
*/
@Data
public class HomeWorkForm implements Serializable {
    private static final long serialVersionUID = 1L;//@Fields serialVersionUID : 
	private Integer studentId;
	private Integer openCourseId;
    private Date finishDate;
    private String courseName;
    private String lecturerName;//讲师名
    private Integer taskCount;//作业数
    private Integer finishCount;//作业完成数
    private String maxUrl;//最大图片
    

}
