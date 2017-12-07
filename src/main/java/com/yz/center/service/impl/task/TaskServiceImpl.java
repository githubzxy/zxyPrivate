package com.yz.center.service.impl.task;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.task.TaskDao;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.service.iface.task.TaskService;
import com.yz.center.util.CommonUtil;
@Service("taskService")
public class TaskServiceImpl implements TaskService {
	@Resource 
	private TaskDao taskDao;

	@Override
	public List<CoursePo> getCourseInfo(Integer begin,Integer pageSize) {
		// TODO Auto-generated method stub
		List<CoursePo> courseInfo = taskDao.getCourseInfo(begin,pageSize);
		return courseInfo;
	}

	@Override
	public Integer getCount() {
		// TODO Auto-generated method stub
		Integer count = taskDao.getCount();
		return count;
	}

	@Override
	public int taskAdd(TaskPo taskPo) {
		// TODO Auto-generated method stub
		taskPo.setCreateDate(new Date());
		taskPo.setUseType(1);//用于作业
		try{
			taskDao.taskAdd(taskPo);
			
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
	}
	
	
	

}