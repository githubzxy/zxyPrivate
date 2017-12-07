package com.yz.center.service.iface.task;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.task.TaskPo;

public interface TaskService {
	List<CoursePo> getCourseInfo(Integer begin,Integer pageSize);
	public Integer getCount();
	public int taskAdd(TaskPo taskPo);

}
