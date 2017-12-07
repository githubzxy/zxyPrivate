<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线学习-亚卓教育</title>
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/front/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/layout.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/front/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${res}/front/js/jquery.page.js"></script><!-- 分页插件 -->
<script type="text/javascript" src="${res}/front/js/global.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<!--/js-->
</head>
<body>
<!--top-->
<%@ include file="/WEB-INF/home/common_top.jsp" %>
<!--top-->
<!--mian-->
<div class="search_body">
  <div class="w1200 ">
    <!-- 面包屑 -->
    <div class="search_crumbs">
      <a  href="${res}/">首页</a> &gt; 搜索结果 &gt; ${page.keywords}
    </div>
    <!-- 面包屑 end -->
    
    <!-- 主题  -->
    <div class="search_title">
      <div class="search_title_content">
        搜索到“<span>${page.keywords}</span>”相关的课程共<em>${page.totalCount} </em>门
      </div>
      <div class="search_title_box">
      <form action="${res}/course/open/findIndexOpencourse.html">
       	<input type="hidden" name="pageSize" value="6"  class="input-text"/>
        <input type="text" name="keywords" value="${page.keywords}" class="search_title_box_input" />
        <input type="submit" value="搜索" class="search_title_box_submit" />
	</form>
      </div>
    </div>
    <!-- 主题 end  -->
    
    <!-- 主要内容 -->
    <div class="search_content">
      <div class="search_content1">
      
      <c:forEach items = "${requestScope.openCourseVos}" var = "list" varStatus="status">
        <!-- 一条内容 -->
        <div class="search_content_one">
          <a href="${res }/main/toChapter.html?openId=${list.openId}" class="one_a"><c:if test="${list.maxUrl != null}">
           	<img src="<%=url %>/${list.maxUrl}" alt="" />
           </c:if>
           <c:if test="${list.maxUrl == null}">
           <img src="${res}/front/images/test/1p.png" alt="" />
           </c:if></a>
          <dl>
            <dt>
              <a href="${res }/main/toChapter.html?openId=${list.openId}" title="${list.courseName}"><span>${list.courseName}</span></a>
            </dt>
            <dd>
              <p>授课老师：<span>${list.lecturerName}</span></p>
              <p>课程时长：<span>${list.classhour}课时</span></p>
              <p>学习人数：<span>${list.studyPeopleCount}</span></p>
            </dd>
          </dl>
        </div>
        <!-- 一条内容 end -->
	</c:forEach>
       

      </div>
    </div>
    <!-- 主要内容 end -->

    <!-- 分页 -->
    <div class="tcdPageCode"></div>
    <!-- 分页 end -->
  </div>
</div>

<!--mian-->
<!--footer-->
<%@ include file="/WEB-INF/home/common.jsp" %>  
<!--footer-->
<script>
  	//分页
  	var pageCount =${page.pageCount};
  	var pageNum = ${page.pageNum};
    $(".tcdPageCode").createPage({
        pageCount:pageCount,
        current:pageNum,
        backFn:function(p){
            // console.log(p);
            window.location.href="${res}/course/open/findIndexOpencourse.html?pageNum="+p+"&pageSize=6";
            //单击回调方法，p是当前页码
        }
    });
    $(function(){
      //弹窗登录
      var tc_left = ($(window).width()-$(".tc_login_wrap").width())/2;
      var tc_top = ($(window).height()-$(".tc_login_wrap").height())/2;
      $("#tclogin").click(function(){
         $(".mask_wrap_login").show();
         $(".tc_login_wrap").show();
         $(".tc_login_wrap").css("left",tc_left+'px').css("top",(tc_top+80) + 'px');
      });
      $(".closex").click(function(){
         $(".mask_wrap_login").hide();
         $(".tc_login_wrap").hide();
      });
    });
    
    $("#submit").click(function(){
  	  
  	  $.ajax({
            url:'${res}/admin/login/indexLogin.html',
            type:'post',
            dataType:'json',
            contentType : "application/x-www-form-urlencoded",
           data: {
              userName: $('#userName').val(),
              passWord: $('#passWord').val(),
             } ,
            beforeSend : function () {
              $("#shade").show();
              $(".loading2").show();
          }, 
          success : function (data) {
          	$("#layer").show();
              $("#shade").show(); 
              $("#layer dd").text(data.msg);
              $(".loading2").hide();
              setTimeout(function(){
              	if(data.flag=="1"){
              		window.location.href="${res}/course/open/findIndexOpencourse.html?pageSize=6"
              		
              	}
              },1000);  
          }
  	  })
    })
</script>
</body>
</html>

 