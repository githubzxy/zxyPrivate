<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--top-->
<div class="div100 top">
  <div class="w1200 header">
     <h1 class="logo fl"><a href="#"><img src="<%=url %>/${sessionScope.schoolSession.logo}" alt="亚卓教育" /></a></h1>
     <div class="navwrap fr">
       <ul class="nav fl">
          <li><a href="${res}/" title="首页">首页</a></li>
          <li class="on"><a href="${res}/main/category.html" title="在线学习" >在线学习</a></li>
          <c:choose>
          	<c:when test="${sessionScope.baseUser == null}">
          		<li><a onClick="javascript:$('#tclogin').click();" title="课程建设">课程建设</a></li>
	          <li><a onClick="javascript:$('#tclogin').click();" title="教学资源">教学资源</a></li>
	          <li><a onClick="javascript:$('#tclogin').click();" title="教学管理">教学管理</a></li>
          </c:when>
          	<c:when test="${sessionScope.baseUser.roleCode == 'student'}">
          		<!-- <li><a href="javascript:layer.alert('没有权限');" title="课程建设">课程建设</a></li>
	          <li><a href="javascript:layer.alert('没有权限');" title="教学资源">教学资源</a></li>
	          <li><a href="javascript:layer.alert('没有权限');" title="教学管理">教学管理</a></li> -->
	          <li><a href="${res}/study/personal.html" title="个人中心">个人中心</a></li>
          	</c:when>
          	<c:otherwise>
	          <li><a href="${res}/admin/index.html?rels=course" title="课程建设">课程建设</a></li>
	          <li><a href="${res}/admin/index.html?rels=resource" title="教学资源">教学资源</a></li>
	          <li><a href="${res}/admin/index.html?rels=teacher" title="教学管理">教学管理</a></li>
          	</c:otherwise>
          </c:choose>
       </ul>
       <div class="fr index_right">
        <div class="csearch">
            <div class="search-wrapper">
                <div class="input-holder">
                <form action="${res}/course/open/findIndexOpencourse.html">
                 	<input type="hidden" name="pageSize" value="6"  class="input-text"/>
                    <input type="text" name="keywords" class="search-input" placeholder="亲，想搜点啥!" />
                    <button type="submit" class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                    </form>
                </div>
            </div>
        </div>
        <div class="indexlogin fr">
           <div class="tclogin-index">
           		<c:choose>
            	<c:when test="${sessionScope.baseUser!=null}">
		            	<div class="header-pic-logout">
			            	<%-- <img src="${res}/front/images/test/2P.png" class="picheader" /> --%>
			            	<c:if test="${sessionScope.baseUser.avatar!=null&&sessionScope.baseUser.avatar!=''}">
			            	<img src="<%=url%>/${sessionScope.baseUser.avatar}" class="picheader" />
			            	</c:if>
			            	<c:if test="${sessionScope.baseUser.avatar==null||sessionScope.baseUser.avatar==''}">
			            	<img src="${res}/front/images/teacherAvatar.png" class="picheader" />
			            	</c:if>
			            	<div class="drapmenuindex">
			            	   <b>${sessionScope.baseUser.name}</b><c:if test="${sessionScope.baseUser.roleCode=='teacher'}">老师</c:if>,欢迎您！
			            	   <p class="tool-p">
			            	     <a href="${res}/admin/login/logout.html" class="dl logout">退出</a>
			            	   </p>
			            	</div>
		            	</div>
            	</c:when>
            	<c:otherwise>
            		 <a href="javascript:void();" id="tclogin" class="dl btn">登录</a>
          		</c:otherwise>
          </c:choose>
           
           </div>
           <!-- 这里缺弹框 做这个功能时 联系前端人员 -->
        </div>
       </div>
     </div>
  </div>
</div>
<!--top-->