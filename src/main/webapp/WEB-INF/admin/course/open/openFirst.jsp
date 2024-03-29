<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>开课</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
     <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">开课</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="formbody">
      <div class="formtitle"><span>开课</span></div>
      <div class="padding5">
         <div class="box_course_notice">
       <h2>温馨提示：</h2>
       <p>亲爱的老师，您好！使用开课功能请遵循开课步骤哦，首先选择您需要开设的课程，没有课程的情况下，请先新建课程。选择好课程后，点击页面上的保存按钮进入下一步，完成开课的基础数据填写。填写好后点击完开课按钮即可完成该门课程的开课，祝您使用愉快，谢谢！</p>
    </div>
     <!-- Box --> 
    
    <div class="box_course_list" >
    <c:forEach items ="${requestScope.courseInfoVos}" var = "list"   varStatus="status">
    	<div class="opencourseitems clearfix">
    		<div class="sort_x">
    			<h1><input value="${list.courseTypeId}" type="checkbox" class="scourseId" data-type="${status.index}" >${list.courseTypeName}</h1>
    		</div>
    			<div class="course_names">
	    			<ul>
	    				<c:forEach items="${list.coursePos}" var = "oflist">
	    					<li>
				                  <input data-type="${status.index}" type="checkbox"  name="courseId" maxlength="30"  value="${oflist.courseId }"/>
				                  <span>${oflist.courseName}</span>
				                  
	                		</li>
	    				</c:forEach>
	    			</ul>
	    			
    			</div>
    	</div>
 	</c:forEach>
        
         <div class="opencourse-btn clearfix" >
                   <a  class="opencourse-btn-a" id = "next">下一步</a>
                   <a href="" class="opencourse-btn-a">取消</a>
          </div>                 
      </div><!-- End Box --> 


      </div>   
    </div>
<script type="text/javascript">



//全选 传值data-type=“课程id”
  $(".scourseId").click(function(){
    var data = $(this).attr('data-type');
    $("input[data-type=" + data +"]").prop("checked", $(this).prop("checked"));
    if ($("input[data-type=" + data +"]").is(':checked') == true) {
        $("input[data-type=" + data +"]").siblings('span').css("color","#FF6F00");
      } else {
        $("input[data-type=" + data +"]").siblings('span').css("color","#555");
      };
  });
  
  $("input[name=courseId]").click(function(){
	    if ($(this).is(':checked') == true) {
	      $(this).siblings('span').css("color","#FF6F00");
	    } else {
	      $(this).siblings('span').css("color","#555");
	    };

	  });
  
  
  $("#next").click(function() {  
	  var selectBoxNum = $("[name='courseId']");

      var courseId = []; 
      var name = [];
      for (var i = 0; i < selectBoxNum.length; i++) { 
    	  if (selectBoxNum[i].checked == true) { 
        	  courseId.push( $("[name='courseId']").eq(i).val());
        	  name.push( $("[name='courseId']").eq(i).next().html());
          }     
  		};
  $.ajax({
	 url:'${res}/course/open/next.html',
     type:'post',
     contentType : "application/x-www-form-urlencoded",
     dataType:'json',
     data:{
    	 courseId : courseId,
    	 name : name
     },
	success : function(data){
		
		if(data.flag="1"){
			 window.location.href="${res}/course/open/toAddSecond.html";
		}
	},
     error:function(e){
    	// alert("error");
    	alert("请选择需要开设的课程");
     }
	});
  })
  
</script>
</body>
</html>