<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>班级修改</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script><!--ajaxsubmit表单提交-->
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->

</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">修改班级</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>修改班级</span></div>
     <div class="padding5">
      <form class="fbafficheform" action="#">
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
        <input name="classId" type="hidden" value="${classInfo.classId}">
            <tbody>
              <tr>
                 <td class="td_right">选择年级：</td>
                 <td> 
                     <select  name="gradeId" id="selectCourse"  class="select" style="width:270px;" datatype="*"> 
                       <c:forEach items="${grades}" var="grade" varStatus="status">
                       <option value="${grade.gradeId}" <c:if test="${classInfo.gradeId==grade.gradeId}">selected</c:if>>${grade.name}</option>
                       </c:forEach>
                     </select>
                 </td>
                 <td width="400"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
               </tr>
              <tr>
                <td class="td_right">班级名称：</td>
                <td class=""> <input name="name" class="input-text" size="50" type="text"  datatype="*" value="${classInfo.name}"></td>
                 <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                </tr>
             
                 <tr>
                  <td class="td_right">班级简介：</td>
                  <td class="">
                    <textarea name="info" id="" cols="80" rows="10" class="textarea">${classInfo.info}</textarea>
                  </td>
                   <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                 </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" class="ext_btn ext_btn_submit" value="确认修改" type="button">
                   </td>
                    <td width="500"></td>
                 </tr>
               </tbody>
          </table>
        </form>
     </div>
  </div>
</div>
 <script type="text/javascript">
  $(function(){  
    $(".fbafficheform").Validform({
      tiptype:2
    });
  });
  $(".ext_btn_submit").click(function(){
	  	 $(".fbafficheform").ajaxSubmit({
	 		  type: "post",
	 		     url: "${res}/admin/class/update.html",
	 		     dataType: "json",
	 		     success:function(result){
	 		    	 layer.alert(result.flag,function(){
	 		    		 window.location.href="${res}/admin/class/list.html";
	 		    	 });
	 		     }
	 		  
	   })
	  })
</script>
</body>
</html>