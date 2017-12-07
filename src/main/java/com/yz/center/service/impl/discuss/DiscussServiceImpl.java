
/**    
* @Title: DiscussServiceImpl.java
* @Package com.yz.center.service.impl.discuss
* Description: TODO
* @author: 
* @date: 2016年12月19日 上午11:30:52 
* @version V1.0 
*   
*/  

package com.yz.center.service.impl.discuss;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.discuss.DiscussDao;
import com.yz.center.model.po.discuss.DiscussPo;
import com.yz.center.model.po.discuss.DiscussThemePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.DiscussVo;
import com.yz.center.service.iface.discuss.DiscussService;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月19日 上午11:30:52 
* @version V1.0   
*/
@Service("discussService")
public class DiscussServiceImpl implements DiscussService{
    @Resource
    private DiscussDao discussDao;
    
    /** 
    * Title: findmydiscuss
    * Description: 
    * @see com.yz.center.service.iface.discuss.DiscussService#findmydiscuss(com.yz.center.model.vo.BaseConditionVO)  
    */
    
    @Override
    public List<DiscussPo> findmydiscuss(BaseConditionVO baseConditionVO) {
        
        return discussDao.findmydiscuss(baseConditionVO);
    }

    
    /** 
    * Title: init1
    * Description: 
    * @see com.yz.center.service.iface.discuss.DiscussService#init1(com.yz.center.model.vo.BaseConditionVO, java.lang.Integer)  
    */
    
    @Override
    public BaseConditionVO init1(BaseConditionVO baseConditionVO, Integer userId) {
        baseConditionVO.setUserId(userId);
        baseConditionVO.setPageSize(10);
        Integer totalCount = discussDao.selecPageCount(baseConditionVO);
        baseConditionVO.setTotalCount(totalCount);
        return baseConditionVO;
    }


    
    /** 
    * Title: init2
    * Description: 
    * @see com.yz.center.service.iface.discuss.DiscussService#init2(com.yz.center.model.vo.BaseConditionVO)  
    */
    
    @Override
    public BaseConditionVO init2(BaseConditionVO baseConditionVO) {
        baseConditionVO.setPageSize(10);
        Integer totalCount = discussDao.selecPageCount2(baseConditionVO);
        baseConditionVO.setTotalCount(totalCount);
        return baseConditionVO;
    }


    
    /** 
    * Title: findAllDiscuss
    * Description: 
    * @see com.yz.center.service.iface.discuss.DiscussService#findAllDiscuss(com.yz.center.model.vo.BaseConditionVO)  
    */
    
    @Override
    public List<DiscussVo> findAllDiscuss(BaseConditionVO baseConditionVO) {
        List<DiscussVo> discussVos = discussDao.findAllDiscuss(baseConditionVO);
        //循环统计没想theme的品论数量
        for(int i = 0;i<discussVos.size();i++){
            Integer themeId = discussVos.get(i).getThemeId();
            Integer answerCount = discussDao.selecCount(themeId);
            discussVos.get(i).setAnswerCount(answerCount);
        }   
        return discussVos;
    }


    
    /** 
    * Title: addDiscussByThemeId
    * Description: 
    * @see com.yz.center.service.iface.discuss.DiscussService#addDiscussByThemeId(com.yz.center.model.po.discuss.DiscussPo)  
    */
    
    @Override
    public Integer addDiscussByThemeId(DiscussPo discussPo) {
        Integer flag = discussDao.addDiscussByThemeId(discussPo);
        //将我的学习记录里的DiscussCount数量加一
        Integer flag1 = discussDao.updateMydissCount(discussPo);
        return flag1;
        
    }


    
    /** 
    * Title: findsomeDiscuss
    * Description: 
    * @see com.yz.center.service.iface.discuss.DiscussService#findsomeDiscuss()  
    */
    
    @Override
    public List<DiscussVo> findsomeDiscuss(Integer userId) {
        BaseConditionVO baseConditionVO = new BaseConditionVO();
        baseConditionVO.setPageSize(5);
        baseConditionVO.setUserId(userId);
        List<DiscussVo> discussVos = discussDao.findAllDiscuss(baseConditionVO);
        //循环统计没想theme的品论数量
        for(int i = 0;i<discussVos.size();i++){
            Integer themeId = discussVos.get(i).getThemeId();
            Integer answerCount = discussDao.selecCount(themeId);
            discussVos.get(i).setAnswerCount(answerCount);
        }   
        return discussVos;
    }
	


    
    /** 
    * Title: findDiscussTheme
    * Description: 
    * @see com.yz.center.service.iface.discuss.DiscussService#findDiscussTheme(com.yz.center.model.vo.BaseConditionVO)  
    */
    
