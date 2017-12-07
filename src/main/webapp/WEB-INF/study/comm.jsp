<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<div class="logoandnav">
	<div class="logoandnav_box">
		 <div class="logo"><a href="###"><img src="${res}/front/images/newlogo2.png" /></a></div>
		 <ul class="vip_nav">
		     <li><a href="${res}/study/personal.html" class="on">个人中心</a></li>
		     <li><a href="${res}/main/index.html">平台首页</a></li>
		 </ul>
	</div>
</div>
<!--/logoandnav-->
<!--main-->
<div class="main">
   <!--vip_left-->
   <div class="vip_left">
   	  <div class="vip_face">
   	      <div class="img" ><img src="<%=url %>/${sessionScope.baseUser.avatar}" style="border-radius:50%; background:#eff;"  /></div>
   	      <div class="name">${sessionScope.baseUser.name}</div>
   	  	  <div class="tool"><a href="">消息</a>&nbsp;&nbsp;<a href="${res }/admin/login/logout.html">退出</a></div>
   	  </div><!--头像-->

      <!--个人中心栏目-->
   	  <dl class="vip_left_nav">
   	  	 <dt class="l1">我的书桌</dt>
   	  	 <dd>
   	  	 	 <ul>
   	  	 	     <li><a href="${res}/study/toSelectedCourse.html">已选课程</a></li>
   	  	 	 	 <li><a href="${res}/study/toNoselectedcourse.html">我要选课</a></li>
   	  	 	 	 <li><a href="${res}/study/myDiscuss.html">我的讨论</a></li>
             <li><a href="${res}/study/toDisCenter.html" target="_blank">讨论中心</a></li>
   	  	 	 </ul>
   	  	 </dd>
   	  </dl><!--单条-->

   	  <dl class="vip_left_nav">
   	  	 <dt class="l2">我的作业</dt>
   	  	 <dd>
   	  	 	 <ul>
   	  	 	 	 <li><a href="${res}/work/getHomeWork.html">作业列表</a></li>
   	  	 	 	
   	  	 	 </ul>
   	  	 </dd>
   	  </dl><!--单条-->

   	  <dl class="vip_left_nav">
   	  	 <dt class="l3">考试中心</dt>
   	  	 <dd>
   	  	 	 <ul>
   	  	 	 	 <li><a href="${res}/student/test/toMyTest.html">我的考试</a></li>
   	  	 	 	 <li><a href="${res}/student/test/toTestList.html">考试列表</a></li>
   	  	 	 </ul>
   	  	 </dd>
   	  </dl><!--单条-->

   	  <dl class="vip_left_nav">
   	  	 <dt class="l4">学习成果</dt>
   	  	 <dd>
   	  	 	 <ul>
   	  	 	 	 <li><a href="${res}/study/toPassCourse.html">通过的课程</a></li>
   	  	 	 	 <li><a href="${res}/study/toUnpassCourse.html">未通过课程</a></li>
   	  	 	 	 <li><a href="${res}/pro/list.html">学习进度</a></li>
   	  	 	 </ul>
   	  	 </dd>
   	  </dl><!--单条-->

   	  <dl class="vip_left_nav">
   	  	 <dt class="l5">我的设置</dt>
   	  	 <dd>
   	  	 	 <ul>
   	  	 	 	 <li><a href="${res}/study/toPersonalInfo.html">查看资料</a></li>
   	  	 	 	 <li><a href="${res}/study/toPwdUpdate.html">修改密码</a></li>
   	  	 	 </ul>
   	  	 </dd>
   	  </dl><!--单条-->

   	  <!--/个人中心栏目-->
   </div>