<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>左边菜单</title>
<link  href="${res }/css/global.css" rel="stylesheet" type="text/css" />
<link  href="${res }/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res }/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){
		/* var url = $("#checkId").val();
		window.location.href = "/admin/nav/"+url+".html"; */
		var url = $(window.document).find(".leftmenu").find("ul").first().find("li").first().find("a").attr("href");
		window.parent.rightFrame.location.href=url;
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}			
		}
	});
	//二级菜单点击
    $('.menuson li').click(function(e) {
        $(".menuson li.active").removeClass("active")
        $(this).addClass("active");
    });	
    // 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
<input type="hidden" value="${f }" id="checkId">
	<div class="lefttop"><span></span>菜单</div>
    <dl class="leftmenu">
<%--         <dd><div class="title"><span><img src="${res }/images/leftico04.png" /></span>后台首页</div>
            <ul class="menuson">
                <li class="active"><cite></cite><a href="${res}/admin/default.html" target="rightFrame">后台首页</a><i></i></li>
                <li><cite></cite><a href="${res}/main/index.html" target="_blank">前台首页</a><i></i></li>
                <li><cite></cite><a href="${res}/login/logout.html" target="parent">安全退出</a><i></i></li>
            </ul>
       </dd>
 --%>            	<c:forEach items="${controller}" var="con">
        		<dd>
        		<div class="title"><span><img src="${res }/images/leftico04.png" /></span>${con.conName }</div>
            	<ul class="menuson">
            		<c:if test="${con.children != null }">
            			<c:forEach items="${con.children }" var="child">
            				<c:if test="${child.children != null }">
            					<div class="header">
			                    <cite></cite>
			                      <a href="javascript:;" target="rightFrame">${child.conName }</a>
			                      <i></i>
			                    </div> 
            					<ul class="sub-menus">
            						<c:forEach items="${child.children }" var="child1">
	                					<li><a href="${res}${child1.url}" target="rightFrame">${child1.conName }</a><i></i></li>
            						</c:forEach>
			                    </ul>
            				</c:if>
            				<c:if test="${child.children == null }">
		                		<li><cite></cite><a href="${res}${child.url}" target="rightFrame">${child.conName }</a><i></i></li>
            				</c:if>
            			</c:forEach>
            		</c:if>
            		<c:if test="${con.children == null }">
		                <li><cite></cite><a href="${res}${con.url}" target="rightFrame">${con.conName }</a><i></i></li>
            		</c:if>
	            </ul>
      			 </dd>    
            	</c:forEach>
        <%-- <dd>
        <div class="title"><span><img src="${res }/images/leftico01.png" /></span>信息管理</div>
        	<ul class="menuson">
        		<li><cite></cite><a href="${res}/admin/teacher/add.html" target="rightFrame">新建教师</a><i></i></li>
                <li><cite></cite><a href="${res}/admin/teacher/list.html" target="rightFrame">教师信息</a><i></i></li>
                <li><cite></cite><a href="${res}/admin/teacher/import.html" target="rightFrame">导入教师</a><i></i></li>
                <li><cite></cite><a href="${res}/admin/student/list.html" target="rightFrame">学生信息</a><i></i></li>
                <li><cite></cite><a href="${res}/admin/student/import.html" target="rightFrame">导入学生</a><i></i></li>
                 <li><cite></cite><a href="${res}/admin/class/list.html" target="rightFrame">班级列表</a><i></i></li>
                <li> 
                   <div class="header">
                    <cite></cite>
                      <a href="javascript:;" target="rightFrame">学习统计</a>
                      <i></i>
                    </div>                
                    <ul class="sub-menus">
                        <li><a href="${res}/admin/statistics/courseStatistics.html" target="rightFrame">课程学习统计</a></li>
                        <li><a href="${res}/admin/statistics/videoStatistics.html" target="rightFrame">视频观看统计</a></li>
                        <li><a href="${res}/admin/statistics/homeworkStatistics.html" target="rightFrame">作业统计</a></li>
                        <li><a href="${res}/admin/statistics/discussStatistics.html" target="rightFrame">讨论统计</a></li>
                        <li><a href="${res}/admin/statistics/testStatistics.html" target="rightFrame">考试统计</a></li>
                    </ul>
                </li>
                <li> 
                   <div class="header">
                    <cite></cite>
                      <a href="javascript:;" target="rightFrame">公告管理</a>
                      <i></i>
                    </div>                
                    <ul class="sub-menus">
                        <li><a href="${res}/admin/notice/list.html" target="rightFrame">公告列表</a></li>
                        <li><a href="${res}/admin/notice/toAdd.html" target="rightFrame">发布公告</a></li> 
                    </ul>
                </li>
                 <li> 
                   <div class="header">
                    <cite></cite>
                      <a href="javascript:;" target="rightFrame">通知管理</a>
                      <i></i>
                    </div>                
                    <ul class="sub-menus">
                        <li><a href="${res}/admin/message/list.html" target="rightFrame">通知列表</a></li>
                        <li><a href="${res}/admin/message/toAdd.html" target="rightFrame">发布通知</a></li> 
                    </ul>
                </li>
                <li> 
                   <div class="header">
                    <cite></cite>
                      <a href="javascript:;" target="rightFrame">作业与考试管理</a>
                      <i></i>
                    </div>                
                    <ul class="sub-menus">
                        <li><a href="${res}/paper/topaper.html" target="rightFrame">新建试卷</a></li>
                        <li><a href="${res}/paper/toPaperList.html" target="rightFrame">试卷信息</a></li>
                        <li><a href="${res}/test/toNewTest.html" target="rightFrame">新建考试</a></li>
                        <li><a href="${res}/paper/toNewHomework.html" target="rightFrame">新建作业</a></li>  
                    </ul>
                </li>
             </ul>    
        </dd>
        <dd>
        <div class="title">
        <span><img src="${res }/images/leftico02.png" /></span>教学资源</div>
        <ul class="menuson">
            <li> 
               <div class="header">
                <cite></cite>
                  <a href="javascript:;" target="rightFrame">资源列表</a>
                  <i></i>
                </div>                
                <ul class="sub-menus">
                    <li><a href="${res}/resource/publicList.html" target="rightFrame">公共资源列表</a></li>
                    <li><a href="${res}/resource/courseResList.html" target="rightFrame">课程资源列表</a></li>
                </ul>
            </li>
            <li> 
               <div class="header">
                <cite></cite>
                  <a href="javascript:;" target="rightFrame">类别管理</a>
                  <i></i>
                </div>                
                <ul class="sub-menus">
                    <li><a href="${res}/resource/typeList.html" target="rightFrame">资源类别列表</a></li>
                    <li><a href="${res}/resource/toAddresType.html" target="rightFrame">新建资源类别</a></li>
                </ul>
            </li>
            <!--非管理员登录显示-->
            <li> 
               <div class="header">
                <cite></cite>
                  <a href="javascript:;" target="rightFrame">我的资源</a>
                  <i></i>
                </div>                
                <ul class="sub-menus">
                    <li><a href="${res}/resource/myPublicList.html" target="rightFrame">公共资源列表</a></li>
                    <li><a href="${res}/resource/myCourseResList.html" target="rightFrame">课程资源列表</a></li>
                </ul>
            </li>
            <!--非管理员登录显示-->
            <li><cite></cite><a href="${res}/resource/toUploadRes.html" target="rightFrame">上传资源</a><i></i></li>
        </ul>     
        </dd> 
        <dd><div class="title"><span><img src="${res }/images/leftico03.png" /></span>课程建设</div>
        <ul class="menuson">
            <li> 
               <div class="header">
                <cite></cite>
                  <a href="javascript:;" target="rightFrame">课程建设</a>
                  <i></i>
                </div>                
                <ul class="sub-menus">
                    <li><a href="${res}/admin/course/add.html" target="rightFrame">新建课程</a></li>
                    <li><a href="${res}/admin/course/list.html" target="rightFrame">课程列表</a></li>
                    <li><a href="${res}/admin/course/type/list.html" id="courseTypeList" target="rightFrame">类别列表</a></li>
                    <li><a href="${res}/admin/course/type/add.html" target="rightFrame">新建类别</a></li>
                </ul>
            </li>
            <li> 
               <div class="header">
                <cite></cite>
                  <a href="javascript:;" target="rightFrame">课程管理</a>
                  <i></i>
                </div>                
                <ul class="sub-menus">
                    <li><a href="${res}/course/open/toAdd.html" target="rightFrame">开课</a></li>
                    <li><a href="${res}/course/open/list.html" target="rightFrame">编辑开课信息</a></li>
                    <li><a href="${res}/course/open/addStu.html" target="rightFrame">添加选课学生</a></li>
                    <li><a href="${res}/course/open/toOverCourse.html" target="rightFrame">结课</a></li>
                </ul>
            </li>
            <li> 
               <div class="header">
                <cite></cite>
                  <a href="javascript:;" target="rightFrame">题库建设</a>
                  <i></i>
                </div>                
                <ul class="sub-menus">
                    <li><a href="${res}/test/list.html" target="rightFrame">试题列表</a></li>
                    <li><a href="${res}/test/toAdd.html" target="rightFrame">新建试题</a></li>
                    <li><a href="${res}/test/toInsertTest.html" target="rightFrame">导入试题</a></li>
                </ul>
            </li>
        </ul>    
        </dd>
        <dd><div class="title"><span><img src="${res }/images/leftico03.png" /></span>404页面</div>
        <ul class="menuson">
             <li><cite></cite><a href="404.html" target="rightFrame">404页面</a><i></i></li>
        </ul>    
        </dd>  --%> 
    </dl>   
  </body>
<!--     <script type="text/javascript">
    $(function(){
    	$("#courseTypeList").click(function(){
    		
    		$.ajax({
    			url:'${res}/course/type/toList.html',
  	          	type:'get',
  	          	async: false
    	})
    })
    })
    </script> -->
  
</html>
