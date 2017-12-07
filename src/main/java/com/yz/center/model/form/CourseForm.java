package com.yz.center.model.form;

import java.io.Serializable;
import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yz.center.model.po.course.CoverPo;
import com.yz.center.model.po.user.UserPo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CourseForm implements Serializable{

    //@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;
    private Integer courseId; //课程ID
    private String courseName; //课程名称
    private String courseInfo;  //课程简介
    private Integer coverId;
    private Integer coverIdTmp;//封面临时id
    private CoverPo cover;
    private Integer courseTypeId;
    private Double classhour;    //课时
    private String lectureIds;
    private Integer schoolId;    //学校ID
    private Integer lectureUserId;   //讲师ID
    private Date createDt;
    private Date updateDt;
    private Integer createUserId;
    private UserPo createUser;
}
