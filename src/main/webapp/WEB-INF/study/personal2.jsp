<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>

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
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<!--/js-->
</head>
<body>
<%@ include file="/WEB-INF/study/comm.jsp" %>
   <!--/vip_left-->

   <!--vip_center-->
   <div class="vip_center">
         <!--图片文字导航-->
      	 <ul class="pic_nav">
      	 	<li>
      	 	  <a href="作业列表.html">
	              <div class="img"><img src="${res}/student/img/c2.png"></div>
	              <div class="jianhao ar">4</div>
	              <div class="title_l">我的作业</div>
              </a>
            </li><!--单条-->

            <li>
      	 	  <a href="作业列表.html">
	              <div class="img"><img src="${res}/student/img/c2.png"></div>
	              <div class="jianhao ar">15</div>
	              <div class="title_l">课堂作业</div>
              </a>
            </li><!--单条-->

            <li>
      	 	  <a href="我的考试.html">
	              <div class="img"><img src="${res}/student/img/c3.png"></div>
	              <div class="jianhao ar">15</div>
	              <div class="title_l">我的考试</div>
              </a>
            </li><!--单条-->

            <li>
      	 	  <a href="通过的课程.html">
	              <div class="img"><img src="${res}/student/img/c4.png"></div>
	              <div class="jianhao ar">1</div>
	              <div class="title_l">成绩查询</div>
              </a>
            </li><!--单条-->

            <li>
      	 	  <a href="学习进度.html">
	              <div class="img"><img src="${res}/student/img/c5.png"></div>
	              <div class="jianhao ar">15</div>
	              <div class="title_l">学习进度</div>
              </a>
            </li><!--单条-->
      	 </ul>
      	 <!--图片文字导航-->

      	 <!--其他动态-->
            <div class="vip_common_box vip_class_resource_box">
            	 <!--标题-->
               <div class="vip_class_resource_title">
                   <span class="on">我要选课</span>
                   <span>已选课程</span>
                   <!-- <a href="###" class="xuanke">选课</a> -->
               </div>
               <!--/标题-->

               <!--列表(我要选课)-->
                  <div class="class_resource" id="onSelected">
                  		<div class="vip_shuaixuan" >
                        <dl style="margin-top:10px;">
                          <dt style="margin:0;">课程名称：</dt>
                          <dd>
                            <input class="text" id="anotherKeyWords" name="keywords" value="请输入课程关键词" onfocus="if(this.value=='请输入课程关键词'){this.value=''}" onblur="if(this.value==''){this.value='请输入课程关键词'}" type="text">
                            <a href="" class="btn1 btn2">查询</a>
                          </dd>
                       </dl>
                       </div>
                       <%-- <c:forEach items = "${requestScope.openCourseVos2}" var = "list" varStatus="status">
                       		<div class="li">
                          <div class="img"><a href="###"><img src="${res}/student/img/test/2.png" /></a></div>
                          <div class="txt">
                           <h2>${list.courseName}</h2>
                           <p>讲师：${list.lecturerName }</p>
                           <p>课时：<font class="ar">${list.classhour}</font>课时</p>
                            <div class="alink">
                                <a href="javascript:alert('成功加入课程');" class="l">我要学习</a>
                                <a href="${res}/main/toChapter.html?openId=${list.openId}" class="r">查看课程</a>
                             </div>
                           </div>
                       </div><!--单条数据-->
                       </c:forEach> --%>
    <!--分页-->
    <div class="page2">
      <%-- <c:set var="pageNum" value="${requestScope.page2.pageNum}"></c:set>
      <c:set var="pageCount" value="${requestScope.page2.pageCount}"></c:set>
      <a href="
      <c:if test="${pageNum>1}">${res}/study/toNoselectedcourse.html?pageNum=${pageNum-1}</c:if>
      <c:if test="${pageNum<=1}">${res}/study/toNoselectedcourse.html?pageNum=1</c:if>
      ">上一页</a>
     <c:set var="pageNum" value="${requestScope.page2.pageNum}"></c:set>
      <c:forEach var = "i" begin="1" end="${requestScope.page2.pageCount}" step="1">
                             		<c:if test="${i==pageNum}"><span>${i}</span></c:if>
                             		<c:if test="${i!=pageNum}"><a class="paginItem" href="###">${i}</a></c:if>
      </c:forEach>
      <a href="
      <c:if test="${pageNum<pageCount}">${res}/study/toNoselectedcourse.html?pageNum=${pageNum+1}</c:if>
      <c:if test="${pageNum>=pageCount}">${res}/study/toNoselectedcourse.html?pageNum=${pageCount}</c:if>
      ">下一页</a> --%>
    </div>
    <!--/分页-->
        </div>
               <!--列表-->


               <!--列表(我的课程)-->
                  <div class="class_resource resource" id="selectCourse" style="display:none;">
                       <!--已选课程-->
                       <div class="vip_shuaixuan">
                        <dl style="margin-top:10px;">
                          <dt style="margin:0;">课程名称：</dt>
                          <dd>
                            <input class="text" value="请输入课程关键词" onfocus="if(this.value=='请输入课程关键词'){this.value=''}" onblur="if(this.value==''){this.value='请输入课程关键词'}" type="text">
                            <a href="###" class="btn2 btn3">查询</a>
                          </dd>
                       </dl>
                       </div>
                   <!--/已选课程-->

						 <c:forEach items = "${requestScope.openCourseVos}" var = "list" varStatus="status">
                       	<div class="li">
                          <div class="img"><a href="###"><img src="${res}/student/img/test/2.png" /></a></div>
                          <div class="txt">
                           <h2>${list.courseName}</h2>
                           <c:set var="testStr"  value="${list.courseInfo}"/>
                          <p>
                          <c:choose>  
							    <c:when test="${fn:length(testStr) > 40}">  
							        <c:out value="${fn:substring(testStr, 0, 40)}......" />  
							    </c:when>  
							   <c:otherwise>  
							      <c:out value="${testStr}" />  
							    </c:otherwise>  
						  </c:choose>  
                          
                          </p>                          
                            <div class="alink">
                                <a href="学生查看视频.html" class="l">继续学习</a>
                                <a href="javascript:alert('成功退选课程');" class="r">退选课程</a>
                                <span>已学<font class="ar1">0</font>章节/<font class="ar1">15</font>章</span>
                                <span><font class="ar"><fmt:formatDate pattern="yyyy-MM-dd" 
            											value="${list.createDate}" /></font></span>
                             </div>
                           </div>
                       </div><!--单条数据-->
                       </c:forEach>
                            
                       <!--分页-->
                       <div class="page2">
                         <a href="###">上一页</a>
                         <a href="###">1</a>
                         <span>2</span>
                         <a href="###">3</a>
                         <a href="###">4</a>
                         <a href="###">5</a>
                         <a href="###">6</a>
                         <a href="###">7</a>
                         <a href="###">8</a>
                         <a href="###">9</a>
                         <a href="###">11</a>
                         <a href="###">下一页</a>
                       </div>
                       <!--/分页-->
                  </div>
               <!--列表-->


            </div>
      	 <!--/其他动态-->
   </div>
   <!--/vip_center-->

