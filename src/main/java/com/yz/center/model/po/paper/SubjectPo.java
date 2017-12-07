package com.yz.center.model.po.paper;

import java.io.Serializable;

import lombok.Data;

/**  
* @Description: TODO
* @author: 
* @date: 2016年12月19日 上午10:27:58 
* @version V1.0   
*/
@Data
public class SubjectPo implements Serializable{
    
    //@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;
    private Integer paperId; //试卷ID
    private Integer courseId; //课程ID
    private Integer schoolId; //学校ID
    private Integer videoId; //视频ID
    private Integer userId; //
    private Integer subjectId;
    private Integer functionId;
    private Integer state; //状态0 1
    private String title; //题目    
    private Integer subjectTypeId; //题目类型
    private String optionsA;  //选项A
    private String optionsB;  //选项B
    private String optionsC;  //选项C
    private String optionsD;  //选项D
    private String trueOption;  //正确答案
    private String typeName;
    private Integer ct1; //subjectTypeId为1的数量
    private Integer ct2; //subjectTypeId为2的数量
    private Integer ct3; //subjectTypeId为3的数量
    private String stuAnswer;
}
