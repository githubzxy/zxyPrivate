<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>批量导入班级信息</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">导入班级信息</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>导入班级信息</span></div>
     <div class="padding5">
        <form class="registerform" action="" enctype="multipart/form-data" method="post">
         <table class="form_table insertable"  cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">填写样例：</td>
                <td width="830"><img src="${res}/images/test/student.jpg"></td>
                <td></td>
              </tr>
               <tr>
                <td class="td_right">班级信息模板：</td>
                <td width="830"><a href="${res}/excel/excel_claInfo.xlsx" class="red">【下载】</a></td>
                <td></td>
               </tr>
               <tr>
                <td class="td_right">班级信息文件：</td>
                <td width="830"><input name="file" type="file"/></td>
                <td></td>
               </tr>
               <tr>
              <td class="td_right">&nbsp;</td>
               <td width="830">
                 <input class="ext_btn ext_btn_submit" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input  class="ext_btn ext_btn_error" value="清空" type="reset"> 
                </td>
                <td></td>
              </tr>
            </tbody>
          </table> 
        </form>
     </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
 
$(".ext_btn_submit").click(function(){
	  $(".registerform").ajaxSubmit({
		     type: "post",
		     url: "${res}/admin/class/import.html",
		     dataType: "json",
		     success: function(result){
		    	 if(result=="导入成功"){
		    		 layer.alert(result,function(){
		    			 document.location.href="list.html";  
		    		 })
		    	 }else{
		    		 layer.alert(result)
		    	 }
		    		 
		    		
		    	 
          
}
		         
		 });
  })
})
</script>

</body>
</html>
