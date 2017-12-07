/**
  * @FileName: AdminIndexController.java
  * @Author 
  * @Description:
  * @Date 2016年10月25日 下午3:34:18
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.index;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.role.RoleControllerVo;
import com.yz.center.service.iface.role.NavControllerService;
import com.yz.center.util.Static;

@RequestMapping("admin")
@Controller
public class AdminIndexController{
	
	@Resource
    private NavControllerService navControllerService;
    
    @RequestMapping("top")
    public String top(String rels,ModelMap map,HttpSession session){
    	UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
        SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
        List<RoleControllerVo> list= navControllerService.findRoleCons(0, user.getRoleCode(), school.getSchoolId());
        map.addAttribute("navs", list);
    	map.addAttribute("f", rels);
        return "admin/layouts/top";
    }
    @RequestMapping("footer")
    public String footer(){
        return "admin/layouts/footer";
    }

    @RequestMapping("index")
    public String index(String rels,ModelMap map){
         System.out.println("maoamo:"+rels);
    	map.addAttribute("rels", rels);
    	return "admin/layouts/main";
    }

    
  /*  @RequestMapping("teacher")
    public String teacher(ModelMap map){
    	map.addAttribute("f", "teacher");
    	return "admin/layouts/main";
    }
    
    @RequestMapping("course")
    public String course(ModelMap map){
    	map.addAttribute("f", "course");
    	return "admin/layouts/main";
    }
    
    @RequestMapping("resource")
    public String resource(ModelMap map){
    	map.addAttribute("f", "resource");
    	return "admin/layouts/main";
    }*/
    
}