<!--/vip_right-->
   <div class="vip_right">
      <!--article_box_list-->
   	  <div class="article_box_list" style="margin-top:0;">
            <div class="article_box_title"><span class="txt_title">最新通知</span></div>
            <ul>
            <c:forEach items = "${requestScope.messagePos}" var = "list" varStatus="status">
            <li><a href="${res}/message/studentMessageDetails.html?messageId=${list.messageId}">
            <c:set var="content"  value="${list.content}"/>
             <c:choose>  
				    <c:when test="${fn:length(content) > 15}">  
				        <c:out value="${fn:substring(content, 0, 15)}..." />  
				    </c:when>  
				   <c:otherwise>  
				      <c:out value="${content}" />  
				    </c:otherwise>  
	 			</c:choose>  
                </a><font><fmt:formatDate pattern="yyyy-MM-dd" 
            				value="${list.fromDate}" /></font></li>
            </c:forEach>
             </ul>
      </div>
      <!--/article_box_list-->
      
      <!--article_box_list-->
      <div class="article_pic_box_list vip_common_box">
           <div class="article_box_title"><span class="txt_title">最近讨论</span></div>
             <dl class="article_li">
               <dt><a href="###"><img src="${res}/student/img/test/3.jpg"></a></dt>
               <dd>
                 <h2><a href="###" title="心理健康这门课程重要吗?">心理健康这个.。？</a></h2>
                 <P>已有：<font class="ar">300</font>人参与讨论</p>
               </dd>
             </dl><!--单条数据-->
                <dl class="article_li">
               <dt><a href="###"><img src="${res}/student/img/test/3.jpg"></a></dt>
               <dd>
                 <h2><a href="###" title="心理健康这门课程重要吗?">心理健康这个.。？</a></h2>
                 <P>已有：<font class="ar">300</font>人参与讨论</p>
               </dd>
             </dl><!--单条数据-->
                <dl class="article_li">
               <dt><a href="###"><img src="${res}/student/img/test/3.jpg"></a></dt>
               <dd>
                 <h2><a href="###" title="心理健康这门课程重要吗?">心理健康这个.。？</a></h2>
                 <P>已有：<font class="ar">300</font>人参与讨论</p>
               </dd>
             </dl><!--单条数据-->
                <dl class="article_li">
               <dt><a href="###"><img src="${res}/student/img/test/3.jpg"></a></dt>
               <dd>
                 <h2><a href="###" title="心理健康这门课程重要吗?">心理健康这个.。？</a></h2>
                 <P>已有：<font class="ar">300</font>人参与讨论</p>
               </dd>
             </dl><!--单条数据-->
                <dl class="article_li">
               <dt><a href="###"><img src="${res}/student/img/test/3.jpg"></a></dt>
               <dd>
                 <h2><a href="###" title="心理健康这门课程重要吗?">心理健康这个.。？</a></h2>
                 <P>已有：<font class="ar">300</font>人参与讨论</p>
               </dd>
             </dl><!--单条数据-->
             <dl class="article_li">
               <dt><a href="###"><img src="${res}/student/img/test/3.jpg"></a></dt>
               <dd>
                 <h2><a href="###" title="心理健康这门课程重要吗?">心理健康这个.。？</a></h2>
                 <P>已有：<font class="ar">300</font>人参与讨论</p>
               </dd>
             </dl><!--单条数据-->
             <dl class="article_li">
               <dt><a href="###"><img src="${res}/student/img/test/3.jpg"></a></dt>
               <dd>
                 <h2><a href="###" title="心理健康这门课程重要吗?">心理健康这个.。？</a></h2>
                 <P>已有：<font class="ar">300</font>人参与讨论</p>
               </dd>
             </dl><!--单条数据-->

             
      </div>
      <!--article_box_list-->
   </div>
 <!--/vip_right-->



