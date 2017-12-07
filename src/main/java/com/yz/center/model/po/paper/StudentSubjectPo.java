
/**    
* @Title: StudentSubjectPo.java
* @Package com.yz.center.model.po.paper
* @Description: TODO
* @author: 
* @date: 2016年12月21日 上午10:31:20 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.po.paper;
import java.io.Serializable;
import lombok.Data;

/**  
* @Description: TODO
* @author: 
* @date: 2016年12月21日 上午10:31:20 
* @version V1.0   
*/
@Data
public class StudentSubjectPo implements Serializable{
 //@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;
    private Integer studentId;
    private Integer studentSubjectId; //
    private Integer subjectTypeId; //题目类别id
    private Integer studentPaperId; //试卷id
    private Integer subjectNum; //
    private Float totalScore; //
    private String anySubjectScore; //
    private String subjectIds; //
    private String trueAnswers; //
    private String stuAnswers; //
    private Float stuScore; //
    private Float type1Score;//subjectTypeId=1每道题目的分数
    private Float type2Score;//subjectTypeId=2每道题目的分数
    private Float type3Score;//subjectTypeId=3每道题目的分数
    private Integer ct1; //
    private Integer ct2; //
    private Integer ct3; //
    private Integer openId; //开课Id
    private Integer flag;//判断是考试还是作业（1/0）

}
