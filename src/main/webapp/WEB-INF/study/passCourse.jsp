<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
<title>vip个人中心</title>
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
      <h2 class="main_right_h2">通过的课程</h2>
      <div class="exam_ul_list">
      
         <c:forEach items = "${requestScope.studentCourseVos3}" var = "list" varStatus="status">
          <div class="li">
                 <div class="img"><a href="###">
             <c:if test="${list.coverPo.maxUrl != null}">
           	<img src="<%=url %>/${list.coverPo.maxUrl }" alt="" />
           </c:if>
           <c:if test="${list.coverPo.maxUrl  == null}">
           <img src="${res}/student/img/test/2.png">
           </c:if>
            </a></div>
              <div class="txt">
                <h2 class="h2">${list.openCourseName}</h2>
                <p class="times">考试时间：<em>
                <fmt:formatDate pattern="yyyy-MM-dd" 
            				value="${list.exameStartTime}" ></fmt:formatDate>
                ----<fmt:formatDate pattern="yyyy-MM-dd" 
            				value="${list.exameEndTime}" ></fmt:formatDate>
            				
            				</em></p>
                <p class="grade">课程学分：<em>${list.studyScore}</em>分</p>
                <p class="grade">考试次数：<em>${list.exameCount}</em>次</p>
                <div class="alink">
                  <div><span class="score_num"><fmt:formatNumber type="number" value="${list.myFinalScore}" pattern="0.0" maxFractionDigits="1"/> </span><span class="score_sco">分</span></div> 
                  <div><span class="courseSituation isOk">已通过</span></div>            
                </div>
              </div>
          </div><!--单挑数据-->
          </c:forEach>
	
    <c:if test="${requestScope.page.pageCount==0}"> 
    <div class="text" style=" text-align:center;font-size:20px">暂无通过的课程</div>
    </c:if>      
      </div>
        <!--分页-->
        <c:if test="${requestScope.page.pageCount!=0}"> 
    <div class="page2">
      <c:set var="pageNum" value="${requestScope.page.pageNum}"></c:set>
      <a href="
      <c:if test="${pageNum>1}">${res}/study/toPassCourse.html?pageNum=${pageNum-1}</c:if>
      <c:if test="${pageNum<=1}">${res}/study/toPassCourse.html?pageNum=1</c:if>
      " >上一页</a>
      
      <c:forEach var = "i" begin="1" end="${requestScope.page.pageCount}" step="1">
                             		<c:if test="${i==pageNum}"><span>${i}</span></c:if>
                             		<c:if test="${i!=pageNum}"><a class="paginItem" href="###">${i}</a></c:if>
      </c:forEach>
      <a href="
      <c:if test="${pageNum<pageCount}">${res}/study/toPassCourse.html?pageNum=${pageNum+1}</c:if>
      <c:if test="${pageNum>=pageCount}">${res}/study/toPassCourse.html?pageNum=${pageCount}</c:if>
      ">下一页</a>
    </div>
    <!--/分页-->
    </c:if>
   </div>
   <!-- 主体右边 end -->
    
</div>
<!--main-->

<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->
</body>
<script type="text/javascript">
$(".paginItem").click(function(){
	var pageNum = $(this).text();
	window.location.href="${res}/study/toUnpassCourse.html?pageNum="+pageNum;
})
</script>
</html>

   



























