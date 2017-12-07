/**
  * @FileName: ResourceTypePo.java
  * @Author 
  * @Description:
  * @Date 2016年11月17日 下午3:37:30
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.model.po.resource;

import java.util.Date;

import lombok.Data;

@Data
public class ResourceTypePo{

    private Integer id;
    private String name;
    private String code;
    private Date createDt;
    private String info;
    private Integer num;
   }