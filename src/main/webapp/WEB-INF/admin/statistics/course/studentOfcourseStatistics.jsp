<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程学习统计查看</title>
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
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">课程学习统计查看</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
	<input type="hidden" name="openId" id="openId" value="${openId }"/>
     <ul class="prosearch">
       <li>
           <i>学号:</i><a><input name="" value="" id="studentNumber" class="input-text" placeholder="学号全称" type="text"></a>
           <i>名字:</i><a><input name="" value="" id="studentName" class="input-text" placeholder="名字关键字" type="text"></a>
            <i>年级:</i>
                <a>
                   <select name="gradeId" class="select" id ="selectGrade" onchange="getCla()"> 
                      <option value="">请选择年级</option> 
                       <c:forEach items="${grades}" var="grade" varStatus="status">
                       <option value="${grade.gradeId}" <c:if test="${grade.gradeId==page.gradeId}">selected</c:if>>${grade.name}</option>
                       </c:forEach>
                    </select>
                </a>
                <i>班级:</i>
                <a>
                   <select name="classId" class="select changeClass" id="selectClass" > 
                    <option value="">请选择班级</option>
                     <c:forEach items="${classes}" var="cla" varStatus="status">
                       <option value="${cla.classId}" <c:if test="${cla.classId==page.classId}">selected</c:if>>${cla.name}</option>
                       </c:forEach>
                    </select>
                </a>
           <i>考试成绩:</i><a><input name=""  id="MinmyexameGrade" class="input-text" placeholder="" type="text" style="width:50px;" ></a>
           <i>--</i><a><input name="" id="MaxmyexameGrade" class="input-text" placeholder="" type="text" style="width:50px;" ></a>
           <i>视频观看率:</i><a><input name=""  id="MinMyvideoPercent" class="input-text" placeholder="" type="text" style="width:50px;" ></a>
           <i>--</i><a><input name=""  id="MaxMyvideoPercent" class="input-text" placeholder="" type="text" style="width:50px;" ></a><i>%</i>
            <a><input name="" class="search" value="查询" type="button"></a>
       </li>
    </ul>

     <div class="formtitle"><span>课程学习统计查看</span></div>
     <div class="padding5">
      <table class="tablelist">
          <thead>
              <tr>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>学&nbsp;&nbsp;号</th>
                    <th>姓&nbsp;&nbsp;名</th>
                    <th>年&nbsp;&nbsp;级</th>
                    <th>班&nbsp;&nbsp;级</th>
                    <th>视频进度</th>
                    <th>观看数量</th>
                    <th>作业进度</th>
                    <th>讨论进度</th>
                    <th>考试进度</th>
                    <th>考试成绩</th>
                    <th>目前综合得分</th>
                </tr>
            </thead>
            <tbody id="studentStr"> 
                
               <c:forEach items = "${requestScope.studentCourseVo2s}" var = "list" varStatus="status">
                <tr>
                    <td>${status.index+1+(page.pageNum-1)*page.pageSize}</td>
                    <td>${list.studentNumber}</td>
                    <td>${list.studentName}</td>
                    <td>${list.myvideoPercent}%</td>
                    <td>${list.videoCount}</td>
                    <td>${list.myTaskPercent}%</td>
                    <td>${list.mydiscussPercent}%</td>
                    <td>${list.myexamePercent}%</td>
                    <td>${list.myexameGrade}分</td>
                    <td>${list.myFinalGrade}分</td>
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
var  $studentStr=$("#studentStr");
var openId = $("#openId").val();
//分页方法
function PageTmp(studentNumber,studentName,classId,gradeId,MinmyexameGrade,MaxmyexameGrade,MinMyvideoPercent,MaxMyvideoPercent,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/statistics/studentOfCourseStatistics.html",
		  processData:true,
		  data:{
			  "pageSize":size,
			  "pageNum":page,
			  "openId":openId,
			  "studentNumber":studentNumber,
			  "studentName":studentName,
			  "classId":classId,
			  "gradeId":gradeId,
			  "MinmyexameGrade":MinmyexameGrade,
			  "MaxmyexameGrade":MaxmyexameGrade,
			  "MinMyvideoPercent":MinMyvideoPercent,
			  "MaxMyvideoPercent":MaxMyvideoPercent
			  },
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $studentStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(studentNumber,studentName,classId,gradeId,MinmyexameGrade,MaxmyexameGrade,MinMyvideoPercent,MaxMyvideoPercent,size,page);
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
	$studentStr.empty();
	  $.each(datas, function (index, student) {
		    htmlStr+="<tr>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+student.studentNumber+"</td>";
			htmlStr+="<td>"+student.studentName+"</td>";
			htmlStr+="<td>"+student.gradeName+"</td>";
			htmlStr+="<td>"+student.className+"</td>";
			htmlStr+="<td>"+student.myvideoPercent+"%</td>";
			htmlStr+="<td>"+student.videoCount+"</td>";
			htmlStr+="<td>"+student.myTaskPercent+"%</td>";
			htmlStr+="<td>"+student.mydiscussPercent+"%</td>";
			htmlStr+="<td>"+student.myexamePercent+"%</td>";
			htmlStr+="<td>"+student.myexameGrade+"分</td>";
			htmlStr+="<td>"+student.myFinalGrade+"分</td>";
			htmlStr+="</tr>";
});
	  $studentStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
	var studentNumber=$("#studentNumber").val();
	var studentName = $("#studentName").val();
	var MinmyexameGrade =$("#MinmyexameGrade").val();
	var MaxmyexameGrade = $("#MaxmyexameGrade").val();
	var MinMyvideoPercent = $("#MinMyvideoPercent").val();
	var MaxMyvideoPercent = $("#MaxMyvideoPercent").val();
	var classId=$("#selectClass").val();
	var gradeId=$("#selectGrade").val();
	PageTmp(studentNumber,studentName,classId,gradeId,MinmyexameGrade,MaxmyexameGrade,MinMyvideoPercent,MaxMyvideoPercent);
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});	
var oneArr = ['1班','2班','3班','4班'];
var twoArr = ['2班','3班','4班','5班'];
var threeArr = ['3班','4班','5班','6班'];
var changeArr = [oneArr,twoArr,threeArr];

function changeMethod(obj) {
  var tmpArr = changeArr[$(obj).get(0).selectedIndex];
  $(".changeClass").html("");
  for (var i = 0; i < tmpArr.length; i++) {
    $(".changeClass").html($(".changeClass").html() + '<option>'+ tmpArr[i] +'</option>' );
  };
  
}


function getCla(gradeId){
	var gradeId=$("#selectGrade").val();
	    
		$.ajax({
			type:"post",
			url:"${res}/admin/student/getClassByGrade.html",
			data:{gradeId:gradeId},
			
			success:function(result){
				var jsonList = eval("(" +result+ ")") ;

			 if(jsonList==null||jsonList==''){
				alert("该年级尚未创建班级");
			}else{
				
				var select=document.getElementById('selectClass'); 
				select.options.length=0;
				
				for(var i=0;i<jsonList.length;i++){
				
				var op=document.createElement("option");      // 新建OPTION (op) 
				op.setAttribute("value",jsonList[i].classId);          // 设置OPTION的 VALUE 
				op.appendChild(document.createTextNode(jsonList[i].name)); // 设置OPTION的 TEXT
				select.appendChild(op);           // 为SELECT 新建一 OPTION(op)

				}
			}  
			
		},
		
		});
			
		
	}
</script>
</body>
</html>
