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
<link rel="stylesheet" type="text/css" href="${res}/student/css/paging.css">
<link rel="stylesheet" type="text/css" href="${res}/student/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/student/css/vip.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/student/js/paging.js"></script>
<!--/js-->
</head>
<body>
<!--个人中心栏目-->
<%@ include file="/WEB-INF/study/comm.jsp" %>
    
   <!-- 主体右边 -->
   <div class="mian_right minHeight500">
      <h2 class="main_right_h2">考试列表</h2>
      <div class="exam_ul_list">
      <c:forEach items="${page.list}" var="test" varStatus="status">
       <div class="li">
            <div class="img"><a href="###">
             <c:if test="${test.maxUrl != null}">
           	<img src="<%=url %>/${test.maxUrl }" alt="" />
           </c:if>
           <c:if test="${test.maxUrl  == null}">
           <img src="${res}/student/img/test/2.png">
           </c:if>
          
            </a></div>
              <div class="txt">
                <h2 class="h2">${test.courseName }</h2>
                <p class="times">最近参加考试时间：<em><fmt:formatDate value="${test.submitDate }" pattern="yyyy-MM-dd  HH:mm" /></em></p>
                <p class="grade">课程学分：<em>${test.studyScore }</em>分</p>
                <p class="grade">通过分数：<em>${test.score }</em>分</p>
                <p class="grade">及格分数：<em>${test.passScore}</em>分</p>
                <div class="alink">
                  <a  class="ywc" target="_blank">已参加考试</a></br></br></br></br></br>
                  <a  class="wwc" target="_blank" onclick="checkExamine(${test.paperId},${test.studentPaperId})">查看</a>              
                </div>
              </div>
          </div><!--单挑数据-->
      </c:forEach>
      </div>
                     <!--分页-->
    <div class="page2">
    <c:if test="${page.totalPage!=0}">
      <c:set var="pageNo" value="${page.pageNum}"></c:set>
         <c:if test="${page.pageNum==1}">
      <a class="disabled prev_page" >上一页</a>
       </c:if>
       <c:if test="${page.pageNum!=1}">
      <a href="${res}/student/test/toTestList.html?pageNum=${pageNo-1}" >上一页</a>
       </c:if>
      <c:forEach var = "pageNow" begin="1" end="${page.totalCount}" step="1">
       <c:if test="${pageNow==pageNo}"><span>${pageNow}</span></c:if>
       <c:if test="${pageNow!=pageNo}"><a class="paginItem" href="${res}/student/test/toTestList.html?pageNum=${pageNo}">${pageNo}</a></c:if>
      </c:forEach>
      <c:if test="${pageNum==pageNow}">
      <a class="disabled prev_page" >下一页</a>
       </c:if>
       <c:if test="${pageNum!=pageNow}">
      <a href="${res}/student/test/toTestList.html?pageNum=${pageNo+1}">下一页</a>
       </c:if>
       </c:if>
      
       <c:if test="${page.totalPage==0}">
       <div class="text" style=" text-align:center;font-size:20px">暂无已完成考试</div>
       </c:if>
    
</div>
<!--main-->
     </div>
</div>
<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->
<script>
function checkExamine(paperId,studentPaperId){
	 var   targeturl="${res }/student/test/checkExamine.html?paperId="+paperId+"&studentPaperId="+studentPaperId; 
	  var tmp=window.open("about:blank","","fullscreen=1");
	    tmp.moveTo(0,0);
	    tmp.resizeTo(screen.width+20,screen.height);
	    tmp.focus();
	    tmp.location=targeturl;
}
</script>
</body>
</html>

   



























