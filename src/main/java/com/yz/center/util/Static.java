/**
  * @FileName: Static.java
  * @Author 
  * @Description:
  * @Date 2016年6月30日 上午11:40:12
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.util;

public class Static{

    public static final String WELCOM_PAGE="http://localhost:8080/center_zz/";
    public static final String UPLOAD_HOME="UPLOAD_HOME";
    
    public final static  String UPLOAD_PATH_ROOT;
    
    static {
      //  UPLOAD_PATH_ROOT=new EnvRoot().getenv(UPLOAD_HOME, "")+"/webapps/learn_upload";
      UPLOAD_PATH_ROOT = "/Users/jettang/Desktop/code/workspace/.metadata/.me_tcat/ROOT";
    }
    //业务常量
    public static final String SCHOOL_ID = "schoolId" ;
    public static final String COURSE_ID = "courseId";
    
    /**  
    * SCHOOL_SESSION : 用于学校信息缓存
    */  
    public static final String SCHOOL_SESSION = "schoolSession";
    
    /**  
    * LOGIN_USER_SESSION : 用于登录用户信息缓存
    */  
    public static final String LOGIN_USER_SESSION = "baseUser";
    
    /**  
    * VERIFY_SESSION : 用于验证码缓存
    */  
    public static final String VERIFY_SESSION = "code";
    
    //文件分隔符
    public static final String SLASH = "/" ;
    
    public static final String FLAG = "flag";
    
    public static final String ROLE = "role";
    
    public static final String SCHOOLPO="SchoolPo";
    
    public static final String USERPO="UserPo";
    
    public static final String STUDENT_ROLE_ID="student_role_id";
    
    public static final String FTP_AVAILABLE="ftpAvailable";
    
    public static final Integer MIN_WIDTH=400;
    
    public static final Integer MIDDLE_WIDTH=600;
    
}
