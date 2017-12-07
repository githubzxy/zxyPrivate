/**
  * @FileName: ResourceForm.java
  * @Author 
  * @Description:
  * @Date 2016年11月16日 下午2:05:51
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.model.form;

import java.io.Serializable;

import lombok.Data;

@Data
public class ResourceForm implements Serializable{//@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;//@Fields serialVersionUID :{
    
    private Integer id;
    private Integer resourceType;
    private String courseIds;
    private String info;
    private Integer fileId;
}
