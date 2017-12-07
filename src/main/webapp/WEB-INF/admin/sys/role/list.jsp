<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色设置信息列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css">
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/admin/default.html">首页</a></li>
       <li><a href="#">角色设置信息列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="${res}/admin/role/add.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>新加角色</a></li>
       </ul>
    </div>
    <div class="formbody">
        <div class="formtitle"><span>角色设置信息列表</span></div>

         <table class="tablelist">
          <thead>
              <tr>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>角色名称</th>
                    <th>角色编码</th>
                    <th width="260" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="roleStr"> 
            </tbody>
        </table>
        <!--分页-->
       <div id="pageToolbar"></div>
        <!--分页 end-->
     </div>
</div>
<script type="text/javascript">
var  $roleStr=$("#roleStr");
//分页方法
function PageTmp(size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/role/list.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page},
		  dataType: "json",
		  success: function(data){
				  var htmlStr = "";
				  $roleStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(size,page);
				  }}); 
			HtmlTmp(data.page.list,htmlStr,data.page.startIndex);
		  },
		  error:function(e){
			  alert("错误");
		  }
		 });
};

//列表拼接方法
function HtmlTmp(datas,htmlStr,startIndex){
	$roleStr.empty();
	  $.each(datas, function (index, role) {
		    htmlStr+="<tr>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+role.roleName+"</td>";
			htmlStr+="<td>"+role.roleCode+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl5'>";
			htmlStr+="<a href='${res}/admin/role/"+role.roleId+"/update.html' class='ext_btn ext_btn_submit mr10'>修改</a> ";
			htmlStr+="</span> ";
			htmlStr+="<span class='pl5'>";
			htmlStr+="<a href='${res}/admin/role/set/"+role.roleId+".html?role="+role.roleName+"' class='ext_btn ext_btn_submit mr10'>修改权限</a> ";
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
   });
	  $roleStr.append(htmlStr);
}


//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});

</script>

</body>
</html>
