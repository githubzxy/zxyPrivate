<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程学习统计图表</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/js/echarts.min.js"></script><!-- 统计图插件 -->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">课程学习统计图表</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>课程学习统计图表</span></div>
     <div class="padding5">
      <div id="csc_char" style="width: 800px;height:500px;">
        
      </div>
     </div>
  </div>
</div>
<input type= "hidden" name ="selectedStudentTotal" id="selectedStudentTotal" value="${requestScope.openCourseVo2.selectedStudentTotal}" />
<input type= "hidden" name ="examPeopleTotal" id="examPeopleTotal" value="${requestScope.openCourseVo2.examPeopleTotal}" />
<input type= "hidden" name ="videohits" id="videohits" value="${requestScope.openCourseVo2.videohits}" />
<input type= "hidden" name ="taskhits" id="taskhits" value="${requestScope.openCourseVo2.taskhits}" />
<input type= "hidden" name ="examinehits" id="examinehits" value="${requestScope.openCourseVo2.examinehits}" />
<input type= "hidden" name ="discusshits" id="discusshits" value="${requestScope.openCourseVo2.discusshits}" />
<input type= "hidden" name ="passPeople" id="passPeople" value="${requestScope.openCourseVo2.passPeople}" />
<input type= "hidden" name ="courseName" id="courseName" value="${requestScope.openCourseVo2.courseName}" />
<script>
  $(function(){
    // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('csc_char'));
    
		var selectedStudentTotal = $("#selectedStudentTotal").val();
		var examPeopleTotal = $("#examPeopleTotal").val();
		var videohits = $("#videohits").val();
		var taskhits = $("#taskhits").val();
		var discusshits = $("#discusshits").val();
		var examinehits = $("#examinehits").val();
		var passPeople = $("#passPeople").val();
		var courseName = $("#courseName").val();
       function fetchData(cb) {
           // 通过 setTimeout 模拟异步加载
           setTimeout(function () {
               cb({
                   categories: ["选课人数","考试人数","视频点击量","作业提交数","考试提交数","讨论发布数","通过人数"],
                   data: [selectedStudentTotal, examPeopleTotal, videohits, taskhits,examinehits,discusshits,passPeople]
               });
           }, 1000);
       }

       // 初始 option
        var option = {
           color: ['#3398DB'],
           title: {
               text: courseName
           },
           tooltip: {},
           legend: {
               data:['数量']
           },
           xAxis: {
               data: []
           },
           yAxis: {},
           series: [{
               name: '数量',
               type: 'bar',
               data: []
           }]
       };

       fetchData(function (data) {
           myChart.setOption({
               xAxis: {
                   data: data.categories
               },
               series: [{
                   // 根据名字对应到相应的系列
                   name: '次',
                   data: data.data
               }]
           });
       });

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
  })
  
</script>

</body>
</html>
