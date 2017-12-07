package com.yz.center.controller.message;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.ClassPo;
import com.yz.center.model.po.message.MessagePo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.message.MessageVo;
import com.yz.center.service.iface.message.MessageService;
import com.yz.center.service.iface.myClass.ClassService;
import com.yz.center.service.iface.student.StudentService;
import com.yz.center.service.iface.teacher.TeacherService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年12月7日 下午1:46:24 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@RequestMapping("admin/message")
@Controller
public class MessageController {
	
	@Resource
	private MessageService messageService;
	@Resource
	private ClassService classService;
	@Resource
	private StudentService studentService;
	@Resource
	private TeacherService teacherService;
	
	@RequestMapping(value="/list.html",method=RequestMethod.GET)
	public String toList(){
		return "/admin/message/advice/list";
	}
	
	@RequestMapping("/list.html")
	@ResponseBody
	public ModelMap noticeList( PageBean pageBean){
		ModelMap map = new ModelMap();
		pageBean = messageService.findMessagePos(pageBean);
		map.addAttribute("page", pageBean);
		return map;
	}
	
	@RequestMapping("/detail.html" )
	public String detail(Integer messageId,ModelMap model){
		MessageVo messageVo = messageService.findMessageById(messageId);
		model.addAttribute("messageVo", messageVo);
		return "/admin/message/advice/detail";
		
	}
	@RequestMapping("/studentMessageDetails.html")
	public String studentDetail(Integer messageId, ModelMap model,HttpSession session){
		UserPo baseUser =  (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId= baseUser.getUserId();
		MessageVo messageVo = messageService.findStudentMessageById(messageId,userId);
		model.addAttribute("messageVo", messageVo);
		return "/study/messageDetail";
		
	}
	
	@RequestMapping("/toAdd.html")
	public String toAdd(ModelMap model,HttpSession session){
		//查询班级
	    SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
	    Integer schoolId = schoolPo.getSchoolId();
		List<ClassPo> classPos = classService.findallClass(schoolId);
		model.addAttribute("classPos", classPos);
		return "/admin/message/advice/add";
	}
	
	@RequestMapping(value = "/add.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap add(MessagePo messagePo,@RequestParam(value="toUsers[]",required = false)Integer toUsers[],
			Integer classId, String role,HttpSession session) {
		ModelMap model = new ModelMap();
		System.out.println("新增："+messagePo.getContent());
		SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = schoolPo.getSchoolId();
			//查询该班级下所有教师或者学生;
			if ("教师".equals(role)) {
				if (classId != null&&classId !=-1) {
					toUsers = teacherService.getAllTeacherByclassId(classId);
				}
				if (classId != null&&classId==-1) {
					//查询全体教师
					toUsers = teacherService.getAllTeacher(schoolId);
				}
			}
			if ("学生".equals(role)) {
				if (classId != null&&classId !=-1) {
					toUsers = studentService.getAllStudentByclassId(classId);
				}
				if (classId != null&&classId==-1) {
					//查询全体学生
					toUsers = studentService.getAllStudentBySchoolId(schoolId);
				}
			}
		
		UserPo loginUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		if (toUsers==null) {
			return model.addAttribute("flag", "0")
					.addAttribute("msg", "添加失败！！请选择被通知人");
		}else {
			Integer flag = messageService.addMessage(messagePo,toUsers, loginUser.getUserId());
			if (flag > 0) {
				return model.addAttribute("flag", "1")
						.addAttribute("msg", "添加成功！！");
			}
			else {
				return model.addAttribute("flag", "0")
						.addAttribute("msg", "添加失败！！");
			}
		}
		
		
		
	}
	
	
	@RequestMapping("/toEdit.html")
	public String toEdit(@RequestParam("messageId")Integer messageId,ModelMap model,HttpSession session){
		//查询班级
	    SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
		List<ClassPo> classPos = classService.findallClass(schoolId);	
		//查询单条通知
		MessageVo messageVo = messageService.findMessageById(messageId);
		model.addAttribute("messagePo", messageVo)
			 .addAttribute("classPos", classPos);
		return "/admin/message/advice/edit";
	}
	
	@RequestMapping(value = "/edit.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap edit(MessagePo messagePo,HttpSession session) {
		ModelMap model = new ModelMap();
		System.out.println("编辑时："+messagePo.getContent());
		Integer flag = messageService.updateMessage(messagePo);
		if (flag == 1) {
			return model.addAttribute("flag", "1")
					.addAttribute("msg", "添加成功！！");
		}
		return model.addAttribute("flag", "0")
					.addAttribute("msg", "添加失败！！");
	}
	
	@RequestMapping(value = "/delAll.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap delAll(@RequestParam(value="messageIds[]")int messageIds[]){
		ModelMap model = new ModelMap();
		Integer flag = messageService.delAll(messageIds);
		if (flag>=1) {
			return model.addAttribute("flag", "1")
				    .addAttribute("msg", "删除成功！");
		
		}
		return model.addAttribute("flag", "0")
				    .addAttribute("msg", "删除失败！");
		
	}
	
	@RequestMapping("/del.html")
	@ResponseBody
	public ModelMap del(@RequestParam(value="messageId")Integer messageId) {
		ModelMap model = new ModelMap();
		Integer flag = messageService.del(messageId);
		if (flag ==1) {
			return model.addAttribute("flag", "1")
					.addAttribute("msg", "删除成功！");
			
		}
		return model.addAttribute("flag", "0")
				.addAttribute("msg", "删除失败！");
		
	}
}
