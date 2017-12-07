<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新建课程讨论主题</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/bootstrap-table.css" rel="stylesheet" type="text/css" />
<link href="${res }/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res }/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript">
    $(document).ready(function(){
      $(".click").click(function(){
        $(".mask").show();
      $(".tip").fadeIn(200);
      });
      
      $(".tiptop a").click(function(){
          $(".mask").hide();
      $(".tip").fadeOut(200);
    });

  $(".sure").click(function(){
     $(".mask").hide();
  $(".tip").fadeOut(100);
  });

  $(".cancel").click(function(){
     $(".mask").hide();
  $(".tip").fadeOut(100);
  });
//表格单双格颜色渐变
$('.tablelist tbody tr:odd').addClass('odd');
  });
</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">新建课程讨论主题</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>新建课程讨论主题</span></div>
     <div class="padding5">
     <form class="registerform" id = "insertForm">
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
             <tr>
            	<td class="td_right">所属课程：</td>
                 <td> 
                     <select  name="openCourseId" id="openCourseId"  class="select" style="width:250px;">
                     	<c:forEach items="${openCourseVos }" var="openCourseVos">  
                         <option value="${openCourseVos.openId}" >${openCourseVos.courseName}</option>
                         </c:forEach>
                     </select>
                 	
                 </td>
              </tr>
		                 <tr>
		                  <td class="td_right">主题标题：</td>
		                  <td class="">
		                    <textarea name="title" id="title" cols="80" rows="10" class="textarea"></textarea>
		                  </td>
		                 </tr>
		                 
                  <tr>
                   <td class="td_right">&nbsp;</td>
                   <td>
                     <input name="submit" class="ext_btn ext_btn_submit" value="保存" type="button"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                     <input name="button" class="ext_btn ext_btn_error"  value="重置" type="reset"/> 
                   </td>
                 </tr>
               </tbody>
          </table>
          </form>
     </div>
  </div>
</div>
<script type="text/javascript">

 $(".ext_btn_submit").click(function(){
	var openCourseId = $("#openCourseId").val();
	 var title=$("#title").val();

		if(title != null && title !=""){
			
			$.ajax({
				  type: "POST",
				  url: "${res}/admin/discuss/addDiscussTheme.html",
				  processData:true,
				  data:{"openId":openCourseId,"title":title},
				  dataType: "json",
				  success: function(data){	
						if(data.flag==1){
							layer.alert(data.msg,{icon:1},function(){
			      	 			window.location.href="${res}/admin/discuss/listDiscussTheme.html";
		      	 			});
							
						}else{
							layer.alert(data.msg,{icon:2});
						}
				  }
			});
		}
	
	
                	    	  
});
                	
</script>
</body>
</html>
