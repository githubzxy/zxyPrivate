package com.yz.center.dao.task;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.task.TaskPo;

public interface TaskDao {
   List<CoursePo> getCourseInfo(@Param(value="begin")Integer begin,@Param(value="pageSize")Integer pageSize);
   public Integer getCount();
   public void taskAdd(TaskPo taskPo);
}
