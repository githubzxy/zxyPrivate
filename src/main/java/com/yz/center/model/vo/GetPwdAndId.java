package com.yz.center.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
@Data
public class GetPwdAndId implements Serializable {
	private Integer loginId;
	private String loginPwd;

}