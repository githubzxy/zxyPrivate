package com.yz.center.model.po.comment;

import java.util.Date;

import lombok.Data;

@Data
public class CommentPo {
	 private  Integer commentId;
	 private Integer openId;
     private Integer userId;
     private String content;
     private Date creDt;
     private Date staDt;
     private Integer state;
     private String userName;
     private String avatar;
     private String createDt;
}