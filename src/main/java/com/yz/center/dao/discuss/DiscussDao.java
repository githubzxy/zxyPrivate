
/**    
* @Title: Discussdao.java
* @Package com.yz.center.dao.discuss
* Description: TODO
* @author: 
* @date: 2016年12月19日 下午5:46:59 
* @version V1.0 
*   
*/  

package com.yz.center.dao.discuss;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.discuss.DiscussPo;
import com.yz.center.model.po.discuss.DiscussThemePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.DiscussVo;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月19日 下午5:46:59 
* @version V1.0   
*/

public interface DiscussDao {

	
	/**   
	* Title: findmydiscuss 
	* Description: TODO  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	List<DiscussPo> findmydiscuss(BaseConditionVO baseConditionVO);

	
	/**   
	* Title: selecPageCount 
	* Description: TODO  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	Integer selecPageCount(BaseConditionVO baseConditionVO);


	
	/**   
	* Title: selecPageCount2 
	* Description: TODO  
	* @param baseConditionVO
	* @author Administrator 
	*/
	
	Integer selecPageCount2(BaseConditionVO baseConditionVO);


	
	/**   
	* Title: findAllDiscuss 
	* Description: TODO  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	List<DiscussVo> findAllDiscuss(BaseConditionVO baseConditionVO);


	
	/**   
	* Title: selecCount2 
	* Description: TODO  
	* @param themeId
	* @return
	* @author Administrator 
	*/
	
	Integer selecCount(Integer themeId);


	
	/**   
	* Title: addDiscussByThemeId 
	* Description: TODO  
	* @param discussPo
	* @return
	* @author Administrator 
	*/
	
	Integer addDiscussByThemeId(DiscussPo discussPo);


	
	/**   
	* Title: findDiscussTheme 
	* Description: TODO  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	List<DiscussVo> findDiscussTheme(BaseConditionVO baseConditionVO);


	
	/**   
	* Title: findDiscussBythemeId 
	* Description: TODO  
	* @param baseConditionVO
	* @param themeId
	* @return
	* @author Administrator 
	*/
	
	List<DiscussPo> findDiscussBythemeId(@Param("baseConditionVO")BaseConditionVO baseConditionVO, @Param("themeId")Integer themeId);


	
	/**   
	* Title: findAllDiscussBythemeId 
	* Description: TODO  
	* @param baseConditionVO
	* @param themeId
	* @return
	* @author Administrator 
	*/
	
	List<DiscussVo> findAllDiscussBythemeId(@Param("baseConditionVO")BaseConditionVO baseConditionVO, @Param("themeId")Integer themeId);


	
	/**   
	* Title: updateMydissCount 
	* Description: TODO  
	* @param discussPo
	* @return
	* @author Administrator 
	*/
	
	Integer updateMydissCount(DiscussPo discussPo);


	Integer addDiscussTheme(DiscussThemePo discussThemePo);


	List<DiscussThemePo> listDiscussTheme(PageBean pageBean);


	Integer getDiscussThemeCount(PageBean pageBean);


	Integer delDiscussTheme(Integer themeId);


	DiscussVo findDiscussThemebyId(Integer themeId);


	Integer updataTheme(DiscussThemePo discussThemePo);
	
}
