package com.yz.center.controller.discuss;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.discuss.DiscussThemePo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.DiscussVo;
import com.yz.center.model.vo.course.OpenCourseVo;
import com.yz.center.service.iface.course.OpenCourseService;
import com.yz.center.service.iface.discuss.DiscussService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/**	
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("admin/discuss")
public class DiscussController {
	
	@Resource
	private DiscussService discussService;
	@Resource
	private OpenCourseService openCourseService;
	
	@RequestMapping("toAdd")
	public String toAddDiscuss(HttpSession session,ModelMap modelMap){
		SchoolPo schoolPo = (SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
		//查询所有已开课程
		List<OpenCourseVo> openCourseVos = openCourseService.getAllopenCourse(schoolPo.getSchoolId() );
		modelMap.addAttribute("openCourseVos", openCourseVos);
		return "admin/discuss/add";
	}
	
	@RequestMapping("addDiscussTheme")
	@ResponseBody
	public ModelMap addDiscussTheme(HttpSession session,DiscussThemePo discussThemePo,Integer openId){
		OpenCoursePo openCoursePo  = new OpenCoursePo();
		openCoursePo.setOpenId(openId);
		discussThemePo.setOpenCoursePo(openCoursePo);
		UserPo userPo = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		discussThemePo.setUserId(userPo.getUserId());
		Integer flag = discussService.addDiscussTheme(discussThemePo);
		ModelMap modelMap = new ModelMap();
		if (flag == 0) {
			modelMap.addAttribute("flag", flag)
					.addAttribute("msg", "添加讨论主题失败！");
		}else {
			modelMap.addAttribute("flag", flag)
					.addAttribute("msg", "添加讨论主题成功！");
		}
		return modelMap;	
	}
	
	@RequestMapping("listDiscussTheme")
	public String listDiscussTheme(PageBean pageBean,ModelMap modelMap,HttpSession session){
		
		SchoolPo schoolPo = (SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
		//查询所有已开课程
		List<OpenCourseVo> openCourseVos = openCourseService.getAllopenCourse(schoolPo.getSchoolId() );
		modelMap.addAttribute("openCourseVos", openCourseVos);
		
		return "admin/discuss/list";
	}
	@RequestMapping(value="listDiscussTheme",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap listDiscussTheme(PageBean pageBean){
		System.out.println(pageBean.getOpenId());
		List<DiscussThemePo> discussThemePos = discussService.listDiscussTheme(pageBean);
		ModelMap modelMap = new ModelMap();
		pageBean.setList(discussThemePos);
		System.out.println(pageBean.getList());
		modelMap.addAttribute("page", pageBean);
		return modelMap;
		
	}
	
	@RequestMapping("del")
	@ResponseBody
	public ModelMap del(Integer themeId){
		Integer flag = discussService.delDiscussTheme(themeId);
		ModelMap modelMap = new ModelMap();
		if (flag == 0) {
			modelMap.addAttribute("flag", flag)
					.addAttribute("msg", "删除讨论主题失败!");
		}else {
			modelMap.addAttribute("flag", flag)
					.addAttribute("msg", "删除讨论主题成功！");
		}
		return modelMap;
	}
	
	@RequestMapping("delMany")
	@ResponseBody
	public ModelMap delMany(@RequestParam("themeIds[]")Integer themeIds[]){
		Integer flag= discussService.delMany(themeIds);
		ModelMap modelMap = new ModelMap();
		if (flag ==1 ) {
			return modelMap.addAttribute("flag",flag)
							.addAttribute("msg", "删除成功！");
		}else {
			return modelMap.addAttribute("flag", flag)
							.addAttribute("msg", "删除失败！");
		}	
	}
	@RequestMapping("toUpdata")
	public String toUpdata(Integer themeId,HttpSession session,ModelMap modelMap){
		SchoolPo schoolPo = (SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
		//查询所有已开课程
		List<OpenCourseVo> openCourseVos = openCourseService.getAllopenCourse(schoolPo.getSchoolId() );
		
		DiscussVo discussThemePo = discussService.findDiscussThemebyId(themeId);
		
		modelMap.addAttribute("openCourseVos", openCourseVos)
				.addAttribute("discussThemePo", discussThemePo);
		return "admin/discuss/updata";
		
	}
	@RequestMapping("updataTheme")
	@ResponseBody
	public ModelMap updataTheme(DiscussThemePo discussThemePo,Integer openId){
		OpenCoursePo openCoursePo = new OpenCoursePo();
		openCoursePo.setOpenId(openId);
		discussThemePo.setOpenCoursePo(openCoursePo);
		Integer flag = discussService.updataTheme(discussThemePo);
		ModelMap modelMap = new ModelMap();
		if (flag == 1) {
			return modelMap.addAttribute("flag", flag)
						   .addAttribute("msg", "更新数据成功");
		}else {
			return modelMap.addAttribute("flag", flag)
							.addAttribute("msg", "更新数据失败");
		}
		
		
	}
}
