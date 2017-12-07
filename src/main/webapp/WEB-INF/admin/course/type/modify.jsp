
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改课程类别</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res }/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/bootstrap-table.css" rel="stylesheet" type="text/css" />
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
       <li><a href="#">修改课程类别</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>修改课程类别</span></div>
     <div class="padding5">
     <form action="#" id="typeForm" enctype="multipart/form-data" class="registerform">
     	<input type="hidden" name="courseTypeId" id="courseTypeId" value="${type.courseTypeId }"/>
     	<input type="hidden" name="url" id="url" value="${type.url }"/>
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
             <tr>
            	<td class="td_right">父级类别：</td>
                 <td> 
                     <select  name="parentId" id="parentId"  class="select" style="width:250px;" > 
                        <option value="0">请选择</option> 
                       <c:forEach items="${typeList}" var="list" varStatus="status">
                         <option value="${list.courseTypeId}" <c:if test="${list.courseTypeId == type.parentId}">selected="selected"</c:if>>${list.typeName}</option>
                       </c:forEach>
                     </select>
                 	
                 </td>
                 <td width="400"><span  style="color:#f00;">*必填项</span></td>
              </tr>
              <tr>
                <td class="td_right">类别名称：</td>
                <td> <input name="typeName" id="typeName" class="input-text" size="40" type="text" value="${type.typeName}" datatype="*2-6"  errormsg="资源分类名称必须是2到6位中文字符！" /></td>
                 <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
                </tr>
             
                 <tr>
                  <td class="td_right">类别信息：</td>
                  <td class="">
                    <textarea name="typeInfo" id="type_info" cols="80" rows="10" class="textarea">${type.typeInfo}</textarea>
                  </td>
                 </tr>
                <tr>
                  <td class="td_right">类别封面图：</td>
                <%--  <a href="${res}/center/images/courseType/${requestScope.type.url}"></a>  --%>
                  <td class=""><input name="file" id="file" size="10" type="file" style="display:none"/>
                  <div class="input-append">
                  <input id="uploadurl" class="input-large" type="text" disabled>
                  <a class="btn btn-info" onclick="$('input[id=file]').click();">
                 <i class="icon-folder-open-alt"></i> 浏览
                 </a>
                 </div>
                  <img src="<%=url %>/${requestScope.type.url}" height="150" width="150" alt="类别图片" onload="javascript:DrawImage(this,150,150)"/>
                  </td>
                 </tr>

                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" class="ext_btn ext_btn_submit" id ="update" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                     <input name="button" class="ext_btn ext_btn_error"  value="重置" type="reset"> 
                   </td>
                 </tr>
               </tbody>
          </table>
          </form>
     </div>
  </div>
</div>
<script type="text/javascript">
    $(function(){
 	   $(".registerform").Validform({
 		    tiptype:function(msg,o,cssctl){
 		      if(!o.obj.is("form")){
 		        var objtip=o.obj.parents("td").next().find(".Validform_check");
 		        cssctl(objtip,o.type);
 		        objtip.text(msg);
 		      }

 		    }
 		  });
 	  function DrawImage(ImgD,iwidth,iheight){      
 	        //参数(图片,允许的宽度,允许的高度)      
 	        var image=new Image();      
 	        image.src=ImgD.src;      
 	        if(image.width>0 && image.height>0){      
 	          if(image.width/image.height>= iwidth/iheight){      
 	              if(image.width>iwidth){        
 	                  ImgD.width=iwidth;      
 	                  ImgD.height=(image.height*iwidth)/image.width;      
 	              }else{      
 	                  ImgD.width=image.width;        
 	                  ImgD.height=image.height;      
 	              }      
 	          }else{      
 	              if(image.height>iheight){        
 	                  ImgD.height=iheight;      
 	                  ImgD.width=(image.width*iheight)/image.height;              
 	              }else{      
 	                  ImgD.width=image.width;        
 	                  ImgD.height=image.height;      
 	              }      
 	          }      
 	        }      
 	    } 
    	
    }); 
    
$('input[id=file]').change(function() {
        var path = $(this).val();
        path = path.split('＼＼');
        path = path[path.length-1];
        $('#uploadurl').val(path);
});
$("#update").click(function(){
   var  typeName=$("#typeName").val();
   if(typeName!=null&&typeName!=""){
	   var name = $(".input-text").val();
		var type_info = $("#type_info").val();
		var parentId = $("#parentId").val();
		var courseTypeId = $("#courseTypeId").val();
		var url = $("#url").val();
			$.ajaxFileUpload({
			url:'${res}/admin/course/type/update.html',
	            type:'post',
	         	fileElementId:'file',
	            dataType:'json',
	            data:{
	            	courseTypeId:courseTypeId,
	            	parentId:parentId,
	            	typeName:name,
	            	typeInfo:type_info,
	            	url:url
	            },
	          success : function (data) {
	       		window.location.href="${res}/admin/course/type/list.html"
	       		
	          }	
			})
  		  
   	
   }
	
});    
</script>
</body>
</html>
