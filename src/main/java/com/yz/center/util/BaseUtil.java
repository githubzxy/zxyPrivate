package com.yz.center.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.hitb.util.HITBUtils;
public class BaseUtil {

	private static final Log logger = LogFactory.getLog(BaseUtil.class);

	/*
	 * 用户签证信息
	 */

	public static final String USER_TICKET_KEY = "USERTICKETKEY";

	/**
	 * 记录资源文件最后读取时间的集合对象
	 */
	private static Map<String, Long> s_mapPropertyTime = new HashMap<String, Long>();

	private static final String STRING_PROPERTY_PROP = "prop.properties";

	private static final int INT_UNNECESSARY = -1;
	private static final long LONG_UNNECESSARY = -1L;

	/**
	 * 记录 prop.properties 资源文件的内容集合
	 */
	private static Map<String, String> s_mapProperties = new HashMap<String, String>();

	/**
	 * 检查对象是否为空
	 * 
	 * @param pObj
	 * @return boolean(空返回true,非空返回false)
	 */
	public static boolean isEmpty(Object pObj) {
		if (null == pObj || "".equals(pObj))
			return true;

		return false;
	}

	/**
	 * 判断数字是否可用(-1不可用,非-1可用)
	 * 
	 * @param piNumber
	 * @return boolean(可用返回true,不可用返回false)
	 */
	public static boolean isNecessaryNumber(int piNumber) {
		if (piNumber != INT_UNNECESSARY)
			return true;

		return false;
	}

	/**
	 * 判断数字是否可用(-1不可用,非-1可用)
	 * 
	 * @param plNumber
	 * @return boolean(可用返回true,不可用返回false)
	 */
	public static boolean isNecessaryNumber(long plNumber) {
		if (plNumber != LONG_UNNECESSARY)
			return true;

		return false;
	}

	/**
	 * 检查字符串是否为空
	 * 
	 * @param psValue
	 * @return boolean(空返回true,非空返回false)
	 */
	public static boolean isEmpty(String psValue) {
		if (null == psValue || psValue.trim().length() == 0
				|| ("null").equals(psValue))
			return true;

		return false;
	}

	/**
	 * 检查List是否为空
	 * 
	 * @param plstObj
	 * @return boolean(空返回true,非空返回false)
	 */
	@SuppressWarnings("unchecked")
	public static boolean isEmpty(List plstObj) {
		if (null == plstObj || plstObj.size() == 0)
			return true;

		return false;
	}

	/**
	 * 检查Map是否为空
	 * 
	 * @param pmapObj
	 * @return boolean(空返回true,非空返回false)
	 */
	@SuppressWarnings("unchecked")
	public static boolean isEmpty(Map pmapObj) {
		if (null == pmapObj || pmapObj.size() == 0)
			return true;

		return false;
	}
	
	private static final String SIZE_MIN = "字节" ;
	private static final String SIZE_KB = "KB" ;
	private static final String SIZE_MB = "MB" ;
	private static final String SIZE_GB = "GB" ;
	
	public static String getShowSize(long fileSize) {
		if(fileSize<1000) {
			return fileSize + SIZE_MIN ;
		} else if(fileSize < 1000*1000) {
			return fileSize / 1000 + SIZE_KB ;
		} else if(fileSize < 1000 * 1000 * 1000)
			return fileSize / (1000 * 1000) + SIZE_MB ;
		else if(fileSize < 1000 * 1000 * 1000 * 1000) {
			return fileSize / (1000 * 1000 * 1000) + SIZE_GB ;
		} else {
			return "大于1GB" ;
		}
	}

	/**
	 * 读取资源文件
	 * 
	 * @param psPropertyFilePath
	 * @return Map<String, String>
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> getValuesFromPropertyFile(
			String psPropertyFilePath) {
		if (HITBUtils.isEmpty(psPropertyFilePath)) {
			logger.error("要读取内容的properties文件名为空，程序终止！");
			return null;
		}

		// 得到 prop.properties 文件最后修改时间
		long lTime = getLastTimeByProperty();
		if (!HITBUtils.isEmpty(s_mapPropertyTime.get(STRING_PROPERTY_PROP))) {
			Long lCachedLastTime = s_mapPropertyTime.get(STRING_PROPERTY_PROP);
			if (lTime == lCachedLastTime.longValue())
				return s_mapProperties;
		}

		s_mapPropertyTime.put(STRING_PROPERTY_PROP, lTime);
		Properties prop = new Properties();
		InputStream in = BaseUtil.class.getResourceAsStream("/ftp/"
				+ STRING_PROPERTY_PROP);
		try {
			prop.load(in);
			Iterator<String> it = (Iterator<String>) prop.propertyNames();
			if (HITBUtils.isEmpty(it)) {
				System.out.println("prop.properties 资源文件中内容为空，程序终止！");
				return null;
			}

			while (it.hasNext()) {
				String sKey = (String) it.next();
				String sValue = prop.getProperty(sKey);
				s_mapProperties.put(sKey, sValue);
			}

			return s_mapProperties;
		} catch (IOException e) {
			System.out.println("读取 prop.properties 资源文件时出现异常，请检查文件位置是否正确！");
			return null;
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 得到 prop.properties 文件的最后修改时间
	 * 
	 * @return long
	 */
	private static long getLastTimeByProperty() {
		String sPath = getPathByClassLoader();
		if (HITBUtils.isEmpty(sPath))
			return -1;

		String sPropertyFilePath = sPath + STRING_PROPERTY_PROP;
		File file = new File(sPropertyFilePath);
		if (HITBUtils.isEmpty(file)) {
			logger.error(STRING_PROPERTY_PROP + " 资源文件不存在，请检查文件位置，程序终止！");
			return -1;
		}

		return file.lastModified();
	}

