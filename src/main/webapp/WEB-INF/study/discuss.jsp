<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      <h2 class="main_right_h2">我的讨论</h2> 
	       <div class="exam_ul_list ducess">
	       <c:forEach items = "${requestScope.discussPos}" var = "list" varStatus="status">
	        <div class="lili">
	           <div class="little"><span>${status.index+1+(page.pageNum-1)*page.pageSize}</span>${list.discussThemePo.title}</div>
		           <div class="myanwer">
		              <span>我的答案：</span>${list.content}
		              <p class="timer">时间：<fmt:formatDate type="both" 
	            						dateStyle="short" timeStyle="short" 
	           					 		value="${list.discussThemePo.createDate}" /></p>
		           </div>
	        </div><!--单条数据-->
	        
       </c:forEach>
   
     	</div>
       <!--分页-->
           <div class="page2" style="margin-top:30px;">
           <c:set var="pageNum" value="${requestScope.page.pageNum}"></c:set>
            <c:set var="pageCount" value="${requestScope.page.pageCount}"></c:set>
                   <a href="
                   	<c:if test="${pageNum>1}">${res}/study/myDiscuss.html?pageNum=${pageNum-1}</c:if>
			<c:if test="${pageNum<=1}">${res}/study/myDiscuss.html?pageNum=1</c:if>
                   " >上一页</a>
                   <c:forEach var = "i" begin="1" end="${requestScope.page.pageCount}" step="1">
                   		<c:if test="${i==pageNum}"><span>${i}</span></c:if>
                   		<c:if test="${i!=pageNum}"><a class="paginItem" href="${res}/study/myDiscuss.html?pageNum=${i}">${i}</a></c:if>
                   </c:forEach>
                   <a href="
                   <c:if test="${pageNum<pageCount}">${res}/study/myDiscuss.html?pageNum=${pageNum+1}</c:if>
		 <c:if test="${pageNum>=pageCount}">${res}/study/myDiscuss.html?pageNum=${pageCount}</c:if>
                   ">下一页</a>
               </div>
     <!--/分页-->
   </div>
   <!-- 主体右边 end -->
    
</div>
<!--main-->

<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->
</body>
</html>

   



























