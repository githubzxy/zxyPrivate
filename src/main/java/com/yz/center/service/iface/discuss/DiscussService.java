
/**    
* @Title: DiscussService.java
* @Package com.yz.center.service.iface.discuss
* Description: TODO
* @author: 
* @date: 2016年12月19日 上午11:29:11 
* @version V1.0 
*   
*/  

package com.yz.center.service.iface.discuss;

import java.text.ParseException;
import java.util.List;

import com.yz.center.model.po.discuss.DiscussPo;
import com.yz.center.model.po.discuss.DiscussThemePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.DiscussVo;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月19日 上午11:29:11 
* @version V1.0   
*/

public interface DiscussService {

    
    /**   
    * Title: findmydiscuss 
    * Description: 查找到我所有说过的讨论  
    * @param baseConditionVO
    * @return
    * @author Administrator 
    */
    
    List<DiscussPo> findmydiscuss(BaseConditionVO baseConditionVO);

    
    /**   
    * Title: init1 
    * Description: TODO  
    * @param baseConditionVO
    * @param userId
    * @return
    * @author Administrator 
    */
    
    BaseConditionVO init1(BaseConditionVO baseConditionVO, Integer userId);


    
    /**   
    * Title: init2 
    * Description: TODO  
    * @param baseConditionVO
    * @return
    * @author Administrator 
    */
    
    BaseConditionVO init2(BaseConditionVO baseConditionVO);


    
    /**   
    * Title: findAllDiscuss 
    * Description: 查询所有的讨论主题及其下讨论（分页）  
    * @param baseConditionVO
    * @return
    * @author Administrator 
     * @param themeId 
    */
    
    List<DiscussVo> findAllDiscuss(BaseConditionVO baseConditionVO);


    
    /**   
    * Title: addDiscussByThemeId 
    * Description: 添加一条评论  
    * @param discussPo
    * @author Administrator 
    */
    
    Integer addDiscussByThemeId(DiscussPo discussPo);


    
    /**   
    * Title: findsomeDiscuss 
    * Description:查询个人中心的指定条数的讨论  
    * @return
    * @author Administrator 
     * @param userId 
    */
    
    List<DiscussVo> findsomeDiscuss(Integer userId);


    
    /**   
    * Title: findDiscussTheme 
    * Description: 查询所有的讨论主题 
    * @param baseConditionVO
    * @return
    * @author Administrator 
    */
    
    List<DiscussVo> findDiscussTheme(BaseConditionVO baseConditionVO);


    
    /**   
    * Title: findDiscussBythemeId 
    * Description: 根据讨论主题查询其下的所有讨论 （分页） 
    * @param baseConditionVO
    * @param themeId
    * @return
    * @author Administrator 
     * @throws ParseException 
    */
    
    List<DiscussPo> findDiscussBythemeId(BaseConditionVO baseConditionVO, Integer themeId) ;


    
    /**   
    * Title: findAllDiscussBythemeId 
    * Description: 根据讨论主题查询其下的所有讨论 （分页）
    * @param baseConditionVO
    * @param themeId
    * @return
    * @author Administrator 
    */
    
    List<DiscussVo> findAllDiscussBythemeId(BaseConditionVO baseConditionVO, Integer themeId);


	Integer addDiscussTheme(DiscussThemePo discussThemePo);


	List<DiscussThemePo> listDiscussTheme(PageBean pageBean);


	Integer delDiscussTheme(Integer themeId);


	DiscussVo findDiscussThemebyId(Integer themeId);


	Integer updataTheme(DiscussThemePo discussThemePo);


	Integer delMany(Integer[] themeIds);
    
}
