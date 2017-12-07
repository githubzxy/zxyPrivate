<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生信息列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
     <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">查看选课学生列表</a></li>
    </ul>
</div>
<div class="rightinfo">
   
    <ul class="prosearch">
           <li>
           	   <input type="hidden" name = "openId" id = "openId" value="${requestScope.openId}"/>
               <i>按姓名:</i><a><input name="" id = "name" class="input-text" placeholder="学生姓名" type="text" value="${requestScope.name}" /></a>
               <i>按学号:</i><a><input name="" id = "number" class="input-text" placeholder="学号" type="text" value="${requestScope.number}" /></a>
               
                <a><input name="" class="search" value="查询" type="button" /></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>学生信息列表</span></div>

         <table class="tablelist">
          <thead>
              <tr>
                    <th width=""><input name="ur_allSelect" value="" type="checkbox" id="allSelect" /></th>
                    <th width="">序&nbsp;&nbsp;号</th>
                    <th width="">姓&nbsp;&nbsp;名</th>
                    <th width="">学&nbsp;&nbsp;号</th>
                    <th width="">年&nbsp;&nbsp;级</th>
                    <th width="">班&nbsp;&nbsp;级</th>
                    <th width="" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="studentStr"> 
            
            <c:forEach items ="${requestScope.studentForms}" var = "list"   varStatus="status">
                <tr>
                    <td><input name="ur_checkbox" value="" type="checkbox" /></td>
                     <td>${status.index+1+(page.pageNum-1)*page.pageSize}</td>
                     <td>${list.name}</td>
                     <td>${list.number}</td>
                     <td>${list.gradeName}</td>
                     <td>${list.className}</td>
                    <td>
                       <span class="pl25 ml15">
                           <input class="ext_btn ext_btn_error" value="删除"  onclick="delById(${list.studentId});" type="button" />
                       </span> 
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
 		<!--分页-->
        <div class="pagin" id="pageToolbar">
            
        </div>
        </div>
        <!--分页 end-->
     </div>
     <script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script>
 <script type="text/javascript">

 var  $studentStr=$("#studentStr");
 //分页方法
 function PageTmp(openId,name,number,size,page){
 	var htmlStr = "";
 	$.ajax({
 		  type: "POST",
 		  url: "${res}/course/open/toOpenCourseStudents.html",
 		  processData:true,
 		  data:{"openId":openId,"name":name,'pageSize':size,'pageNum':page,'number':number},
 		  dataType: "json",
 		  success: function(data){
 			  if((typeof(size) == "undefined")){
 				  var htmlStr = "";
 				  $studentStr.empty();
 				  $("#pageToolbar").empty();
 				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
 					console.log(arguments); 
 					PageTmp(openId,name,number,size,page);
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
 			htmlStr+="<td><input name='ur_checkbox' value='"+student.openId+"' type='checkbox' id="+student.openId+"></td>";
 			htmlStr+="<td>"+(++startIndex)+"</td>";
 			htmlStr+="<td>"+student.name+"</td>";
 			htmlStr+="<td>"+student.number+"</td>";
 			htmlStr+="<td>"+student.gradeName+"</td>";
 			htmlStr+="<td>"+student.className+"</td>";
 			htmlStr+="<td>";
 			htmlStr+="<span class='pl25 ml15'>";
 			htmlStr+='<input class="ext_btn ext_btn_error" value="删除"  onclick="delById('+student.studentId+');" type="button" />';
 			htmlStr+="</span> ";
 			htmlStr+="</td> ";
 			htmlStr+="</tr>";
      });
 		  $studentStr.append(htmlStr);
 }

 //搜索条件查询列表
 $(".search").click(function(){
	 var name = $("#name").val();
	 var number = $("#number").val();
	 var openId = $("#openId").val(); 
 	 PageTmp(openId,name,number);
 })

 //初始化时就调用
 jQuery(function ($) {
	 var openId = $("#openId").val(); 
 	 PageTmp(openId); 
 });

 function delById(studentId){
		 var studentId = studentId;
		 var openId = $("#openId").val(); 
		 var s=confirm("你确定删除选中的学生吗？");
		 if(s){
			 $.ajax({
			  		url:'${res}/course/open/delCourseStudent.html',
		         	type:'post',
		        	dataType:'json',
		      		contentType : "application/x-www-form-urlencoded",
		       data:{
		    	   studentId:studentId,
		         	openId:openId
		         },
		        success : function(data){
					if(data.flag=="1"){
						alert("删除成功");
		            		window.location.href="${res}/course/open/toOpenCourseStudents.html?openId="+openId;
					}else{
						alert("删除失败")
					}
				},error:function(){
					alert("删除失败");
				}
			  	})
	
	
		 }
 }
</script>    
</body>
</html>