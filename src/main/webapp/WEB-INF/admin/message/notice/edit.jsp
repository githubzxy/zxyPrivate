<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发布公告</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${res}/umeditor/themes/default/css/umeditor.css">
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">修改公告</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>修改公告</span></div>
     <div class="padding5">
      <form class="fbafficheform" id = "editForm" action="#">
      <input name="noticeId" type="hidden"  value ="${requestScope.noticeVo.noticeId}"/>
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">公告标题：</td>
                <td class=""> <input name="title" class="input-text" size="50" type="text"  datatype="*" value="${requestScope.noticeVo.title}"></input></td>
                 <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                </tr>
             
                 <tr>
                  <td class="td_right">公告内容：</td>
                  <td class="">
                   <script type="text/plain"  name="content" id="myEditor" style="width:600px;height:240px;">
                <p>${requestScope.noticeVo.content}</p>
               </script>
                  </td>
                   <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                 </tr>
                <!--  <tr>
                 <td class="td_right">通知类型：</td>
                 <td><input type="radio" value="课程通知" name="gender" id="male" datatype="*" errormsg="请选择通知类型！"><label>课程通知</label> &nbsp;&nbsp;&nbsp;<input type="radio" value="其他通知" name="gender" id="female"><label>其他通知</label></td>
                  <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                 </tr> -->
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" class="ext_btn ext_btn_submit" id = "edit"value="确认发布" type="button">
                   </td>
                    <td width="500"></td>
                 </tr>
               </tbody>
          </table>
        </form>
     </div>
  </div>
</div>
 <script type="text/javascript" src="${res}/umeditor/third-party/template.min.js"></script>
 <script type="text/javascript" charset="utf-8" src="${res}/umeditor/umeditor.config.js"></script>
 <script type="text/javascript" charset="utf-8" src="${res}/umeditor/umeditor.min.js"></script>
 <script type="text/javascript" src="${res}/umeditor/lang/zh-cn/zh-cn.js"></script>
 <script type="text/javascript">
  /* $(function(){  
    $(".fbafficheform").Validform({
      tiptype:2
    });
  }); */
  
//实例化编辑器
  var um = UM.getEditor('myEditor'); 
  
  
  $("#edit").click(function(){
		 $.ajax({
			type: 'post',
		    url: '${res}/admin/notice/edit.html',
		    dataType:'json',
		    contentType : "application/x-www-form-urlencoded",
		    data: $("#editForm").serialize(),
		    success: function(data) {

	    	if(data.flag=="1"){
		    		window.location.href="${res}/admin/notice/list.html";
		    	}
		    	 
		    },
		 	error:function(e){
		 		alert("error");
		 	}
		    	

		})
		
});
  </script>
</body>
</html>
