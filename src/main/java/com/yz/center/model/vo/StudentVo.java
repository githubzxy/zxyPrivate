
/**    
* @Title: StudentVo.java
* @Package com.yz.center.model.vo
* @Description: 列表查询条件
* @author: lcy
* @date: 2016年12月21日 下午12:20:25 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.vo;

import lombok.Data;

/**  
* @Description: 列表查询条件
* @author: allen
* @date: 2016年12月21日 下午12:20:25 
* @version V1.0   
*/
@Data
public class StudentVo {
    private String name;       //姓名
    private String number;     //学号
    private Integer classId;   //班级ID
    private Integer gradeId;   //年级ID
}
