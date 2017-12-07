
/**    
* @Title: BannerServiceImpl.java
* @Package com.yz.center.service.impl.banner
* Description: TODO
* @author: 
* @date: 2017年2月28日 上午9:20:39 
* @version V1.0 
*   
*/  

package com.yz.center.service.impl.banner;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.banner.BannerDao;
import com.yz.center.model.po.bannerPo.BannerPo;
import com.yz.center.service.iface.banner.BannerService;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年2月28日 上午9:20:39 
* @version V1.0   
*/
@Service("bannerService")

public class BannerServiceImpl implements BannerService {

	@Resource
	private BannerDao bannerDao;

	
	/** 
	* Title: addBanner
	* Description: 添加轮播图
	* @see com.yz.center.service.iface.banner.BannerService#addBanner(com.yz.center.model.po.bannerPo.BannerPo)  
	*/
	
	@Override
	public Integer addBanner(BannerPo bannerPo) {
		bannerPo.setState(1);
		return bannerDao.addBanner(bannerPo);
	}


	
	/** 
	* Title: deleteBanner
	* Description: 删除单个轮播图
	* @see com.yz.center.service.iface.banner.BannerService#deleteBanner(java.lang.Integer)  
	*/
	
	@Override
	public Integer deleteBanner(Integer bannerId) {
		 return bannerDao.delBanner(bannerId);
	}



	
	/** 
	* Title: deleteAllBanner
	* Description: 批量删除轮播图
	 * @throws Exception 
	* @see com.yz.center.service.iface.banner.BannerService#deleteAllBanner(java.lang.Integer[])  
	*/
	
	@Override
	public Integer deleteAllBanner(Integer[] bannerIds) {
		Integer flag=null;
		  try {
	  for(Integer id:bannerIds){
		  flag=bannerDao.delBanner(id);
		  if(flag!=1){
				throw new Exception();
		  }
	  }
	  } catch (Exception e) {
			flag=0;
			e.printStackTrace();
		}
		return flag;
	}


	
	
	/** 
	* Title: listBanner
	* Description: 
	* @see com.yz.center.service.iface.banner.BannerService#listBanner(com.yz.center.util.common.PageBean)  
	*/
	
	@Override
	public PageBean listBanner(PageBean pageBean) {
		Integer count = bannerDao.getBannerCount(pageBean);
		pageBean.setTotalPage(count);
		List<BannerPo> bannerPos = bannerDao.listBanner(pageBean);
		pageBean.setList(bannerPos);
		return pageBean;
	}


	
	/** 
	* Title: getUrlBybannerId
	* Description: 
	* @see com.yz.center.service.iface.banner.BannerService#getUrlBybannerId(java.lang.Integer)  
	*/
	
	@Override
	public BannerPo getUrlBybannerId(Integer bannerId) {
		BannerPo bannerPo = bannerDao.getUrlBybannerId(bannerId);
		return bannerPo;
	}



	
	/** 
	* Title: getIndexBanner
	* Description: 
	* @see com.yz.center.service.iface.banner.BannerService#getIndexBanner(java.lang.Integer)  
	*/
	
	@Override
	public List<BannerPo> getIndexBanner(Integer schoolId) {
		
		return bannerDao.getIndexBanner(schoolId);
	}
	

}
