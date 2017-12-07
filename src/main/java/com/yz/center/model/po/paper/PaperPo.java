package com.yz.center.model.po.paper;
import java.util.Date;

import com.yz.center.model.po.teacher.TeacherPo;
import com.yz.center.model.po.user.UserPo;

import lombok.Data;
@Data
public class PaperPo {
    private Integer paperId;
    private Integer videoId;
    private Integer isSubmit;//提交状态
    private Integer schoolId;
    private Integer openId;
    private Integer teacherId;
    private Integer functionId;
    private Integer subjectNum;
    private String title;
    private String name;//创建试卷老师的名字
    private Integer sort;
    private String anySubjectScore;
    private Integer totalScore;
    private String subjectIds;
    private Date creDt;
    private Date staDt;
    private Integer state;
    private Integer showSecond;
    private TeacherPo teacherPo;
    private UserPo userPo;
    private Integer studentPaperId;
	
}

