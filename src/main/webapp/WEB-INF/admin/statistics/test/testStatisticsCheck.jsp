<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>讨论统计</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css">
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
       <li><a href="#">考试查看</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <ul class="prosearch">
       <li>
        <i>姓名:</i><a><input name="name" id="cName" class="input-text" placeholder="姓名关键字" type="text"></a>
        <i>学号:</i><a><input name="number" id="cNumber" class="input-text" placeholder="学号关键字" type="text"></a>
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
        <a><input name="" class="search" value="搜索" type="button"></a>
       </li>
    </ul>

     <div class="formtitle"><span>考试查看</span></div>
     <div class="padding5">
      <table class="tablelist">
          <thead>
              <tr>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>学&nbsp;&nbsp;号</th>
                    <th>姓&nbsp;&nbsp;名</th>
                    <th>年&nbsp;&nbsp;级</th>
                    <th>班&nbsp;&nbsp;级</th>
                    <th>电&nbsp;&nbsp;话</th>
                    <th>分&nbsp;&nbsp;数</th>
                    <th>提交时间</th>
                </tr>
            </thead>
            <tbody id="checkStr"> 
          
             <%-- <c:forEach items="${tSCList}" var="stu" varStatus="status">
                      <tr>
                    <td>${status.index+1}</td>
                    <td>${stu.number}</td>
                    <td>${stu.name}</td>
                    <td>${stu.phone}</td>
                    <td>${stu.score}</td>
                    <td><fmt:formatDate type="both" value="${stu.submitDate}" /></td>
                    <td>
                       <span class="pl15">
                        <a href="testStatisticsChar.html" class="ext_btn ext_btn_success">查看</a>
                       </span> 
                    </td>
                </tr>
             </c:forEach> --%>
            </tbody>
        </table>
      <!--分页-->
       <div id="pageToolbar"></div>
        <!--分页 end-->
    
     </div>
  </div>
</div>
<script>
var  $checkStr=$("#checkStr");
var $name= $("#cName");
var $number=$("#cNumber");
var Id = "${Id}";
//抽取公共部分1
function PageTmp(name,number,classId,gradeId,size,page){
	
	var htmlStr = "";
	 $.ajax({
		 type: "POST",
		  url: "${res}/admin/statistics/testStatisticsCheck.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"name":name,"number":number,"classId":classId,"gradeId":gradeId,"Id":Id},
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $checkStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(name,number,classId,gradeId,size,page);
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
	 $checkStr.empty();
	  $.each(datas, function (index, stu) {
		  htmlStr+="<tr>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+stu.number+"</td>";
			htmlStr+="<td>"+stu.name+"</td>";
			htmlStr+="<td>"+stu.gradeName+"</td>";
			htmlStr+="<td>"+stu.className+"</td>";
			htmlStr+="<td>"+stu.phone+"</td>";
			htmlStr+="<td>"+stu.score+"</td>";
			var submitDate = new Date(stu.submitDate);
			htmlStr+='<td>'+submitDate.pattern("yyyy-MM-dd hh:mm")+'</td>';
			htmlStr+="<td>";
			htmlStr+='</td>';
			htmlStr+='</tr>';
     });
	  $checkStr.append(htmlStr);
}
//搜索条件查询列表
$(".search").click(function(){
	var name= $name.val();
	var number=$number.val();
	var classId=$("#selectClass").val();
	var gradeId=$("#selectGrade").val();
	PageTmp(name,number,classId,gradeId);
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
