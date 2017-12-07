<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新建课程类别</title>
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
       <li><a href="#">新建课程类别</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>新建课程类别</span></div>
     <div class="padding5">
     <form class="registerform" id = "insertForm"  enctype="multipart/form-data" method="post">
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
             <tr>
            	<td class="td_right">父级类别：</td>
                 <td> 
                     <select  name="parentId" id="parentId"  class="select" style="width:250px;"> 
                        <option selected value="0">##没有上级##</option> 
                       <c:forEach items="${typeList}" var="type" varStatus="status">
                         <option value="${type.courseTypeId}" >${type.typeName}</option>
                       </c:forEach>
                     </select>
                 	
                 </td>
              </tr>
              <tr>
                <td class="td_right">类别名称：</td>
                <td><input name="typeName" id="typeName" class="input-text" size="40" type="text" datatype="*2-20"  errormsg="资源分类名称必须是2到6位中文字符！" /></td>
                 <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
                </tr>
             
                 <tr>
                  <td class="td_right">类别信息：</td>
                  <td class="">
                    <textarea name="typeInfo" id="type_info" cols="80" rows="10" class="textarea"></textarea>
                  </td>
                 </tr>
                <tr>
                  <td class="td_right">类别封面图：</td>
                      <td class=""><input name="file" id="file" size="10" type="file" style="display:none"/>
                  <div class="input-append">
                  <input id="uploadurl" class="input-large" type="text" disabled>
                  <a class="btn btn-info" onclick="$('input[id=file]').click();">
                 <i class="icon-folder-open-alt"></i> 浏览
                 </a>
                 </div>
                 </td>
                 </tr>
                  <tr>
                   <td class="td_right">&nbsp;</td>
                   <td>
                     <input type="hidden" name = "url" id = "url"></input>
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
   $(function(){
                	   
                	   $(".registerform").Validform({
                		    tiptype:function(msg,o,cssctl){
                		      if(!o.obj.is("form")){
                		        var objtip=o.obj.parents("td").next().find(".Validform_check");
                		        cssctl(objtip,o.type);
                		        objtip.text(msg);
                		      }

                		    },
                		  });
                	   var str;
                	   var imageUrl;
                	   $('#file').change(function(){
                	   str=$(this).val(); 
                	   var arr=str.split('\\');//注split可以用字符或字符串分割 
                	   imageUrl=arr[arr.length-1];//这就是要取得的图片名称 
                	   $("#url").val(imageUrl);
                	   }) 
                	   
                	 
                   		
                   })
 $(".ext_btn_submit").click(function(){
	var typeName = $("#typeName").val();
	 var parentId=$("#parentId").val();
	var flag=true;
	$("select").each(function(){
	       $(this).find("option").each(function(){
	    	   var parentVal= $(this).text();
	    	   if(parentId==0&&typeName==parentVal){
	    			 layer.alert("同级类别名重复",{icon:2});
	    			 flag=false;
	    			 return flag;
	    		 }
	       });
	});
	if(flag){
		if($(".Validform_check").html()=="通过信息验证！"){
  			var typeInfo = $("#type_info").val();
  			$.ajaxFileUpload({
   			url:'${res}/admin/course/type/add.html',
  	            type:'post',
  	            fileElementId:'file',
  	            data:{'parentId':parentId,'typeName':typeName,'typeInfo':typeInfo},
  	            dataType:'json',
  	           success : function (data) {
  	        	if(1 == data.flag){
      	 			layer.alert(data.msg,{icon:1},function(){
          	 			window.location.href="${res}/admin/course/type/list.html";
          	 			});
      	 		}else {
      	 			layer.alert(data.msg,{icon:2});
      	 		}
  	          }	
   			
   		})
  		  
 	   }else{
 		layer.alert("亲，请填好信息!",{icon:2});
 	   }
		
	}
	
                	    	  
                      		});
   $('input[id=file]').change(function() {
       var path = $(this).val();
       path = path.split('＼＼');
       path = path[path.length-1];
       $('#uploadurl').val(path);
   });
                      	
</script>
</body>
</html>
