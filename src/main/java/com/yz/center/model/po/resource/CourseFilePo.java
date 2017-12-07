/**
  * @FileName: CourseFile.java
  * @Author 
  * @Description:
  * @Date 2016年9月8日 下午1:34:38
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.model.po.resource;

import java.io.Serializable;
import java.util.Date;

import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;

import lombok.Data;

@Data
public class CourseFilePo implements Serializable{//@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;//@Fields serialVersionUID : 

    private Integer id;
    private String name;
    private Integer chapterId;
    private Integer courseId;
    private Integer fileType;
    private FileType fileTypePo;
    private String url;
    private String info;
    private Long fileSize;
    private String fileSuffix;  //文件名后缀
    private String downNum; //下载次数
    private Integer schoolId;
    private Integer teacherId;
    private Date createDate;
    private Integer createrUserId ;    // 创建者姓名(非持久字段，只用于显示)
    private UserPo createUser;
    private Date updateDate;
    private SchoolPo school;
    private Integer state;
    private Integer allow_down; //0：不允许下载，1：允许下载
    private Integer stu_allow_down; //0：不允许学生下载，1：允许学生下载
}
