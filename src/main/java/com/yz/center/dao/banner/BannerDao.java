
/**    
* @Title: BannerDao.java
* @Package com.yz.center.dao.banner
* Description: TODO
* @author: 
* @date: 2017年2月28日 上午9:16:34 
* @version V1.0 
*   
*/  

package com.yz.center.dao.banner;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.yz.center.model.po.bannerPo.BannerPo;
import com.yz.center.util.common.PageBean;


/**  
* Description: TODO
* @author Administrator  
* @date: 2017年2月28日 上午9:16:34 
* @version V1.0   
*/
@Repository
public interface BannerDao {
	Integer addBanner(BannerPo bannerPo);
	Integer delBanner(Integer bannerId);
	
	/**   
	* Title: listBanner 
	* Description: 列表查询 
	* @param pageBean
	* @return
	* @author Administrator 
	*/
	
	List<BannerPo> listBanner(PageBean pageBean);

	
	/**   
	* Title: getUrlBybannerId 
	* Description: 获取banner的url  
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
	
	/**   
	* Title: getBannerCount 
	* Description: TODO  
	* @param pageBean
	* @return
	* @author Administrator 
	*/
	
	Integer getBannerCount(PageBean pageBean);

}
