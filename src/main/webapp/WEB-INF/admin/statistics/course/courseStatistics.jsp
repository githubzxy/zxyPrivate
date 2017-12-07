<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程学习统计</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<!-- <link href="plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" /> -->
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">课程学习统计</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">

     <ul class="prosearch">
       <li>
           <i>开课名称:</i>
           <a><input name="" id="courseName" class="input-text" placeholder="课程名称" type="text" /></a>
           <i>结课状态:</i>
            <a>
               <select name="" id="isEnd" class="select"> 
                  <option value="" >请选择</option> 
                  <option value = "1">未结课</option>
                  <option value = "2">已结课</option>
                </select>
            </a>
            <a><input name="" class="search" value="查询" type="button" /></a>
       </li>
    </ul>

     <div class="formtitle"><span>课程学习统计</span></div>
     <div class="padding5">
      <table class="tablelist">
          <thead>
              <tr>
                    <th><input name="ur_allSelect" value="" type="checkbox" id="allSelect" /></th>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>课程名称</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>选课人数(人)</th>
                    <th>考试人数(人)</th>
                    <th>视频点击量</th>
                    <th>作业提交数</th>
                    <th>考试提交数</th>
                    <th>讨论发布数</th>
                    <th>通过人数</th>
                    <th class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="courseStr"> 
	            <c:forEach items = "${requestScope.openCourseVo2s}" var = "list" varStatus="status">
	                <tr>
	                    <td><input name="ur_checkbox" value="" type="checkbox" /></td>
	                    <td>${status.index+1+(page.pageNum-1)*page.pageSize}</td>
	                    <td>${list.courseName}</td>
	                    <td>${list.studyStartDate}</td>
	                    <td>${list.studyEndDate}</td>
	                    <td>${list.selectedStudentTotal}</td>
	                    <td>${list.examPeopleTotal}</td>
	                    <td>${list.videohits}</td>
	                    <td>${list.taskhits}次</td>
	                    <td>${list.examinehits}次</td>
	                    <td>${list.discusshits}</td>
	                    <td>${list.passPeople}</td>
	                    <td>
	                       <span class="pl15">
	                        <a href="${res}/course/open/studentOfCourseStatistics.html?openId=${list.openId}" class="ext_btn ext_btn_success">查看</a>
	                        <a href="${res}/admin/statistics/toCourseStatisticschar.html?openId=${list.openId}&&courseName=${list.courseName}" class="ext_btn ext_btn_submit">图表</a>
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
var  $courseStr=$("#courseStr");
//分页方法
function PageTmp(courseName,isEnd,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/statistics/courseStatistics.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"courseName":courseName,"isEnd":isEnd},
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $courseStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(courseName,isEnd,size,page);
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
	$courseStr.empty();
	  $.each(datas, function (index, course) {
		    htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='' type='checkbox' id="+course.openId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+course.courseName+"</td>";
			var createDate = new Date(course.studyStartDate);
 			var finishDate = new Date(course.studyEndDate);
			htmlStr+="<td>"+createDate.pattern("yyyy-MM-dd");+"</td>";
			htmlStr+="<td>"+finishDate.pattern("yyyy-MM-dd");+"</td>";
			htmlStr+="<td>"+course.selectedStudentTotal+"</td>";
			htmlStr+="<td>"+course.examPeopleTotal+"</td>";
			htmlStr+="<td>"+course.videohits+"</td>";
			htmlStr+="<td>"+course.taskhits+"次</td>";
			htmlStr+="<td>"+course.examinehits+"次</td>";
			htmlStr+="<td>"+course.discusshits+"</td>";
			htmlStr+="<td>"+course.passPeople+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl5'>";
			htmlStr+='<a href="studentOfCourseStatistics.html?openId='+course.openId+'" class="ext_btn ext_btn_success">查看</a>';
			htmlStr+='<a href="toCourseStatisticschar.html?openId='+course.openId+'&&courseName='+course.courseName+'" class="ext_btn ext_btn_submit">图表</a>';
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
 });
	  $courseStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
	var courseName = $("#courseName").val();
	var isEnd=$("#isEnd option:selected").val();
	PageTmp(courseName,isEnd);
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});	
</script>
</body>
</html>
