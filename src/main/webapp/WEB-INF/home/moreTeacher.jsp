<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="亚卓教育、锦岸文化" />
<meta name="description" content=" “亚卓教育”是为中国基础教育和职业教育领域提供领先在线教学资源和教育技术的国有参股企业，拥有国家高新技术企业资质和国家级高新区“上规入库”企业评级，也是国内唯一在线教育机构与教育部主管和指导的《中国教育信息化》杂志社、《基础教育参考》杂志构建战略合作关系，共同研发在线课程资源产品的公司。author:亚卓教育技术部 " />
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<title>亚卓数字教学中心</title>
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/front/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/layout.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/front/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script src="${res}/front/js/jquery.page.js"></script><!-- 分页插件 -->
<script type="text/javascript" src="${res}/front/js/global.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<!--/js-->
</head>
<body>
<!--top-->
<%@ include file="/WEB-INF/home/common_top.jsp" %>
<!--top-->
<!--mian-->
<div class="courseCategories_main">
  <div class="w1200 teachersTeam_main">
    <!-- 面包屑 -->
    <div class="teachersTeam_main_crumbs"><a href="${res}/">首页</a> - <a href="javascript:void(0);">名师团队</a><em></em></div>
    <!-- 面包屑 end -->
    <!-- 标题 -->
    <div class="teachersTeam_main_title">全部名师</div>
    <!-- 标题 end -->
    <div class="teachersTeam_main_table">
     <ul>
     
      <c:forEach items ="${requestScope.lecturerPos}" var = "list"   varStatus="status">
	     
	       <li>
	         <dl class="fl">
	            <dt>
	               <c:if test="${list.avatar != null&&list.avatar !=''}">
           	<img src="<%=url %>/${list.avatar}" alt="头像" />
           </c:if>
             <c:if test="${list.avatar == null||list.avatar == ''}">
           	<img src="${res}/front/images/teacherAvatar.png" alt="头像" />
           </c:if>
	            </dt>
	            <dd>
	              <div class="one_teacherName">${list.name}</div>
	              <div class="one_professional"><p>职称：${list.position}</p><%-- <p>所属：${list.schoolName}<p> --%></div> 
	            </dd>
	         </dl>
	         <div class="one_right fr">
	                <span class="one_info">简介：</span>
	                <span class="one_info_centent" title="${list.info}">
	                <c:set var="testStr"  value="${list.info}"/>
	                		<c:choose>  
							    <c:when test="${fn:length(testStr) > 100}">  
							        <c:out value="${fn:substring(testStr, 0, 100)}......" />  
							    </c:when>  
							   <c:otherwise>  
							      <c:out value="${testStr}" />  
							    </c:otherwise>  
						  </c:choose> </span>
	          </div>
	       </li><!--单条数据-->

	 </c:forEach>
 

 
     </ul>
    </div>
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
  /* $(function(){
    $(".teachersTeam_main_table ul li dl.one_right").each(function(index,e){
      var faceHeight = $(".teachersTeam_main_table ul li .fl").eq(index).height();
      var infoHeight = $(e).height();
      if (infoHeight<faceHeight) {
    	  $(e).height(faceHeight);
      }
    });
  }); */
  	//分页
  	var pageCount =${baseConditionVO.pageCount};
  	var pageNum = ${baseConditionVO.pageNum};
    $(".tcdPageCode").createPage({
        pageCount:pageCount,
        current:pageNum,
        backFn:function(p){
            // console.log(p);
            window.location.href="${res}/admin/lecturer/findMoreLecturerInfo.html?pageNum="+p+"&pageSize=5";
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
    	  if($('#userName').val()!=""&&$('#passWord').val()!=""){
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
                		window.location.href="${res}/admin/lecturer/findMoreLecturerInfo.html";
                	}else{
                		layer.confirm(data.msg,{icon: 3, title:'提示'},function(){ 
        		    		layer.closeAll();
        		    		window.location.href="${res}/lecturer/findMoreLecturerInfo.html";
        	    		})
                	}
                },1000);  
            }
    	  })
    	  }else{
    		  layer.confirm('登录名或密码为空',{icon: 3, title:'提示'},function(){ 
    	    		layer.closeAll();
    	    		window.location.href="${res}/admin/lecturer/findMoreLecturerInfo.html";
      		})
    	  }
      })
    
  
</script>
</body>
</html>
