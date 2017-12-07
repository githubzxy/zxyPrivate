<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加角色</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
       <li><a href="#">添加角色</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>添加角色</span></div>
     <div class="padding5">
     <form id="roleForm" action="/admin/role/add.html">
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">角色名称：</td>
                <td class=""> <input name="roleName" id="roleName" class="input-text" size="40" type="text" value="" datatype="s1-20" errormsg="范围在1~20位之间" ></td>
                <td width="400"><span class="Validform_check moveNum" style="color:#f00;">*必填项</span><span class="checkNum" style="color:#f00;"></span></td>
                </tr>
             
                 <tr>
                  <td class="td_right">角色编码：</td>
                  <td class="">
                    <input name="roleCode" id="roleCode" class="input-text" size="40" type="text" value="" datatype="s" errormsg="请正确输入信息" >
                  </td>
                    <td width="400"><span class="Validform_check moveNum" style="color:#f00;">*必填项</span><span class="checkNum" style="color:#f00;"></span></td>
                 </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" class="ext_btn ext_btn_submit" id="addRole" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                     <input name="button" class="ext_btn ext_btn_error"  value="重置" type="button"> 
                   </td>
                 </tr>
               </tbody>
          </table>
          </form>
     </div>
  </div>
</div>
<script type="text/javascript">
	$("#addRole").click(function(){
		var roleName = $("#roleName").val();
		var roleCode = $("#roleCode").val();
		if(roleName == '' || roleCode == ''){
			layer.alert("请输入信息");
			return ;
		}
		$.ajax({
			  type: "POST",
    		  url: "${res}/admin/role/add.html",
    		  processData:true,
    		  data:{"roleName":roleName,"roleCode":roleCode},
    		  dataType: "json",
    		  success: function(data){
    	    		if(1 == data.flag){
    	    			layer.alert(data.msg,{icon: 1, title:'提示'},function(){
        				  document.location.href="list.html";
        			  });;
    	    		}else{
    	    			layer.alert(data.msg,{icon: 2, title:'提示'});
    	    		}
    		  }
    		 });
		});
</script>
</body>
</html>
