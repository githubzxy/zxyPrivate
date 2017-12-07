/**
  * @FileName: RoleControllerVo.java
  * @Author 
  * @Description:
  * @Date 2017年2月6日 上午6:27:33
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.model.vo.role;

import java.util.List;

import com.yz.center.controller.base.RoleController;

import lombok.Data;

@Data
public class RoleControllerVo{
    private Integer id;
    private Integer conTypeId;
    private String  conName;
    private String  url;
    private Integer level;
    private Integer parentId;
    private String  ico;
    private List<RoleController> children;
}
