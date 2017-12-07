package com.yz.center.util.other;

import java.util.Random;

/**  
* @Description: 生成验证码
* @author: 
* @date: 2017年1月7日 下午5:39:39 
* @version V1.0   
*/
public class Yzm {
	 
	static char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',         
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',         
            'X', 'Y', 'Z' };   

	
	/**   
	* @Title: initVerify
	* @Description: 生成随机验证码
	* @return 验证码字符串
	* @author:
	*/
	public static String initVerify() {
			Random random = new Random(); // 生成随机类  
			String sRand ="";
		         for (int i = 0; i < 6; i++) {  
	             String tempRand = "";  
		             if (random.nextBoolean()) {  
	                 tempRand = String.valueOf(random.nextInt(10));  
		            } else {  
	                 tempRand = String.valueOf(codeSequence[random.nextInt(25)]);  
		                if (random.nextBoolean()) {// 随机将该字母变成小写  
	                   tempRand = tempRand.toLowerCase();  
		               }  
		            }  
		            sRand+=tempRand;
		         }

		return sRand;
		
	}
}