	/**
	 * 得到Classpath路径
	 * 
	 * @return
	 */
	private static String getPathByClassLoader() {
		String sPath = Thread.currentThread().getContextClassLoader()
				.getResource("").getPath();

		if (sPath.startsWith("\\"))
			;
		sPath = sPath.substring(1);

		return sPath;
	}

	/**
	 * 读取prop.properties资源文件中的Key值
	 * 
	 * @param psPropertyFilePath
	 * @return Map<String, String>
	 */
	public static String getValueFormProperties(String key) {
		String sPropertyFilename = STRING_PROPERTY_PROP;
		Map<String, String> map = getValuesFromPropertyFile(sPropertyFilename);
		return map.get(key);
	}

	/**
	 * @param reqeust &
	 *            value & age 实现增加COOKIE
	 */
	public static void setCookie(HttpServletResponse response,
			String cookieName, String value, int age) {
		String cookieDomain = getValueFormProperties("cookieDomain");
		String[] cookieD = cookieDomain.split(",");
		for (int i = 0; i < cookieD.length; i++) {
			Cookie cookie = new Cookie(cookieName, value);
			cookie.setMaxAge(age);
			cookie.setPath("/");
			cookie.setDomain(cookieD[i]);
			response.addCookie(cookie);
		}
	}
	
	/**
	 * 会话COOKIE
	 */
	public static void setCookie(HttpServletResponse response,
			String cookieName, String value) {
		String cookieDomain = getValueFormProperties("cookieDomain");
		String[] cookieD = cookieDomain.split(",");
		for (int i = 0; i < cookieD.length; i++) {
			Cookie cookie = new Cookie(cookieName, value);
			cookie.setPath("/");
			cookie.setDomain(cookieD[i]);
			response.addCookie(cookie);
		}
	}

	/**
	 * @param reqeust
	 *            实现获得COOKIE
	 */
	public static String getTicket(HttpServletRequest request, String cookieName) {
		String ticket = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equalsIgnoreCase(cookieName)) {
					ticket = cookies[i].getValue();
					break;
				}
			}
		}
		return ticket;
	}

	/**
	 * @param str &
	 *            flex 实现规则字符串向MAP转换，如：a=b , b=c ,
	 */
	public static HashMap<String, String> convertStr2Map(String str, String flex) {
		HashMap<String, String> map = new HashMap<String, String>();
		try {
			String[] array = str.split(flex);
			for (int i = 0; i < array.length; i++) {
				String[] code = array[i].split("=");
				map.put(code[0], code[1]);
			}
		} catch (Exception e) {
			return null;
		}
		return map;
	}

	/**
	 * @param response &
	 *            str 实现PrintWriter的字符串输出
	 */
	public static void writerStringFromResponse(HttpServletResponse response,
			String str) {
		try {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(str);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * @param 是否等于0
	 */
	public static boolean equalZero(int param) {
		boolean falg = false;
		if (param == 0 || param - 0 == 0) {
			falg = true;
		}
		return falg;
	}

	/**
	 * 去除空格,换行
	 * 
	 * @param psValue
	 * @return
	 */
	public static String transNoBlank(String psValue) {
		Pattern p = Pattern.compile("\\s*|\t|\r|\n");
		Matcher m = p.matcher(psValue);
		String sNoBlank = m.replaceAll("");
		return sNoBlank;
	}
	
	/**
	 * 处理字符（用于以正常格式显示文本内容）
	 * @param pstrContent
	 * @return
	 */
	public static String toHTMLString(String pstrContent) {
		StringBuffer out = new StringBuffer();
		for (int i = 0; pstrContent != null && i < pstrContent.length(); i++) {
			char c = pstrContent.charAt(i);
			if (c == '\'')
				out.append("&#039;");
			else if (c == '\"')
				out.append("&#034;");
			else if (c == '<')
				out.append("&lt;");
			else if (c == '>')
				out.append("&gt;");
			else if (c == '&')
				out.append("&amp;");
			else if (c == ' ')
				out.append("&nbsp;");
			else if (c == '\n')
				out.append("<br>");
			else
				out.append(c);
		}
		return out.toString();
	}
	
}