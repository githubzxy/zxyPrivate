/**
  * @FileName: FileType.java
  * @Author 
  * @Description:
  * @Date 2016年11月11日 下午5:12:37
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.model.po.resource;

import java.io.Serializable;

import lombok.Data;

@Data
public class FileType implements Serializable{//@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;//@Fields serialVersionUID : 
    
    private Integer id;
    private String name;
    private String code;
}
