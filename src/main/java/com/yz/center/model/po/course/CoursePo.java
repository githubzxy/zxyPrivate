package com.yz.center.model.po.course;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import com.yz.center.model.po.user.UserPo;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.yz.center.model.po.course.LecturerPo;
import lombok.Data;

@Data
public class CoursePo implements Serializable{
    
    //@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;
    private int templateId;
    private Integer courseId; //课程ID
    private Integer openId;
    private String id;     
    private String courseName; //课程名称
    private Integer coverId; //课程封面id
    private CoverPo cover;
    private Integer classhour;    //课时
    private Integer clickNum;   //点击次数
    private Integer videoNum; //课程下视频数量
    private Integer schoolId;    //学校ID
    private Integer courseTypeId;    //课程类别ID
    private String courseInfo;  //课程简介
    private Integer lecturerId;
    private List<LecturerPo> lecturerPo;   //讲师ID
    private CommonsMultipartFile  coverFile;
    private Date startDt;         //课程开始时间
    private Date endDt;           //课程结束时间
    private String maxUrl;
    private String minUrl;
    private Integer state; // 是否可用
    private Integer isPublic; //是否公开
    private Date createDt;
    private UserPo createUser;
    private Integer createUserId;
    private Date updateDt;
    private Integer updateUserId;
    private StudentCoursePo studentCoursePo;
    private CourseTypePo courseTypePo;
    private UserPo userPo;
}
