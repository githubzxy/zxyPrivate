
/**    
* @Title: BannerService.java
* @Package com.yz.center.service.iface.banner
* Description: TODO
* @author: 
* @date: 2017年2月28日 上午9:19:37 
* @version V1.0 
*   
*/  

package com.yz.center.service.iface.banner;

import java.util.List;

import com.yz.center.model.po.bannerPo.BannerPo;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年2月28日 上午9:19:37 
* @version V1.0   
*/

public interface BannerService {
	public Integer addBanner(BannerPo bannerPo);
	
	public Integer deleteBanner(Integer bannerId);
	public Integer deleteAllBanner(Integer bannerIds[]);
	
	/**   
	* Title: listBanner 
	* Description: 列表查询banner图 
	* @param pageBean
	* @return
	* @author Administrator 
	*/
	
	PageBean listBanner(PageBean pageBean);


	
	/**   
	* Title: getUrlBybannerId 
	* Description: TODO  
	* @param bannerId
	* @return
	* @author Administrator 
	*/
	
	BannerPo getUrlBybannerId(Integer bannerId);


	
	/**   
	* Title: getIndexBanner 
	* Description: TODO  
	* @param schoolId
	* @return
	* @author Administrator 
	*/
	
	List<BannerPo> getIndexBanner(Integer schoolId);


}
