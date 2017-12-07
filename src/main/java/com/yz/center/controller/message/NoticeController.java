package com.yz.center.controller.message;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.message.NoticePo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.message.NoticeVo;
import com.yz.center.service.iface.message.NoticeService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月15日 下午3:34:06 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@RequestMapping("admin/notice")
@Controller
public class NoticeController {
	
	@Resource
	private NoticeService noticeService;
	
	@RequestMapping(value = "/list.html", method = RequestMethod.GET)
	public String toList(){
		return "admin/message/notice/list";
	}
	
	@RequestMapping(value = "/list.html", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap noticeList( PageBean pageBean,HttpSession session){
		ModelMap map = new ModelMap();
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = noticeService.findNoticePos(pageBean);
		map.addAttribute("page", pageBean);
		return map;
	}
	
	@RequestMapping("/detail.html" )
	public String detail(Integer noticeId,ModelMap model){
		NoticeVo noticeVo = noticeService.findNoticePoById(noticeId);
		model.addAttribute("noticeVo", noticeVo);
		return "/admin/message/notice/detail";
		
	}
	
	@RequestMapping("/toAdd.html")
	public String toAdd(){
		
		return "/admin/message/notice/add";

	}
	
	@RequestMapping(value = "/add.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap add(NoticePo noticePo,HttpSession session) {
		ModelMap model = new ModelMap();
		UserPo loginUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		session.getAttribute(Static.SCHOOL_SESSION);
		Integer flag = noticeService.addNotice(noticePo, loginUser.getUserId());
		if (flag == 1) {
			return model.addAttribute("flag", "1")
					.addAttribute("msg", "添加成功！！");
		}
		return model.addAttribute("flag", "0")
					.addAttribute("msg", "添加失败！！");
		
	}
	@RequestMapping("/toEdit.html")
	public String toEdit(@RequestParam("noticeId")Integer noticeId,ModelMap model){
			
		NoticeVo noticeVo = noticeService.findNoticePoById(noticeId);
		model.addAttribute("noticeVo", noticeVo);
		return "/admin/message/notice/edit";
		
	}
	@RequestMapping(value = "/edit.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap edit(NoticePo noticePo){
		ModelMap model = new ModelMap();
		Integer flag = noticeService.updateNotice(noticePo);
		if (flag==1) {
			return model.addAttribute("flag", "1")
					.addAttribute("msg", "编辑成功！！");
		}
		return model.addAttribute("flag", "0")
				.addAttribute("msg", "编辑失败！！");
	}
	
	
	@RequestMapping(value = "/delAll.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap delAll(@RequestParam(value="noticeIds[]")int noticeIds[]){
		ModelMap model = new ModelMap();
		Integer flag = noticeService.delAll(noticeIds);
		if (flag==1) {
			return model.addAttribute("flag", "1")
				    .addAttribute("msg", "删除成功！");
		
		}
		return model.addAttribute("flag", "0")
				    .addAttribute("msg", "删除失败！");
		
	}
	@RequestMapping("/del.html")
	@ResponseBody
	public ModelMap del(@RequestParam(value="noticeId")Integer noticeId) {
		ModelMap model = new ModelMap();
		Integer flag = noticeService.del(noticeId);
		if (flag ==1) {
			return model.addAttribute("flag", "1")
					.addAttribute("msg", "删除成功！");
			
		}
		return model.addAttribute("flag", "0")
				.addAttribute("msg", "删除失败！");
		
	}

}
