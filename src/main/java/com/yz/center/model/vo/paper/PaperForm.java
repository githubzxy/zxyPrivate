package com.yz.center.model.vo.paper;

import lombok.Data;

@Data
public class PaperForm {
     private Integer functionId;
     private Integer courseId;
     private Integer openId;
     private Integer videoId;
     private Integer singleSelectedSco;
     private Integer judgeSco;
     private Integer multiSelectedSco;
     private Integer singleSelectedNum;
     private Integer judgeNum;
     private Integer multiSelectedNum;
     private Integer paperItems;
     private String courseName;
     private String videoName; 
     private Integer teacherId;
     private Integer showSecond;
}
