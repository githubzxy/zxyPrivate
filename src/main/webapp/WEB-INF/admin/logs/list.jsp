<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统日志</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
<script type="text/javascript">
$(function(){
//表格单双格颜色渐变
$('.tablelist tbody tr:odd').addClass('odd');
  });
</script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
     <li><a href="/center/main/index.html" target="_parent">首页</a></li>
    <li>系统日志</li>
    </ul>
    </div>
    
    <div class="rightinfo">
       <!-- <ul class="prosearch">
           <li>
               <i>姓名:</i><a><input name="" id="userName" type="text" class="input-text" /></a>
               <i>用户名：</i><a><input name="" id="loginName" type="text" class="input-text" /></a>
               <a><input name="" type="button" id="search" class="scbtn" value="查询"/></a>
           </li>
       </ul> -->
   
       <div class="formtitle1"><span>系统日志</span></div>
   
    <table class="tablelist">
    	<thead>
        	<tr>
                <th>序号</th>
                <th>操作模块</th>
                <th>用户名</th>
                <th>姓&nbsp;&nbsp;名</th>
                <th>IP</th>
                <th>时&nbsp;&nbsp;间</th>
                <th>身&nbsp;&nbsp;份</th>
            </tr>
        </thead>
        <tbody id="logStr">
        <c:forEach items="${requestScope.sysLogs}" var = "list">
            <tr>
                <td><input name="" type="checkbox" value="" /></td>
                <td>${list.type}</td>
                <td>${list.loginName}</td>
                <td>${list.userName} </td>
                <td>112.193.147.33</td>
                <td><fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${list.createDate}" /></td>
                <td>${list.role}</td> 
			</tr>
		</c:forEach>
			
        
        </tbody>
    </table>
    
    <!--分页-->
        <div class="pagin" id="pageToolbar">
        </div>
    <!--分页 end-->
   
</div>
<script type="text/javascript">
var  $logStr=$("#logStr");
//var $name= $("#sName");
//分页方法
function PageTmp(size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/syslog/list.html",
		  processData:true,
		  data:{'pageSize':size,'pageNum':page},
		  dataType: "json",
		  success: function(data){
			  if(typeof(size) == "undefined"){
				  var htmlStr = "";
				  $logStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(size,page);
				  }}); 
			  }
		  	HtmlTmp(data.page.list,htmlStr,data.page.startIndex);
		  },
		  error:function(e){
			  alert("错误");
		  }
		 });
};

//列表拼接方法
function HtmlTmp(datas,htmlStr,startIndex){
	 $logStr.empty();
	$.each(datas, function (index, log) {
			htmlStr+="<tr>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+log.type+"</td>";
			htmlStr+="<td>"+log.loginName+"</td>";
			htmlStr+="<td>"+log.userName+"</td>";
			htmlStr+="<td>"+"</td>";
			htmlStr+="<td>"+(log.createDate)+"</td>";
			htmlStr+="<td>"+log.role+"</td> ";
			htmlStr+="</tr>";
     });
		  $logStr.append(htmlStr);
}

//搜索条件查询列表
/* $(".search").click(function(){
		var name= $name.val();
		PageTmp(name);
}) */

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});

</script>
</body>
</html>
