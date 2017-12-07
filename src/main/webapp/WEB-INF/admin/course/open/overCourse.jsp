<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>结课列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
</head>
<body>
<% java.util.Date nowdate=new java.util.Date();
	request.setAttribute("now", nowdate);
%>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">结课</a></li>
    </ul>
</div>
<div class="rightinfo">
    <ul class="prosearch">
           <li> 
               <i>课程名称:</i><a><input name="name" class="input-text code" placeholder="课程关键字" type="text" value=""/></a>
               <i>课程类别:</i>
                <a>
                   <select name="" class="select" id = "courseType"> 
                      <option value="">------选择课程类别------</option> 
                       <c:forEach items="${requestScope.courseTypePos}" var = "list">
	                      	<option value="${list.courseTypeId}" >${list.typeName}</option>
	                      </c:forEach> 
                    </select>
                </a>
                <i>课程名称:</i>
                 <a>  <select name="" class="select" id = "course">
                     <option value="">------选择课程名称------</option> 
                     <c:if test="${courseId!=null}">
						 <option value="${courseId}" selected = "selected">${courseName}</option> 
					 </c:if>             
                    </select>
                  </a>
                <i>是否结课:</i>
                <a>
                   <select name="" class="select" id = "isEnd">  
                      <option value = "">------请选择------</option> 
                       <option value="1" <c:if test="${isEnd==1}">selected = "selected"</c:if>
                       >是</option>
                      <option value="0" <c:if test="${isEnd==0}">selected = "selected"</c:if>
                      >否</option>
                    </select>
                </a>
                <a><input name="" class="search" value="查询" type="button"></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>结课</span></div>
         <table class="tablelist">
          <thead>
              <tr>
                    <th><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th>编&nbsp;&nbsp;号</th>
                    <th>课程名称</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>任课教师</th>
                    <th>课程学分</th>
                    <th>通过分数</th>
                    <th>是否结课</th>
                    <th>排&nbsp;&nbsp;序</th>
                    <th class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="openStr"> 
			<c:forEach items ="${requestScope.openCourseVos}" var = "list"   varStatus="status">
               <tr>
                    <td><input name="ur_checkbox" value="" type="checkbox" /></td>
                    <td>${status.index+1+(page.pageNum-1)*page.pageSize}</td>
                    <td>${list.courseName}</td>
                    <td><fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${list.createDate}" /></td>
                    <td><fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${list.finishDate}" /></td>
                    <td>${list.userPo.name}</td>
                    <td>${list.studyScore}</td>
                    <td>${list.passScore}</td>
                    <td>${list.sort}</td>
                    <c:set var="now" value="${requestScope.now}"> </c:set>
                    <c:if test="${list.state==1}">
                    	<td><input class="ext_btn ext_btn_error" id="over" onclick="over(${list.openId});" value="结课" type="button" /></td>
                    </c:if>
                    <c:if test="${list.state==2}"> 
                    <td><input class="ext_btn ext_btn_submit mr20" id="over"  value="已结课" type="button" /></td>
                    </c:if>
                   
                </tr>
			 </c:forEach>
               
            </tbody>
        </table>
       <!--分页-->
        <div class="pagin" id="pageToolbar">
        </div>
        <!--分页 end-->
     </div>
</body>
<script type="text/javascript">
 $("#courseType").change(function(){
    		 var courseTypeId=$("#courseType option:selected").val();
    		  $.ajax({
	  				 url:'${res}/admin/course/findCourseNamebyTypeId.html', 
	            	type:'post',
	 	           	 dataType:'json',
	 	         	 contentType : "application/x-www-form-urlencoded",
	 	         	 data:{
	 	         		courseTypeId:courseTypeId
	 	            },
	 	           success : function(data){
						if(data.flag=="1"){
							$("#course").find("option").remove();
							 $("#course").append('<option value=""> -----选择课程名称-----</option>'); 
		            		$.each(data.coursePos,function(key,val){

		            			$("#course").append('<option value="' + val.courseId + '">' + val.courseName + '</option>');
		            			
		            		});
						
						};
					},
	 	          error:function(e){
	 	        	  alert("error");
	 	          }  
	  				});
    		 
    	 }) 
