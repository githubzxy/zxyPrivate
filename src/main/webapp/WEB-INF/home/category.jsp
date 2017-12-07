<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
  <div class="w1200">
    <!-- 主体左边 -->
    <div class="courseCategories_main_left fl">
      <div class="courseCategories_main_left_title">全部课程</div>
      <div class="courseCategories_main_left_categories">
      <c:forEach items="${parentTypes}" var="parentType">
      <c:if test="${parentType.courseTypeId==page.courseTypeId}">
        <!-- 一门课程的类别 -->
        <div class="categories_title" id="obj" title="${parentType.typeName}"><em class="courseCategories_v02"></em>${fn:substring(parentType.typeName,0,15)}</div>
        </c:if>
         <c:if test="${parentType.courseTypeId!=page.courseTypeId}">
        <!-- 一门课程的类别 -->
        <div class="categories_title"  title="${parentType.typeName }"><em class="courseCategories_v02"></em>${fn:substring(parentType.typeName,0,15)}</div>
        </c:if>
            <ul class="categories_ul" style="display:none;">
           <c:forEach items="${courseTypes}" var="courseType">
       <c:if test="${courseType.parentId==parentType.courseTypeId}">
           <c:choose>  
       <c:when test="${courseType.courseTypeId==page.courseTypeId}"> 
         <li class="categories_active" title="${courseType.typeName }"><a href="javascript:void(0);"><em></em>${fn:substring(courseType.typeName,0,15)}</a></li> 
        </c:when> 
         <c:otherwise>   
           <li><a href="javascript:void(0);" onclick="getCourses(${courseType.courseTypeId})" title="${courseType.typeName }"><em></em>${fn:substring(courseType.typeName,0,15)}</a></li>         
        </c:otherwise> 
    </c:choose> 	
        </c:if>
        </c:forEach>
        </ul>
        </c:forEach>
        <!-- 一门课程的类别 end -->
      </div>
      


    </div>
    <!-- 主体左边 end -->

    <!-- 主体右边 -->
    <div class="courseCategories_main_right fl ">

      <!-- 主体右边上面部分 -->
      <div class="courseCategories_main_top">
        当前共<span>${page.totalItem}</span>门课程
        <input type="hidden" value="${page.courseTypeId}" id="courseTypeId"/>
        <input type="hidden" value="${page.totalPage}" id="totalPage"/>
        <input type="hidden" value="${page.pageNum}" id="pageNum"/>
      </div>
      <!-- 主体右边上面部分 end -->

      <!-- 主体右边下面部分 -->
      <div class="courseCategories_mian_bottom" >
      <c:choose>  
<c:when test="${!empty courses}"> 
       <c:forEach items="${courses}" var="course">
       <c:choose>
       		<c:when test="${sessionScope.baseUser == null}">
       		
	         <a onClick="javascript: $('#tclogin').click()" class="course_item" />
       		</c:when>
       		<c:when test="${sessionScope.baseUser.roleCode == 'student'}">
       		<!--  <a href="javascript:layer.alert('学生需选课后才能观看哦！',{icon: 5, title:'提示'});" class="course_item" /> -->
	         <a href="toChapter.html?openId=${course.openId}" class="course_item" />
       		</c:when>
       		<c:otherwise>
	         <a href="toChapter.html?openId=${course.openId}" class="course_item" />
       		</c:otherwise>
       </c:choose>
        	<c:if test="${course.maxUrl != null}">
           	<img src="<%=url %>/${course.maxUrl}" alt="" />
           </c:if>
           <c:if test="${course.maxUrl == null}">
          <img src="${res}/front/images/test/2P.png" alt="" />
           </c:if>
          <div class="shadow">
            <div class="kcifon">
              <span class="kctitle">${course.courseName}</span>
              <span class="teacher"></span>
            </div>
            <div class="kcifon">
              <span class="kctime">${course.classhour}学时</span>
              <span class="kcview">${course.clickNum}次观看</span>
            </div>
          </div>
        </a><!--单条数据-->
        </c:forEach> 
              
        </c:when> 
         <c:otherwise>   
                
               <!--没有课程显示-->
               <div style=" padding-left:20px;" >
                    <div class="j-cnt">
                        <div class="nores">
                              <div class="tit">
                                  <p>抱歉，没有找到
                                  <span class="f-hl j-searchInfo"></span>
                                  <span class="j-type">相关课程</span>
                                  </p>
                                </div> 
                        </div>
                 </div>
        </div>
           <!--/没有课程显示-->

        </c:otherwise> 
