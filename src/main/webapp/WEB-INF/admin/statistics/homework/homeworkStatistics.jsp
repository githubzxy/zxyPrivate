<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>作业统计</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css">
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<!-- <link href="plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" /> -->
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">作业统计</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">

     <ul class="prosearch">
       <li>
           <i>课程:</i>
           <a>
              <select name="courseName" class="select"> 
                <option value="">全部课程</option>
                <c:forEach items="${courseList}" var="course" varStatus="status">
                       <option value="${course.openId}">${course.courseName}(<fmt:formatDate  pattern="yyyy-MM-dd HH:mm" 
            value="${course.examineStartDate}" />-<fmt:formatDate  pattern="yyyy-MM-dd HH:mm" 
            value="${course.examineEndDate}" />)</option>
                 </c:forEach>
                </select>
            </a>
            <i>作业:</i>
           <a><input name="title" id="title" class="input-text" placeholder="作业名称关键字" type="text" /></a>
            <a><input name="" class="search" value="搜索" type="button"></a>
       </li>
    </ul>

     <div class="formtitle"><span>作业统计</span></div>
     <div class="padding5">
      <table class="tablelist">
          <thead>
              <tr>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>作业名</th>
                    <th>课程名称</th>
                    <th>所属视频</th>
                    <th>提交人数</th>
                    <th>批阅份数</th>
                    <th class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="hwStr"> 
                <!-- <tr>
                    <td>1</td>
                    <td>课后作业</td>
                    <td>推天道与明人生上：天地生人</td>
                    <td>0</td>
                    <td>0</td>
                    <td>
                       <span class="pl25 ml15">
                           <a href="homeworkStatisticsCheck.html" class="ext_btn ext_btn_success">查看</a>
                       </span> 
                    </td>
                </tr> -->
                
            </tbody>
        </table>
        
        <!--分页-->
       <div id="pageToolbar"></div>
        <!--分页 end-->
    
     </div>
  </div>
</div>
<script>
var $hwStr=$("#hwStr");
function PageTmp(openId,keyWords,size,page){
	var htmlStr = "";
	 $.ajax({
		 type: "POST",
		  url: "${res}/admin/statistics/homeworkStatistics.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"openId":openId,"keyWords":keyWords},
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $hwStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(openId,keyWords,size,page);
				  }}); 
			  }
			  HtmlTmp(data.page.list,htmlStr,data.page.startIndex);
		  },
		  error:function(){
			  altert("错了");
		  }
		 });
};
//抽取公共部分2
function HtmlTmp(datas,htmlStr,startIndex){
	  $hwStr.empty();
	  $.each(datas, function (index, course) {
		htmlStr+="<tr>";
		htmlStr+="<td>"+(++startIndex)+"</td>";
		htmlStr+="<td>"+course.title+"</td>";
		htmlStr+="<td>"+course.courseName+"</td>";
		htmlStr+="<td>"+course.videoName+"</td>";
		htmlStr+="<td>"+course.submitCount+"</td>";
		htmlStr+="<td>"+course.markCount+"</td>";
		htmlStr+="<td>";
		htmlStr+='<span class="pl25 ml15">';
		htmlStr+='<a onclick="homeworkStatisticsCheck('+course.id+','+course.submitCount+')" class="ext_btn ext_btn_success">查看</a>';
		htmlStr+="</span>";
		htmlStr+="</td>";
		htmlStr+="</tr>";
    });
	  $hwStr.append(htmlStr);
}
function homeworkStatisticsCheck(Id,submitCount){
	if(submitCount>0){
		document.location.href="${res }/admin/statistics/homeworkStatisticsCheck.html?Id="+Id;
	}else{
		 layer.alert("暂未有人提交作业!",{icon:5}) 
	}
}
//搜索条件查询列表
$(".search").click(function(){
	var openId=$('.select option:selected') .val();//选中的值
	var keyWords = $("#title").val();
	PageTmp(openId,keyWords);
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});

</script>

</body>
</html>