var  $openStr=$("#openStr");
 //分页方法
 function PageTmp(courseName,courseTypeId,courseId,isEnd,size,page){
 	var htmlStr = "";
 	$.ajax({
 		  type: "POST",
 		  url: "${res}/course/open/toOverCourse.html",
 		  processData:true,
 		  data:{"courseName":courseName,"courseTypeId":courseTypeId,'pageSize':size,'pageNum':page,'courseId':courseId,'isEnd':isEnd},
 		  dataType: "json",
 		  success: function(data){
 			  if((typeof(size) == "undefined")){
 				  var htmlStr = "";
 				  $openStr.empty();
 				  $("#pageToolbar").empty();
 				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
 					console.log(arguments); 
 					PageTmp(courseName,courseTypeId,courseId,isEnd,size,page);
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
 	 $openStr.empty();
 	$.each(datas, function (index, openCourse) {
 		//var date = subject.createDate;
 		//alert(subject.createDate/1000);
 			htmlStr+="<tr>";
 			htmlStr+="<td><input name='ur_checkbox' value='"+openCourse.openId+"' type='checkbox' id="+openCourse.openId+"></td>";
 			htmlStr+="<td>"+(++startIndex)+"</td>";
 			htmlStr+="<td>"+openCourse.courseName+"</td>";
 			var createDate = new Date(openCourse.createDate);
 			var finishDate = new Date(openCourse.finishDate);
 			htmlStr+="<td>"+createDate.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
 			htmlStr+="<td>"+finishDate.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
 			htmlStr+="<td>"+openCourse.userPo.name+"</td>";
 			htmlStr+="<td>"+openCourse.studyScore+"</td>";
 			htmlStr+="<td>"+openCourse.passScore+"</td>";
 			if (openCourse.state == 2) {
				htmlStr+='<td class="f00 stauts">已结课</td>';
	         } 
			if(openCourse.state == 1){
	            htmlStr+='<td class="green stauts">未结课</td>';
	        }
 			htmlStr+="<td>"+openCourse.sort+"</td>";
 			htmlStr+="<td>";
 			htmlStr+="<span class='pl25 ml15'>";
 			if(openCourse.state == 1){
 				htmlStr += '<input class="ext_btn ext_btn_error" id="over" onclick="over('+openCourse.openId+');" value="结课" type="button" />';
 			}else if(openCourse.state == 2){
 				htmlStr += '<input class="ext_btn ext_btn_submit mr20" id="over"  value="已结课" type="button" />';
 			}
 			htmlStr+="</span> ";
 			htmlStr+="</td> ";
 			htmlStr+="</tr>";
      });
 		  $openStr.append(htmlStr);
 }

 //搜索条件查询列表
 $(".search").click(function(){
 		var courseName=$("input[name='name']").val();
 		var courseTypeId=$("#courseType option:selected").val();
 		var courseId=$("#course option:selected").val();
 		var isEnd = $("#isEnd option:selected").val();
 		PageTmp(courseName,courseTypeId,courseId,isEnd);
 		
 })

 //初始化时就调用
 jQuery(function ($) {
 	 PageTmp(); 
 });      	
    	 
 $(".paginList .paginItem").click(function(){
		 		var pageNum =  $(this).find("a").text();
				 var courseId = $("#course option:selected").val();
				 var isEnd= $("#isEnd option:selected").val();
				 var courseName = $("#course option:selected").text();
				 if(courseId==0){
					 courseId="";
				 }
				 if(isEnd==2){
					 isEnd="";
				 }

				window.location.href="${res}/course/open/toOverCourse.html?courseId="+courseId+"&isEnd="+isEnd+"&pageNum="+pageNum+"&courseName="+courseName;
  		})
  		
function over(openId){
	 var openId = openId;
	 layer.confirm('你确定结课吗？',{con: 3, title:'提示'},function(){ 
 		layer.closeAll();
	 $.ajax({
	  	 url:'${res}/course/open/over.html',
         type:'post',
         dataType:'json',
      	 contentType : "application/x-www-form-urlencoded",
         data:{
     	   openId:openId
         	
         },
         success : function(data){
     	   
			
		
			if(data.flag=="1"){
				 layer.confirm('结课成功',{con: 3, title:'提示'},function(){ 
				 		layer.closeAll();
			window.location.href="${res}/course/open/toOverCourse.html";
				 })
			}
		}
	  	})
	 });
 } 		
    	 
 </script>   	 
</html>