</c:choose> 
 
      </div>
      <!-- 主体右边下面部分 end -->
      <c:if test="${!empty courses}"> 
      <!-- 分页 -->
        <div class="tcdPageCode"></div>
     <!-- 分页 end --> 
    </c:if>
    </div>
       
    <!-- 主体右边 end -->

  </div>
</div>
<!--mian-->
<!--footer-->
<%@ include file="/WEB-INF/home/common.jsp" %>  
<!--footer-->
<script>
var totalPage=$("#totalPage").val();
var courseTypeId=$("#courseTypeId").val();
var pageNum=$("#pageNum").val();
  //分页
    $(".tcdPageCode").createPage({
        pageCount:totalPage,
        current:pageNum,
        backFn:function(p){
        
        	window.location.href="category.html?pageNum="+p+"&&courseTypeId="+courseTypeId;
            // console.log(p);
            //单击回调方法，p是当前页码  
            
        }
    });
  function getCourses(courseTypeId){
	  window.location.href="category.html?courseTypeId="+courseTypeId;
  }
  
  
    $(function(){
        //折叠菜单
        var activeIndex = 0;
        $(".categories_ul").each(function(index,e){
          $("li",$(this)).each(function(){
            if ($(this).hasClass('categories_active')) {
              activeIndex = index;
            }
          });
        });
     if(activeIndex!=0) {
        
      	  yazhuokj.NavMenu(activeIndex);
        }else{
        	   //判断课程两大类别，然后展开
        	 
             if($("#obj").is(":empty")||$("#obj").length<=0){
        		   
       			$(".categories_title").eq(0).attr("id","obj");
            } 
       			
         
       			
        	  $("#obj").children("em").removeClass('courseCategories_v02').addClass('courseCategories_v01');
        	 	 var selectedIndex = 0;
        	 	 $("#obj").next("ul").attr("id","isMe");
        	      $(".categories_ul").each(function(index,e){
        	     	  if($(this).attr("id")=="isMe"){
        	     		 selectedIndex=index;   
        	     	  }
        	      });
        		
        	      $("#obj").next("ul").show();
        	      
        	      var tem=0;
        	      $(".categories_ul").each(function(index,e){
        	          $("li",$(this)).each(function(){
        	            if ($(this).hasClass('categories_active')) {
        	              tem++;
        	            }
        	          });
        	        });
        	      if(tem==2){
        	    	  $(".categories_ul").children(':first').removeClass('categories_active');
        	      }
        	      yazhuokj.NavMenu(selectedIndex); 
        	      
        } 


        $(".categories_active").parent("ul").show();
        $(".categories_active").parent("ul").prev().children("em").removeClass('courseCategories_v02').addClass('courseCategories_v01');
    	 
    
      
    //courseCategories_mian_bottom的高度
      var aHeight = $(".courseCategories_mian_bottom a").eq(0).height();
      var rowNum = Math.ceil($(".courseCategories_mian_bottom a").length / 3);
     
      if (rowNum<3) {
        $(".courseCategories_mian_bottom").css('height', (aHeight + 20) * 3  + 'px');
      } else {
    	
        $(".courseCategories_mian_bottom").css('height', (aHeight + 20) * rowNum  + 'px');
      };
      
      
   

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
                		window.location.href="${res}/main/category.html";
                		
                	}else{
                		layer.confirm(data.msg,{icon: 3, title:'提示'},function(){ 
        		    		layer.closeAll();
        		    		window.location.href="${res}/main/index.html";
        	    		})
                	}
                },1000);  
            }
    	  })
      }else{
		  layer.confirm('登录名或密码为空',{icon: 3, title:'提示'},function(){ 
	    		layer.closeAll();
	    		window.location.href="${res}/main/index.html";
  		})
	  }
      })
  
</script>

</body>
</html>

 