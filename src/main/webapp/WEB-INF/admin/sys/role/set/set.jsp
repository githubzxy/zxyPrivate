<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
       <li><a href="#">个人角色设置</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>个人角色设置</span></div>
     <div class="padding5">
     <form id="roleForm" action="/admin/role/add.html">
     	<input type="hidden" id="idStr" value="${idStr }"></input>
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
	            <td class="td_right">用户名称：</td>
	            <td> <span>${nameStr }</span> </td>
              </tr>
             
                 <tr>
                  <td class="td_right">角色选择：</td>
                 <td> 
                     <select  name="roleId" id="roleId"  class="select" style="width:270px;"> 
                        <option selected>-------------------请选择角色-------------------------</option> 
                       <c:forEach items="${roles}" var="role" varStatus="status">
                       <option value="${role.roleId}"
                       <c:if test="${role.roleId==myRole}"> selected = "selected"</c:if>
                       >${role.roleName}</option>
                       </c:forEach>
                     </select>
                 </td>
                 </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" class="ext_btn ext_btn_submit" id="setRole" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
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
	$("#setRole").click(function(){
		var idStr = $("#idStr").val();
		var roleId = $("#roleId").val();
		if(roleId == ''){
			layer.alert("请选择角色");
			return ;
		}
		$.ajax({
			  type: "post",
    		  url: "${res}/admin/role/teacher/set.html",
    		  processData:true,
    		  data:{"idStr":idStr,"roleId":roleId},
    		  dataType: "json",
    		  success: function(data){
    	    		if(1 == data.flag){
    	    			layer.alert(data.msg,{icon:1},function(){
        				  document.location.href="list.html";
        			  });;
    	    		}else{
    	    			layer.alert(data.msg,{icon:2});
    	    		}
    		  }
    		 });
		});
</script>
</body>
</html>