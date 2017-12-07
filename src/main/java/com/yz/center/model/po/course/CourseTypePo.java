package com.yz.center.model.po.course;

import java.util.Date;

import com.yz.center.model.po.user.UserPo;

import lombok.Data;

@Data
public class CourseTypePo{
    private Integer courseTypeId;
    private Integer parentId;
    private UserPo  user;
    private Integer schoolId;
    private String  typeName;
    private String  typeInfo;
    private Integer courseCount;
    private String  url;
    private float classhour;
    private Date createDate;
    private Date stateDate;
    private Integer state;
    private String parentName;
    private CoursePo coursePo;

}
