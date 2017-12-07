/**
  * @FileName: ResourcePo.java
  * @Author 
  * @Description:
  * @Date 2016年9月8日 下午1:34:38
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.model.po.resource;

import java.io.Serializable;
import java.util.Date;

import com.yz.center.model.po.school.SchoolPo;

import lombok.Data;

@Data
public class ResourcePo implements Serializable{//@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;//@Fields serialVersionUID : 

    private Integer id;
    private String name;
    private Integer fileType;
    private FileType fileTypePo;
    private String url;
    private Long fileSize;
    private Integer resourceType;
    private String info;
    private String fileSuffix;  //文件名后缀
    private String downNum; //下载次数
    private Integer schoolId;
    private Integer creatUserId;
    private Date createDate;
    private String createrName ;    // 创建者姓名(非持久字段，只用于显示)
    private SchoolPo school ;
    private Integer state;
    private Integer allow_down; //0：不允许下载，1：允许下载
    private Integer stu_allow_down; //0：不允许学生下载，1：允许学生下载
}