    @Override
    public List<DiscussVo> findDiscussTheme(BaseConditionVO baseConditionVO) {
        List<DiscussVo> discussVoThemes = discussDao.findDiscussTheme(baseConditionVO);
        //循环统计没想theme的品论数量
        for(int i = 0;i<discussVoThemes.size();i++){
            Integer themeId = discussVoThemes.get(i).getThemeId();
            Integer answerCount = discussDao.selecCount(themeId);
            discussVoThemes.get(i).setAnswerCount(answerCount);
        }   
        return discussVoThemes;
    }


    
    /** 
    * Title: findDiscussBythemeId
    * Description: 
     * @throws ParseException 
    * @see com.yz.center.service.iface.discuss.DiscussService#findDiscussBythemeId(com.yz.center.model.vo.BaseConditionVO, java.lang.Integer)  
    */
    
    @Override
    public List<DiscussPo> findDiscussBythemeId(BaseConditionVO baseConditionVO, Integer themeId) {
        List<DiscussPo> discussVos  = discussDao.findDiscussBythemeId(baseConditionVO,themeId);
        //处理时间
        Date now = new Date();
        
        for(DiscussPo discussPo :discussVos){
            long times = now.getTime() - discussPo.getCreateDate().getTime();
            String  timeInterval = null ;
            if ((times/(1000*60*60*24))>0) {
                timeInterval=times/(1000*60*60*24)+"天前";
            }
            if ((times/(1000*60*60*24))<=0&&(times/(1000*60*60))>0) {
                timeInterval=times/(1000*60*60)+"小时前";
            }
            if ((times/(1000*60*60))<=0&&times>0) {
                timeInterval=times/(1000*60)+"分钟前";
            }
            if (times<=0) {
                timeInterval="0分钟前";
            }
            discussPo.setTimeInterval(timeInterval);
        }
        return discussVos;
    }


    
    /** 
    * Title: findAllDiscussBythemeId
    * Description: 
    * @see com.yz.center.service.iface.discuss.DiscussService#findAllDiscussBythemeId(com.yz.center.model.vo.BaseConditionVO, java.lang.Integer)  
    */
    
    @Override
    public List<DiscussVo> findAllDiscussBythemeId(BaseConditionVO baseConditionVO, Integer themeId) {
        System.out.println(baseConditionVO.getEndIndex());
        List<DiscussVo> discussVos = discussDao.findAllDiscussBythemeId(baseConditionVO,themeId);
        //循环统计没想theme的品论数量
        for(int i = 0;i<discussVos.size();i++){
            Integer themeId2 = discussVos.get(i).getThemeId();
            Integer answerCount = discussDao.selecCount(themeId2);
            discussVos.get(i).setAnswerCount(answerCount);
        }   
        return discussVos;
    }


	@Override
	public Integer addDiscussTheme(DiscussThemePo discussThemePo) {
		Integer flag = discussDao.addDiscussTheme(discussThemePo);
		return flag;
	}


	@Override
	public List<DiscussThemePo> listDiscussTheme(PageBean pageBean) {
		Integer count = discussDao.getDiscussThemeCount(pageBean);
		pageBean.setTotalPage(count);
		List<DiscussThemePo> discussThemePos = discussDao.listDiscussTheme(pageBean);
		return discussThemePos;
	}


	@Override
	public Integer delDiscussTheme(Integer themeId) {
		Integer flag = discussDao.delDiscussTheme(themeId);
		return flag;
	}


	@Override
	public DiscussVo findDiscussThemebyId(Integer themeId) {
		DiscussVo discussThemePo = discussDao.findDiscussThemebyId(themeId);
		return discussThemePo;
	}


	@Override
	public Integer updataTheme(DiscussThemePo discussThemePo) {
		Integer flag = discussDao.updataTheme(discussThemePo);
		return flag;
	}


	@Override
	public Integer delMany(Integer[] themeIds) {
		Integer flag = 0;
		for(int i = 0;i<themeIds.length;i++){
			 flag = delDiscussTheme(themeIds[i]);
		}
		return flag;
	}

}
