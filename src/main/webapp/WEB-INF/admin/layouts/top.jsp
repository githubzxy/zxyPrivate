<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){	
	var url = $("#checkId").val()
	window.parent.leftFrame.location.href ="/admin/nav/"+url+".html";
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>

</head>
<body style="background:url(${res}/images/topbg.gif) repeat-x;">
<input type="hidden" value="${f }" id="checkId">
    <div class="topleft">
    <a href="main.html" target="_parent"><img src="${res}/images/logo.png" title="系统首页" /></a>
    </div>
    <ul class="nav">
   <%--  <li><a href="/main/index.html" target="true" class="selected"><img src="${res}/images/ico01.png" title="系统首页" /><h2>系统首页</h2></a></li> --%>
    <c:forEach var="nav" items="${navs }">
    	<li><a href="${nav.url }" id="teacher" target="leftFrame"><img src="${res}${nav.ico}" title="${nav.conName }" /><h2>${nav.conName }</h2></a></li>
    </c:forEach>
    </ul>
            
   <div class='yazhuo_right'>
     	<div class='yazhuo_w'>
     		<div class="yazhuo_adminuser">
     		<c:choose>
   				<c:when test="${sessionScope.baseUser.roleCode=='super'}">
		               超级管理员  
 				 </c:when>
				<c:when test="${sessionScope.baseUser.roleCode=='admin'}">  
		               管理员
 				 </c:when>
 				 <c:when test="${sessionScope.baseUser.roleCode=='teacher'}">  
		               教师
 				 </c:when>
 				  <c:otherwise> 
 				  	试用账号
 				  </c:otherwise>
			</c:choose></div>
     		<div class="yazhuo_zhanghao">${sessionScope.baseUser.name }</div>
     	</div>
     	<ul class="yazhuo_top_menu">
     		<li class="li1"><a href="/main/index.html" title="系统首页" target="true">系统首页</a></li>
     		<li class="li2"><a href="${res}/excel/yazhuo20171103.pdf" target="true" title="点击下载操作手册" >帮助</a></li>
      		<li class="li3"><a href="${res}/admin/login/logout.html" target="_parent">退出</a></li>	
     	</ul>
     </div>    
    </div>
</body>
</html>