</div>
<!--main-->

<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->
</body>
<script type="text/javascript">
	$(".btn3").click(function(){
		$.ajax({
		   url:'${res}/study/personal.html',
           type:'post',
           contentType : "application/x-www-form-urlencoded",
           data:{
           	typeIds : $("#keyWords").val()
           },
 		success : function(data){

 		}
		});
	})
	
	$("#btn1").click(function(){
		$.ajax({
			   url:'${res}/study/toNoselectedcourse2.html',
	           type:'post',
	           contentType : "application/x-www-form-urlencoded",
	           data:{
	        	   anotherKeywords : $("#anotherKeyWords").val()
	           },
	 		success : function(data){
	 			 var htmlStr = "";
         		$.each(data.openCourseVos,function(key,val){
         			htmlStr+='<div class="li">';
         			htmlStr+='<div class="img"><a href="###"><img src="${res}/student/img/test/2.png" /></a></div>';
         			htmlStr+='<div class="txt">';
         			htmlStr+='<h2>'+val.courseName+'</h2>';
         			htmlStr+='<p>讲师：'+val.lecturerName+' }</p>';
         			htmlStr+='<p>课时：<font class="ar">'+val.classhour+'</font>课时</p>';
         			htmlStr+='<div class="alink">';
         			htmlStr+='<a href="#" class="l">我要学习</a>';
         			htmlStr+='<a href="${res}/main/toChapter.html?openId='+val.openId+'" class="r">查看课程</a>';
         			htmlStr+='</div>';
         			htmlStr+='</div>';
         			htmlStr+='</div>';<!--单条数据-->         					
         		});
         		$("#onSelected").append(htmlStr);
	 		}
			});
	})
/* 	//初始化时就调用
jQuery(function ($) {
    initTable(); 
}); */
	function initTable() {
		
		$.ajax({
			 type: "POST",
			  url: "${res}/study/toNoselectedcourse2.html",
			  contentType : "application/x-www-form-urlencoded",
			  dataType: "json",
			  success: function(data){
				  var htmlStr = "";
	            		$.each(data.openCourseVos,function(key,val){
	            			htmlStr+='<br/>'
	            			htmlStr+='<div class="li">';
	            			htmlStr+='<div class="img"><a href="###"><img src="${res}/student/img/test/2.png" /></a></div>';
	            			htmlStr+='<div class="txt">';
	            			htmlStr+='<h2>'+val.courseName+'</h2>';
	            			htmlStr+='<p>讲师：'+val.lecturerName+'</p>';
	            			htmlStr+='<p>课时：<font class="ar">'+val.classhour+'</font>课时</p>';
	            			htmlStr+='<div class="alink">';
	            			htmlStr+='<a href="#" class="l">我要学习</a>';
	            			htmlStr+='<a href="${res}/main/toChapter.html?openId='+val.openId+'" class="r">查看课程</a>';
	            			htmlStr+='</div>';
	            			htmlStr+='</div>';
	            			htmlStr+='</div>';<!--单条数据-->
	            			
	            			
	            		});
	            		$("#onSelected").append(htmlStr);
				
				 
                 
	 		  }
	 		 });
		
	}
	
	
</script>
</html>

   


















































