/**
  * @FileName: CoverPo.java
  * @Author 
  * @Description:
  * @Date 2016年12月7日 下午1:59:24
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.model.po.course;

import java.util.Date;

import lombok.Data;

@Data
public class CoverPo{

       private Integer coverId;
       private String name;
       private String maxUrl;
       private String middleUrl;
       private String minUrl;
       private Date createDate;
}
