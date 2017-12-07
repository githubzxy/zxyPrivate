<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>批量导入学生信息</title>
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
       <li><a href="#">导入学生信息</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>导入学生信息</span></div>
     <div class="padding5">
        <form class="registerform" id = "insertForm"  enctype="multipart/form-data" method="post">
        <input type="hidden"  name="openId" value="${requestScope.openId}"/>
         <table class="form_table insertable"  cellspacing="0" cellpadding="0" border="0">
            <tbody>
	            <tr>
	            	 <td class="td_right">课程名称：</td>
					 <td>${requestScope.courseName}</td>
					
	            </tr>
              <tr>
                <td class="td_right">填写样例：</td>
                <td width="830"><img src="${res}/images/test/student.jpg"></td>
                <td></td>
              </tr>
               <tr>
                <td class="td_right">学生信息模板：</td>
                <td width="830"><a href="${res}/excel/excel_stuCourseInfo.xls" class="red">【下载】</a></td>
                <td></td>
               </tr>
               <tr>
                <td class="td_right">学生信息文件：</td>
                <td width="830"><input name="file" size="10" type="file"></td>
                <td></td>
               </tr>
               <tr>
              <td class="td_right">&nbsp;</td>
               <td width="830">
                 <input name="button" class="ext_btn ext_btn_submit" id="add" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input name="button" class="ext_btn ext_btn_error" value="清空" type="reset"> 
                </td>
                <td></td>
              </tr>
            </tbody>
          </table> 
        </form>
     </div>
  </div>
</div>
</body>

<script type="text/javascript">
		$("#add").click(function(){
				var file=$("input[name='file']").val();
				if(file!=""&&file.length>0){
			  			$("#insertForm").ajaxSubmit({
			  				 url: '${res}/course/open/importStudents.html',
						     type: 'post',
						     dataType: 'json',
						     success: function(data){
						    	if(data.flag==1){
						    		layer.alert("保存成功",{
						    			icon:1
						    		},function(){
						    			window.location.href="${res}/course/open/addStu.html";
						    			layer.closeAll();
						    		})
						    		
						    		
						    	}else{
						    		layer.alert("保存失败(注意：请检查学生学号)",{icon: 2, title:'提示'});
						    	}
		          
						}
				         
				     });
				}else{
					layer.alert("请上传学生信息文件",{icon: 2, title:'提示'});
				}
		}) 			
</script>	  			
</html>
