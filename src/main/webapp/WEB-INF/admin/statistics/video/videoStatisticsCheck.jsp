<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>视频观看统计查看</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res }/css/layout.css" rel="stylesheet" type="text/css" />
<!-- <link href="plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" /> -->
<link href="${res }/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res }/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res }/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res }/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res }/js/global.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">视频观看统计查看</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
	<input type="hidden" id="courseId" value="${courseId }"/>
	<input type="hidden" id="videoId" value="${videoId }"/>
     <%-- <ul class="prosearch">
       <li>
           <i class="font15">${videoName}</i>
            <a><input name="" class="search" value="返回" type="button"></a>
       </li>
    </ul> --%>

     <div class="formtitle"><span>视频观看统计查看</span></div>
     <div class="padding5">
     <%-- <c:if test="${empty students}">
         <p>暂无观看详情</p>
       </c:if>
         <c:if test="${!empty students}"> --%>
      <table class="tablelist">
          <thead>
              <tr>
                    <th>学&nbsp;&nbsp;号</th>
                    <th>姓&nbsp;&nbsp;名</th>
                    <th>观看时间</th>
                    <th>最后观看时间</th>
                </tr>
            </thead>
            <tbody id="studentVideoStr"> 
            <c:forEach items="${students}" var="student" varStatus="status">
                <tr>
                    <td>${student.studentId}</td>
                    <td>${student.name}</td>
                    <td><fmt:formatDate value="${student.startDt}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${student.lastDt}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <!--分页-->
         <div class="pagin" id="pageToolbar">
             
        </div>
        <!--分页 end-->
    <%-- </c:if> --%>
     </div>
  </div>
</div>
<script type="text/javascript">

var  $studentVideoStr=$("#studentVideoStr");
//分页方法
function PageTmp(openId,size,page){
	var courseId = $("#courseId").val();
	var videoId = $("#videoId").val();
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/statistics/videoStatisticsCheck.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"courseId":courseId,"videoId":videoId},
		  dataType: "json",
		  success: function(data){
				  if((typeof(size) == "undefined")){
					  var htmlStr = "";
					  $studentVideoStr.empty();
					  $("#pageToolbar").empty();
					  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
						PageTmp(openId,size,page);
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
	var openId=$("#course option:selected").val();
	 $studentVideoStr.empty();
	  $.each(datas, function (index, student) {
		    htmlStr+="<tr>";
			htmlStr+="<td>"+student.number+"</td>";
			htmlStr+="<td>"+student.name+"</td>";
			var startDt = new Date(student.startDt);
			htmlStr+="<td>"+startDt.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
			var lastDt = new Date(student.lastDt);
			htmlStr+="<td>"+lastDt.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
			htmlStr+="</tr>";
		});
	  $studentVideoStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
	PageTmp();
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});
$(function(){
	$(".search").click(function(){
		var openId='${page.openId}';
		document.location.href="toVideoStatistics.html?openId="+openId;	
	})  
})
</script>
</body>
</html>
