<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>批量导入教师</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">导入教师</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>导入教师</span></div>
     <div class="padding5">
        <form class="registerform" action="" enctype="multipart/form-data" method="post">
         <table class="form_table insertable"  cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">填写样例：</td>
                <td width="830"><img src="${res}/images/test/teacher.jpg"></td>
                <td></td>
              </tr>
               <tr>
                <td class="td_right">教师信息模板：</td>
                <td width="830"><a href="#" class="red">【下载】</a></td>
                <td></td>
               </tr>
               <tr>
                <td class="td_right">教师信息文件：</td>
                <td width="830"><input id="tfile" name="file" size="10" type="file"></td>
                <td></td>
               </tr>
               <tr>
              <td class="td_right">&nbsp;</td>
               <td width="830">
                 <input  id="teacherSumbit"class="ext_btn ext_btn_submit" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input name="button" class="ext_btn ext_btn_error" value="清空" type="button" onclick="document.location.href='import.html';"> 
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
$("#teacherSumbit").click(function(){
	  var file= $("#tfile").val();
	  alert(file)	
	 $(".registerform").ajaxSubmit({
		  type: "POST",
		  url: "${res}/admin/teacher/import.html",
		  processData:true,
		  dataType: "json",
		  success: function(data){
			  layer.open({
			      time: 2000, //2s后自动关闭
			      title: '提示' , 
			      icon:2,  
			      content:'导入成功！' 
			    });
		  },
		  error:function(){
			  alert("错了");
		  }
		 });
})
</script>
</body>
</html>
