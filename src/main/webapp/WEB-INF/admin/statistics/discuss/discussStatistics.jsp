<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>讨论统计</title>
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
       <li><a href="#">讨论统计</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">

     <ul class="prosearch">
       <li>
        <i>课程:</i>
        <a>
            <select name="" class="select" id="course"> 
            	<option value="">请选择</option>
              <c:forEach items="${courses}" var="course">
                  <option value="${course.openId}">
                ${course.courseName}</option> 
               </c:forEach>
            </select>
        </a>
        <i>姓名:</i><a><input name="name" id="name" class="input-text" placeholder="姓名" type="text" value=""/></a>
        <i>学号:</i><a><input name="number" id="number" class="input-text" placeholder="学号" type="text" value=""/></a>
        <a><input name="" class="search" value="查询" type="button"/></a>
       </li>
    </ul>

     <div class="formtitle"><span>讨论统计</span></div>
     <div class="padding5">
      <%-- <c:if test="${empty themes}">
         <p>该条件下暂无讨论</p>
       </c:if>
         <c:if test="${!empty themes}"> --%>
      <table class="tablelist">
          <thead>
              <tr>
                    <th><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>学&nbsp;&nbsp;号</th>
                    <th>姓&nbsp;&nbsp;名</th>
                    <th>讨论主题</th>
                    <th>发布时间</th>
                    <th>回复数量</th>
                   <!--  <th class="text-center">操&nbsp;&nbsp;作</th> -->
                </tr>
            </thead>
            <tbody id="discussStr"> 
            <c:forEach items="${themes}" var="theme" varStatus="status">
                <tr>
                    <td><input name="ur_checkbox" value="" type="checkbox"></td>
                    <td>${status.index+1+(page.pageNum-1)*page.pageSize}</td>
                    <td>${theme.userNumber}</td>
                    <td>${theme.userName}</td>
                    <td>${theme.title}</td>
                    <td><fmt:formatDate value="${theme.createDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${theme.replyNumber}</td>
                    <td>
                       <span class="pl15">
                        <a href="discussStatisticsCheck.html" class="ext_btn ext_btn_success">查看</a>
                       </span> 
                    </td>
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
var  $discussStr=$("#discussStr");
//分页方法
function PageTmp(name,number,courseId,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/statistics/discussStatistics.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"name":name,"number":number,"courseId":courseId},
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $discussStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(name,number,courseId,size,page);
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
	$discussStr.empty();
	  $.each(datas, function (index, discuss) {
		    htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='' type='checkbox' id="+course.openId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+discuss.userNumber+"</td>";
			htmlStr+="<td>"+discuss.userName+"</td>";
			htmlStr+="<td>"+discuss.title+"</td>";
			var createDate = new Date(discuss.createDate);
			htmlStr+='<td>'+createDate.pattern("yyyy-MM-dd hh:mm:ss")+'</td>';
			htmlStr+="<td>"+discuss.replyNumber+"</td>";
			/* htmlStr+="<td>";
			htmlStr+="<span class='pl5'>";
			htmlStr+='<a href="discussStatisticsCheck.html" class="ext_btn ext_btn_success">查看</a>';
			htmlStr+="</span> ";
			htmlStr+="</td> "; */
			htmlStr+="</tr>";
});
	  $discussStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
	var name = $("#name").val();
	var number = $("#number").val();
	var courseId=$("#course option:selected").val();
	PageTmp(name,number,courseId);
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});	

</script>
</body>
</html>
