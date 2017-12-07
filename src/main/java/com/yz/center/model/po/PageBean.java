package com.yz.center.model.po;

import lombok.Data;

@Data
public class PageBean {
      private Integer pageNum;
      private Integer pageSize;
      private Integer totalItem;
      private Integer totalPage;
      private Integer startIndex;
      private String cname;
      private String cnumber;
      private String className;
      private Integer classId;
      private Integer gradeId;
      private String keyWord;
      private Integer schoolId;
      private Integer courseId;
      private Integer userId;
      private String code;
      private Integer courseTypeId;//前台课程展示页面需要的courseTypeId条件
      private Integer openId;//前台获取openId下的所有评论
      private Integer videoId;
      private Integer functionId;
      private String paperTitle;
}