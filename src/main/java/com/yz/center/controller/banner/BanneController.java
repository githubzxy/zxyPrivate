
/**    
* @Title: BanneController.java
* @Package com.yz.center.controller.banner
* Description: TODO
* @author: 
* @date: 2017年2月28日 上午9:15:16 
* @version V1.0 
*   
*/  

package com.yz.center.controller.banner;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.util.DelayableLittleEndianOutput;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.bannerPo.BannerPo;
import com.yz.center.model.po.school.SchoolPo;

import com.yz.center.service.iface.banner.BannerService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年2月28日 上午9:15:16 
* @version V1.0   
*/

@Controller
@RequestMapping("/banner")
public class BanneController {
	@Resource
	private BannerService bannerService;
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public String toAdd() {
		 return "admin/banner/add";
	}

	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap addBanner(BannerPo bannerPo,HttpSession session) {
		ModelMap modelMap=new ModelMap();
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		bannerPo.setSchoolId(school.getSchoolId());
		Integer flag=0;
		try {
			flag=bannerService.addBanner(bannerPo);
			if(flag==1){
				modelMap.addAttribute("flag", CommonUtil.FLAG_SUCESS)
				.addAttribute("msg", "新建成功");
			}else{
				modelMap.addAttribute("flag", CommonUtil.FLAG_FAILD)
				.addAttribute("msg", "新建失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("flag", CommonUtil.FLAG_FAILD)
			.addAttribute("msg", "新建失败");
			
		}
		return modelMap;
	}
	@RequestMapping("/del")
    @ResponseBody
	public ModelMap del(Integer bannerId){
		ModelMap modelMap=new ModelMap();
		Integer flag=0;
		try{
			flag=bannerService.deleteBanner(bannerId);
			if(flag==1){
				modelMap.addAttribute("flag", CommonUtil.FLAG_SUCESS)
				.addAttribute("msg", "删除成功");
			}else{
				modelMap.addAttribute("flag", CommonUtil.FLAG_FAILD)
				.addAttribute("msg", "删除失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelMap.addAttribute("flag", CommonUtil.FLAG_FAILD)
			.addAttribute("msg", "删除失败");
		}
		return modelMap;
	}
	@RequestMapping("/delAll")
	@ResponseBody
	public ModelMap delAll(@RequestParam(value="bannerIds[]") Integer bannerIds[]){
		ModelMap modelMap=new ModelMap();
		Integer flag=bannerService.deleteAllBanner(bannerIds);
		if(flag==1){
			modelMap.addAttribute("flag", CommonUtil.FLAG_SUCESS)
			.addAttribute("msg", "批量删除成功");
		}else{
			modelMap.addAttribute("flag", CommonUtil.FLAG_FAILD)
			.addAttribute("msg", "批量删除失败");
		}
		return  modelMap;
	}
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String toList() {
		 return "admin/banner/bannerList";
	}
	@RequestMapping(value="/list.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap list(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = bannerService.listBanner(pageBean);
		ModelMap modelMap = new ModelMap();
		return modelMap.addAttribute("page", pageBean);
		
	}
	@RequestMapping("/getUrl.html")
	public String getUrlBybannerId(Integer bannerId,ModelMap modelMap){
		BannerPo bannerPo = bannerService.getUrlBybannerId(bannerId);
		modelMap.addAttribute("bannerPo", bannerPo);
		return "admin/banner/check";
		
		
	}
	
	
}
