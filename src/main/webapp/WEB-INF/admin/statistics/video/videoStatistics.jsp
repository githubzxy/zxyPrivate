<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>视频观看统计</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<!-- <link href="plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" /> -->
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">视频观看统计</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">

     <ul class="prosearch">
       <li>
           <i>课程:</i>
           <a>
               <select name="courseSelect" class="select" id="course"> 
               	<!-- 	<option value="">请选择</option> -->
               <c:forEach items="${courses}" var="course">
                  <option value="${course.openId}">
                ${course.courseName}(<fmt:formatDate value="${course.createDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>-<fmt:formatDate value="${course.createDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>)</option> 
               </c:forEach>
                </select>
            </a>
            <a><input name="" class="search" value="搜索" type="button"/></a>
       </li>
    </ul>

     <div class="formtitle"><span>视频观看统计</span></div>
     <div class="padding5" id="video">
     <%-- <c:if test="${empty videos}">
         <p>该课程下暂无视频</p>
       </c:if>
         <c:if test="${!empty videos}"> --%>
      <table class="tablelist">
          <thead>
              <tr>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>视频名称</th>
                    <th>观看人数</th>
                    <th class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="videos" class="videoStr"> 
            <c:forEach items="${videos}" var="video" varStatus="status">
                <tr>
                    <td>${status.index+1+(page.pageNum-1)*page.pageSize}</td>
                    <td>${video.name}</td>
                    <td>${video.watchNumber}</td>
                    <td>
                       <span class="pl25 ml15">
                           <a href="videoStatisticsCheck.html?courseId=${page.openId}&&videoId=${video.videoId}&&videoName=${video.name}" class="ext_btn ext_btn_success">查看详情</a>
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
     </div>
  </div>
</div>
<script type="text/javascript">
var  $videoStr=$(".videoStr");
//分页方法
function PageTmp(openId,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/statistics/videoStatistics.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"courseId":openId},
		  dataType: "json",
		  success: function(data){
				  if((typeof(size) == "undefined")){
					  var htmlStr = "";
					  $videoStr.empty();
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
	$videoStr.empty();
	  $.each(datas, function (index, video) {
		    htmlStr+="<tr>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+video.name+"</td>";
			htmlStr+="<td>"+video.watchNumber+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl5'>";
			if(video.watchNumber==0){
				htmlStr+='<a href="javascript:;" class="ext_btn ext_btn_success">查看详情</a>';
			}else{
				htmlStr+='<a href="${res}/admin/statistics/videoStatisticsCheck.html?courseId='+openId+'&videoId='+video.videoId+'" class="ext_btn ext_btn_success">查看详情</a>';
			} 
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
		});
	  $videoStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
	var openId=$("#course option:selected").val();
	PageTmp(openId);
})

//初始化时就调用
$(function(){
	/* $("select[name='courseSelect']").find("option").first().attr("selected", "true"); */
	var openId= $('#course option:selected') .val();
	 PageTmp(openId); 
});	

</script>
</body>
</html>