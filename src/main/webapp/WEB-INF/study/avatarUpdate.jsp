<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
<title>个人中心-亚卓数字教学中心</title>
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/student/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/student/css/vip.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<!--/js-->
</head>
<body>
<!--个人中心栏目-->
<%@ include file="/WEB-INF/study/comm.jsp" %>
<!--/个人中心栏目-->
    
   <!-- 主体右边 -->
   <div class="mian_right minHeight500">
      <h2 class="main_right_h2">修改头像</h2>
      <div class="exam_ul_list">
          

          
      </div>
       
   </div>
   <!-- 主体右边 end -->
    
</div>
<!--main-->

<!--footer-->
<div class="div100 footer">
   <div class="flogo">
      <img src="${res}/student/img/flogo.gif" class="ftlogo"/>
      <div class="ft_icon">
           <a href="#" class="qq"></a>
           <a href="#" class="wechat">
             <div class="gwxLi">
                   <img class="gwxli_img" src="${res}/student/img/icon/b_icon.png">
              </div>
           </a>
           <a href="#" class="tel"></a>
      </div>
      <div class="servicetel">
         <div class="telnum">
           400-0867-229
           <span class="time">(工作日：9:00-17:30)</span>
        </div>
      </div>
   </div>
   <div class="copyright">
     <div class="w1200">
        <div class="yqlink">
           <em class="bt">友情链接：</em>
           <a href="#">亚卓官网</a><a href="#" class="b_r">亚卓数字教学中心</a>
        </div>
        <p class="copyr">北京亚卓教育科技有限公司 Copyright &copy;2016 亚卓教育 All RIGHTS RESERVED. 蜀ICP备13026910号-1 </p>
        <div class="link">
           <a href="javascript:alert('北京亚卓教育科技有限公司（400-0867-229、成都研发中心 028-68730625）');">联系我们</a>
           <a href="javascript:alert('维护升级中！');">法律条款</a>
           <a href="javascript:alert('维护升级中！');" class="b_r">意见反馈</a>
       </div>
     </div>
   </div>
</div>
<!--footer-->
</body>
</html>

   


























