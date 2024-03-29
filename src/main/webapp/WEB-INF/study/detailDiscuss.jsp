<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="nowDate" class="java.util.Date"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<link rel="stylesheet" type="text/css" href="${res}/student/css/layout.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<!--/js-->
</head>
<body>
<!--vip_top-->
<!-- <div class="vip_top">
   <div class="vip_top_box">
       <span>你好，亚卓大课堂同学！</span>
       <span class="top_link">
          <a href="###">消息</a>|<a href="###">个人收藏</a><a href="###">退出</a>
       </span>
   </div>
</div> -->
<!--/vip_top-->

<!--logoandnav-->
<div class="logoandnav">
  <div class="logoandnav_box">
     <div class="logo"><a href="###"><img src="${res}/student/img/logo.png" /></a></div>
     <ul class="vip_nav">
         <li><a href="${res}/study/personal.html" class="on">个人中心</a></li>
         <li><a href="${res}/main/index.html">平台首页</a></li>
     </ul>
  </div>
</div>
<!--/logoandnav-->

<!--主体部分-->
   <div class="main answer_questions_main">

    <!--left-->
       <div class="main_left">
           <!--tabs切换按钮-->
              <div class="answer_questions_content">
				<c:set var="themeId" value="${themeId}"></c:set>
               <!--区域1新提问-->
                  <div class="answer_questions_detailed detailed1" style="display:block;">
					<c:forEach items = "${requestScope.discussVos}" var = "list" varStatus="status">
                     <!--列表区域-->

                     <div class="li bg">
                     
                         <div class="face"><img src="${res}/student/img/test/18.jpg"></div>
                          <div class="li_right">
                              <div class="t">
                                 <h2>[新提问]${list.title}</h2>
                                 <p class="yp">${list.openCoursePo.courseName}</p>
                                 <c:set var = "createDate" value="${list.createDate}"></c:set>
                                 <c:set var="interval" value="${nowDate.time - createDate.time}"/>
                               
                                 <p class="times">
                                 <c:if test="${interval/1000/60<60}"><fmt:formatNumber type="number" value="${interval/1000/60}" pattern="#0"/>分钟前</c:if>
                                 <c:if test="${interval/1000/60>60&&interval/1000/60/60<24}"><fmt:formatNumber type="number" value="${interval/1000/60/60}" pattern="#0"/>小时前</c:if>
                                 <c:if test="${interval/1000/60/60>=24}"><fmt:formatNumber type="number" value="${interval/1000/60/60/24}" pattern="#0"/>天前</c:if>
                                 </p>
                                 <div class="huida_btn">回答(${list.answerCount})</div>
                              </div>

                              <div class="hide">
                              <div class="questions_detailed">
                                 ${list.title}
                              </div>

                              <!--评论-->
                                <div class="pinglun">
                                    <!--内容输入框-->
                                    <div class="tea">
                                       <textarea class="content${status.index}" placeholder="请输入您的讨论内容！"></textarea>
                                       <div class="tea_btn">
                                           <div class="shouqi">收起</div>
                                           <a class="btn2" onclick="add(${list.themeId},${status.index})">提交</a>
                                       </div>
                                    </div>
                                    <!--/内容输入框-->
                                    
                                    <div class="pinglun_list"  id="answer${list.themeId}" >
                                      <div class="pl_num" >总回答
                                     <%--  <c:if test="${list.answerCount>10}">10</c:if> --%>
                                      <%-- <c:if test="${list.answerCount<=10}">${list.answerCount}</c:if> --%>
                                      ${list.answerCount}
                                      	条</div>
                                      	 <c:forEach items = "${list.discussPos}" var = "list2" varStatus="status">
                                       <dl>
                                          <dt>
                                       		 <c:set var = "createDate2" value="${list2.createDate}"></c:set>
                                 			<c:set var="interval2" value="${nowDate.time - createDate2.time}"/>
                                 			<c:if test="${interval2<=0}">0分钟前</c:if>
                                 			
                                 			<c:if test="${interval2>0}">
                                 			<c:if test="${interval2/1000/60<60}"><fmt:formatNumber type="number" value="${interval2/1000/60}" pattern="#0"/>分钟前</c:if>
                                 			<c:if test="${interval2/1000/60>=60&&interval2/1000/60/60<24}"><fmt:formatNumber type="number" value="${interval2/1000/60/60}" pattern="#0"/>小时前</c:if>
                                 			<c:if test="${interval2/1000/60/60>=24}"><fmt:formatNumber type="number" value="${interval2/1000/60/60/24}" pattern="#0"/>天前</c:if>
                                 			</c:if>
                                          </dt>
                                          <dd class="facedd"><img src="${res}/student/img/test/14.jpg" /></dd>
                                          <dd class='txt'>${list2.content}</dd>
                                       </dl><!--单条数据-->
                                       </c:forEach>
                                       <center><a href="${res}/study/detailDiscuss.html?themeId=${list.themeId}&pageNum=${page.pageNum+1}"><c:if test="${list.answerCount>5}">更多</c:if></a></center>                                   
                                    </div>
                                </div>
                                <!--/评论-->
                              </div>
                          </div>
                     </div><!--单条数据-->
					</c:forEach>
                     
                     <!--/列表区域-->
                  </div>

                      <script type="text/javascript">
                  //滚动条美化
                  $(".detailed1").niceScroll({  
                    cursorcolor:"#7F7F7F",  
                    cursoropacitymax:1,  
                    touchbehavior:false,  
                    cursorwidth:"5px",  
                    cursorborder:"0",  
                    cursorborderradius:"5px"  
                  }); 
                </script>


              </div>
          <!--/列表区域-->
       </div>
   </div>
<!--/主体部分-->

<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->


</body>
<script type="text/javascript">
	function add(themeId,index){
		var content = $(".content"+index).val();
		$.ajax({
		  url:'${res}/study/addDiscussByThemeId.html',
          type:'post',
          contentType : "application/x-www-form-urlencoded",
          data:{
        	  themeId:themeId,
          	  content : content
          },
		success : function(data){
			var html="";
			if(data.flag=1){
             /* html+="<dl>";
             html+="<dt>0分钟前";
             html+="</dt>";
             html+="<dd class='facedd'><img src='${res}/student/img/test/14.jpg' /></dd>";
             html+="<dd class='txt'>"+content+"</dd>";
             html+="</dl>";
             $("#answer"+themeId).append(html) */
             
             window.location.href="${res}/study/detailDiscuss.html?themeId="+themeId;
			}
		}
		});
	}
	
</script>
</html>

   





























   



























