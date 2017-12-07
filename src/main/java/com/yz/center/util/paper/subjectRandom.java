package com.yz.center.util.paper;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import com.yz.center.model.po.paper.SubjectPo;

public class subjectRandom {
  public static String  getPaper(List<SubjectPo> subjectsofSingle,List<SubjectPo> subjectsofJudge,List<SubjectPo> subjectsofMulti){
      String subjectIds=new String("");
      randomSubjct(subjectsofSingle);
      randomSubjct(subjectsofJudge);
      randomSubjct(subjectsofMulti);
      for (SubjectPo s:subjectsofSingle) {
    	  subjectIds=subjectIds+s.getSubjectId()+",";
      }
     for(SubjectPo j:subjectsofJudge){
         subjectIds=subjectIds+j.getSubjectId()+",";
	}
     for(SubjectPo m:subjectsofMulti){
         subjectIds=subjectIds+m.getSubjectId()+",";
     }
     subjectIds = subjectIds.substring(0,subjectIds.length() - 1);
     return subjectIds;  
     
  }
  public static List<SubjectPo> randomSubjct(List<SubjectPo> subjects) {
	  Collections.shuffle(subjects,new Random());
	  return subjects;
  }
  
}