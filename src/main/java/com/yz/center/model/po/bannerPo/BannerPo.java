
/**    
* @Title: BannerPo.java
* @Package com.yz.center.model.po.bannerPo
* Description: TODO
* @author: 
* @date: 2017年2月28日 上午9:18:35 
* @version V1.0 
*   
*/  

package com.yz.center.model.po.bannerPo;

import java.io.Serializable;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年2月28日 上午9:18:35 
* @version V1.0   
*/
@Data
public class BannerPo{
  private Integer bannerId;
  private String title;
  private Integer schoolId;
  private String bannerUrl;
  private Integer state;
  



}