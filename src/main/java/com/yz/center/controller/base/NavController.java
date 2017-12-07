/**
  * @FileName: NavController.java
  * @Author 
  * @Description:
  * @Date 2017年2月6日 上午6:18:26
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.base;

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

@RequestMapping("admin/nav")
@Controller
public class NavController{
    
    @Resource
    private NavControllerService navControllerService;
    
    @RequestMapping("course")
    public String getCourseLeftFream(HttpSession session,ModelMap map){
        UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
        SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
        List<RoleControllerVo> list = navControllerService.findRoleCons(1, user.getRoleCode(), school.getSchoolId());
        System.out.println("ksdjskd"+list);
        map.addAttribute("controller", list);
        map.addAttribute("menuName", "课程建设");
        return "admin/layouts/left";
    }
    
    @RequestMapping("teacher")
    public String getTeacherLeftFream(HttpSession session,ModelMap map){
        UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
        SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
        List<RoleControllerVo> list = navControllerService.findRoleCons(3, user.getRoleCode(), school.getSchoolId());
        map.addAttribute("controller", list);
        map.addAttribute("menuName", "教务管理");
        return "admin/layouts/left";
    }
    
    @RequestMapping("resource")
    public String getResourceLeftFream(HttpSession session,ModelMap map){
        UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
        SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
        List<RoleControllerVo> list = navControllerService.findRoleCons(2, user.getRoleCode(), school.getSchoolId());
        map.addAttribute("controller", list);
        map.addAttribute("menuName", "教学资源");
        return "admin/layouts/left";
    }
    
    @RequestMapping("set")
    public String getSetLeftFream(HttpSession session,ModelMap map){
        UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
        SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
        List<RoleControllerVo> list = navControllerService.findRoleCons(4, user.getRoleCode(), school.getSchoolId());
        map.addAttribute("controller", list);
        map.addAttribute("menuName", "系统设置");
        return "admin/layouts/left";
    }
}