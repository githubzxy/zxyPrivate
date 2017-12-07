<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
<title>个人中心-亚卓数字教学中心</title>
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/student/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/student/css/vip.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<!--/js-->
</head>
<body>
<%@ include file="/WEB-INF/study/comm.jsp" %>
 <!--vip_center-->
   <div class="vip_center">
         <!--图片文字导航-->
      	 <ul class="pic_nav">
      	 	<li>
      	 	  <a href="${res}/work/getHomeWork.html">
	              <div class="img"><img src="${res}/student/img/c2.png"></div>
	              <div class="jianhao ar">${hwCount}</div>
	              <div class="title_l">我的作业</div>
              </a>
            </li><!--单条-->

            <li>
      	 	  <a href="${res}/student/test/toMyTest.html">
	              <div class="img"><img src="${res}/student/img/c3.png"></div>
	              <div class="jianhao ar">${myTestcount}</div>
	              <div class="title_l">我的考试</div>
              </a>
            </li><!--单条-->

            <li>
      	 	  <a href="${res}/study/toPassCourse.html">
	              <div class="img"><img src="${res}/student/img/c4.png"></div>
	              <div class="jianhao ar">1</div>
	              <div class="title_l">成绩查询</div>
              </a>
            </li><!--单条-->

            <li>
      	 	  <a href="${res}/pro/list.html">
	              <div class="img"><img src="${res}/student/img/c5.png"></div>
	              <div class="jianhao ar">${openCourseVos.size()}</div>
	              <div class="title_l">学习进度</div>
              </a>
            </li><!--单条-->
      	 </ul>
      	 <!--图片文字导航-->

      	 <!--其他动态-->
            <div class="vip_common_box vip_class_resource_box">
            	 <!--标题-->
               <div class="vip_class_resource_title">
                   <span class="on">我要选课</span>
                   <span>已选课程</span>
               </div>
               <!--/标题-->

				  <!--列表(我要选课)-->
                  <div class="class_resource" id="noSelected" >
                     <div class="vip_shuaixuan" >
                        <dl style="margin-top:10px;">
                          <dt style="margin:0;">课程名称：</dt>
                          <dd>
                            <input class="text" id="anotherKeyWords"  value="" onfocus="if(this.value=='请输入课程关键词'){this.value=''}" onblur="if(this.value==''){this.value='请输入课程关键词'}" type="text">
                            <a  class="btn1 btn2"  onclick="page1(1)">查询</a>
                          </dd>
                       </dl>
                       </div> 
                       <c:forEach items = "${requestScope.openCourseVos2}" var = "list" varStatus="status">
                       <div class="li">
                          <div class="img">
                          		<c:if test="${list.maxUrl != null}">
					           	<img src="<%=url %>/${list.maxUrl }" alt="" />
					           </c:if>
					           <c:if test="${list.maxUrl  == null}">
					           <img src="${res}/student/img/test/2.png">
					           </c:if>
           				</div>
                          <div class="txt">
                             <h2>${list.courseName}</h2>
                             <p>讲师：${list.lecturerName }</p>
                             <p>课时：<font class="ar">${list.classhour }</font>课时</p>
                             <div class="alink">
                                <a  class="l" onclick="add(${list.openId})">我要学习</a>
                                	<input type="hidden" value="${list.openId}"/> 
                                <a href="${res}/main/toChapter.html?openId=${list.openId}" class="r">查看课程</a>
                             </div>
                          </div>
                       </div><!--单条数据--> 
                       </c:forEach>
                        <!--分页-->
    <div class="page2">
      <c:set var="pageNum" value="${requestScope.page2.pageNum}"></c:set>
      <c:set var="pageCount" value="${requestScope.page2.pageCount}"></c:set>
      <a  onclick="page1(1)">上一页</a>
     <c:set var="pageNum" value="${requestScope.page2.pageNum}"></c:set>
      <c:forEach var = "i" begin="1" end="${requestScope.page2.pageCount}" step="1">
                             		<c:if test="${i==pageNum}"><span>${i}</span></c:if>
                             		<c:if test="${i!=pageNum}"><a class="paginItem1" onclick="page1(${i})">${i}</a></c:if>
      </c:forEach>
      <a onclick="page1(2)"
      >下一页</a>
    </div>
    <!--/分页-->
    </div>
               <!--列表-->


                <!--列表(我的课程)-->
                  <div class="class_resource resource" id="isSelected" style="display:none;">
                       <!--已选课程-->
                       <div class="vip_shuaixuan">
                        <dl style="margin-top:10px;">
                          <dt style="margin:0;">课程名称：</dt>
                          <dd>
                            <input class="text" id="keyWords" value="" onfocus="if(this.value=='请输入课程关键词'){this.value=''}" onblur="if(this.value==''){this.value='请输入课程关键词'}" type="text">
                            <a  class="btn2 btn3"  onclick="page2(1)">查询</a>
                          </dd>
                       </dl>
                       </div>
                    <!--/已选课程-->

						 <c:forEach items = "${requestScope.openCourseVos}" var = "list" varStatus="status">
                       	<div class="li ${list.openId}">
                          <div class="img">
                          		<c:if test="${list.maxUrl != null}">
					           	<img src="<%=url %>/${list.maxUrl }" alt="" />
					           </c:if>
					           <c:if test="${list.maxUrl  == null}">
					           <img src="${res}/student/img/test/2.png">
					           </c:if></div>
                          <div class="txt">
                           <h2>${list.courseName}</h2>
                           <c:set var="testStr"  value="${list.courseInfo}"/>
                          <p>
                          <c:choose>  
							    <c:when test="${fn:length(testStr) > 40}">  
							        <c:out value="${fn:substring(testStr, 0, 40)}......" />  
							    </c:when>  
							   <c:otherwise>  
							      <c:out value="${testStr}" />  
							    </c:otherwise>  
						  </c:choose>  
                          
                          </p>                          
                            <div class="alink">
                                <a  <%-- href="${res}/main/toCoursePlay.html?openId=${list.openId}" --%> onclick="toStudy(${list.studyStartDateStr},${list.studyEndDateStr},${list.openId})"   class="l">继续学习</a>
                                <input type="hidden"   value="${list.studentId}"/>
                                <a  class="r delselect" onclick="del(${list.studentId},${list.openId})">退选课程</a>
                                <input type="hidden"  value="${list.openId}"/>
                                <span>已学<font class="ar1">0</font>章节/<font class="ar1">${list.allChapterCount}</font>章</span>
                                <span><font class="ar"><fmt:formatDate pattern="yyyy-MM-dd" 
            											value="${list.createDate}" /></font></span>
                             </div>
                           </div>
                       </div><!--单条数据-->
                       </c:forEach>
                                                   
    <!--分页-->
    <div class="page2">
      <c:set var="pageNum1" value="${requestScope.page1.pageNum}"></c:set>
      <c:set var="pageCount1" value="${requestScope.page1.pageCount}"></c:set>
      <a onclick="page2(1)">上一页</a>
      
      <c:forEach var = "i" begin="1" end="${requestScope.page1.pageCount}" step="1">
                             		<c:if test="${i==pageNum1}"><span>${i}</span></c:if>
                             		<c:if test="${i!=pageNum1}"><a class="paginItem2"  onclick="page2(${i})">${i}</a></c:if>
      </c:forEach>
      <a onclick="page2(2)">下一页</a>
    </div>
    <!--/分页-->
                  </div>
               <!--列表-->


            </div>
      	 <!--/其他动态-->
   </div>
   <!--/vip_center-->

<!--/vip_right-->
   <div class="vip_right">
      <!--article_box_list-->
   	  <div class="article_box_list" style="margin-top:0;">
            <div class="article_box_title"><span class="txt_title">最新通知</span></div>
            
            <ul>
                  <c:forEach items = "${requestScope.messagePos}" var = "list" varStatus="status">
            <li><a href="${res}/admin/message/detail.html?messageId=${list.messageId}" title="#">
            <c:set var="content"  value="${list.title}"/>
             <c:choose>  
				    <c:when test="${fn:length(content) > 15}">  
				        <c:out value="${fn:substring(content, 0, 15)}..." />  
				    </c:when>  
				   <c:otherwise>  
				      <c:out value="${content}" />  
				    </c:otherwise>  
	 			</c:choose>  
                </a><font><fmt:formatDate pattern="yyyy-MM-dd" 
            				value="${list.fromDate}" /></font></li>
            </c:forEach>
                
             </ul>
      </div>
      <!--/article_box_list-->
      
      <!--article_box_list-->
      <div class="article_pic_box_list vip_common_box">
           <div class="article_box_title"><span class="txt_title">最近讨论</span></div>
             
			<c:forEach items = "${requestScope.discussVos}" var = "list" varStatus="status">
				<dl class="article_li">
               <dt><a href="###"><img src="${res}/student/img/test/3.jpg"></a></dt>
               <dd>
                 <h2>
                 <a href="${res}/study/detailDiscuss.html?themeId=${list.themeId}" title="${list.title}" target="_blank">
                 
                 	<c:choose>
	            		<c:when test="${fn:length(list.title)>9 }">
	            			${fn:substring(list.title,0,9) }...
	            		</c:when>
	            		<c:otherwise>
	            			${fn:substring(list.title,0,9) }
	            		</c:otherwise>
            		</c:choose>
                 </a>
                 </h2>
                 <P>已有：<font class="ar">${list.answerCount}</font>次讨论</p>
               </dd>
             </dl><!--单条数据-->
			</c:forEach>
      </div>
      <!--article_box_list-->
   </div>
 <!--/vip_right-->



</div>
<!--main-->

<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
</body>
<script type="text/javascript">





function add(openId){
	var openId = openId;
	layer.confirm('确认选择？',{icon: 3, title:'提示'},function(){ 
		layer.closeAll();
			$.ajax({
		  		url:'${res}/course/open/addCourseStudent.html',
	         	type:'post',
	        	dataType:'json',
	      		contentType : "application/x-www-form-urlencoded",
	       data:{
	    	   openId:openId
	         	
	         },
	        success : function(data){
	
				if(data.flag=="1"){
					layer.confirm('成功',{icon: 3, title:'提示'},function(){ 
						layer.closeAll();

				page1(1);
				page2(1);
					})
				}
			}
		  	})
	})
	
}
function del(studentId,openId){
	var studentId = studentId;
	var openId = openId;
	layer.confirm('确认退选？',{icon: 3, title:'提示'},function(){ 
		layer.closeAll();
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
				layer.confirm('退选成功',{icon: 3, title:'提示'},function(){ 
					layer.closeAll();
				page1(1);
				page2(1); 
				})
			}
		}
	  	})
	})
}

	
    function page1(pageNum){
		var keywords = $("#anotherKeyWords").val();
		$.ajax({
	  		url:'${res}/study/toNoselectedcourse2.html',
           	type:'post',
          	dataType:'json',
        	contentType : "application/x-www-form-urlencoded",
	         data:{
	       	  pageNum:pageNum,
	       	  keywords:keywords
	           	
	           },
          success : function(data){		 	        	   					
				var html1 ="";
				var pageNum1=data.page.pageNum;
				var pageCount1 = data.page.pageCount;
				$("#noSelected").empty();
				html1+="<div class='vip_shuaixuan'>";
                html1+="<dl style='margin-top:10px;'>";
                html1+="<dt style='margin:0;'>课程名称：</dt>";
                html1+="<dd>";
                html1+="<input class='text' id='anotherKeyWords' value='' type='text'>";
                html1+="<a  class='btn1 btn2'  onclick='page1(1)'>查询</a>";
                html1+="</dd>";
               	html1+="</dl>";
               	html1+="</div>"; 
				$.each(data.openCourseVos,function(key,list){
				    html1+="<div class='li'>";
					html1+="<div class='img'><a href='###'><img src='${res}/student/img/test/2.png' /></a></div>";
					 html1+="<div class='txt'>";
					 html1+="<h2>"+list.courseName+"</h2>";
					 html1+="<p>讲师："+list.lecturerName+"</p>";
					 html1+="<p>课时：<font class='ar'>"+list.classhour+"</font>课时</p>";
					html1+="<div class='alink'>";
					 html1+="<a href='javascript:alert('成功加入课程');' class='l' onclick='add("+list.openId+")'>我要学习</a>";
					html1+="<input type='hidden' value="+list.openId+" />"; 
					html1+="<a href='http://localhost:8080${res}/main/toChapter.html?openId='"+list.openId; 
					html1+=" class='r'>查看课程</a>";  
					html1+="</div>"; 
					html1+="</div>"; 
					html1+="</div>"; 
        		});
                
			    <!--分页-->
			    html1+="<div class='page2'>";
			    if(pageNum1>1){
			    	html1+= "<a id='pre' onclick='page1("+pageNum1+"-1)'";
			    }
			    if(pageNum1<=1){
			    	html1+= "<a id='pre' onclick='page1(1)'";
			    }
			    html1+=">上一页</a>";
			    for(var i=1;i<=pageCount1;i++){
			    	if(i==pageNum1){
			    		html1+="<span>"+i+"</span>";
			    	}
			    	html1+="<c:if test='"+i+"=="+pageNum1+"'><span>"+i+"</span></c:if>";
			    	if(i!=pageNum1){
			    		html1+="<a class='paginItem1'  onclick='page1("+i+")'>"+i+"</a>";
			    	}	

			    }
			    if(pageNum1<pageCount1){
			    	html1+= "<a id='pre' onclick='page1("+pageNum1+"+1)'";
			    }
			    if(pageNum1>=pageCount1){
			    	html1+= "<a id='pre' onclick='page1("+pageCount1+")'";
			    }
			    html1+=">下一页</a>";
			    html1+="</div>";
				 $("#noSelected").append(html1); 
			}
	  	})
    }
	 function page2(pageNum){
		var keywords = $("#keyWords").val();
		$.ajax({
	  		 url:'${res}/study/toSelectedCourse2.html',
         	 type:'post',
        	 dataType:'json',
      		 contentType : "application/x-www-form-urlencoded",
       data:{
     	  pageNum:pageNum,
     	  keywords:keywords
         	
         },
        success : function(data){
        	var html2 ="";
			var pageNum2=data.page.pageNum;
			var pageCount2 = data.page.pageCount;
			$("#isSelected").empty();
			html2+="<div class='vip_shuaixuan'>";
            html2+="<dl style='margin-top:10px;'>";
            html2+="<dt style='margin:0;'>课程名称：</dt>";
            html2+="<dd>";
            html2+="<input class='text' id='keyWords' value='' type='text'>";
            html2+="<a  class='btn2 btn3' onclick='page2(1)'>查询</a>";
            html2+="</dd>";
           	html2+="</dl>";
           	html2+="</div>"; 

			$.each(data.openCourseVos,function(key,list){
				var testStr =list.courseInfo;
				var ss = list.createDate2;
			    html2+="<div class='li'>";
				html2+="<div class='img'><a href='###'><img src='${res}/student/img/test/2.png' /></a></div>";
				html2+="<div class='txt'>";
				html2+="<h2>"+list.courseName+"</h2>";
                html2+="<p>"+testStr+"";	
                html2+="</p>";
				html2+="<div class='alink'>";				
				html2+="<a onclick='toStudy("+list.studyStartDateStr+","+list.studyEndDateStr+","+list.openId+")' class='l'>继续学习</a>";
				html2+="<a class='r delselect' onclick='del("+list.studentId+","+list.openId+")'>退选课程</a>";
				html2+="<span>已学<font class='ar1'>0</font>章节/<font class='ar1'>"+list.allChapterCount+"</font>章</span>";
				html2+="<span><font class='ar'>"+ss+"</font></span>";
				html2+="</div>"; 
				html2+="</div>"; 
				html2+="</div>"; 
    		});
            
		    <!--分页-->
		    html2+="<div class='page2'>";
		    if(pageNum2>1){
		    	html2+= "<a id='pre' onclick='page2("+pageNum2+"-1)'";
		    }
		    if(pageNum2<=1){
		    	html2+= "<a id='pre' onclick='page2(1)'";
		    }
		    html2+=">上一页</a>";
		    for(var i=1;i<=pageCount2;i++){

		    	if(i==pageNum2){
		    		html2+="<span>"+i+"</span>";
		    	}
		    	if(i!=pageNum2){
		    		html2+="<a class='paginItem1'  onclick='page2("+i+")'>"+i+"</a>";
		    	}	
		    }
		    if(pageNum2<pageCount2){
		    	html2+= "<a id='pre' onclick='page2("+pageNum2+"+1)'";
		    }
		    if(pageNum2>=pageCount2){
		    	html2+= "<a id='pre' onclick='page2("+pageCount2+")'";
		    }
		    html2+=">下一页</a>";
		    html2+="</div>";
			$("#isSelected").append(html2);
        
        }
        
	 })
	 }
	 
	 var resultStr;
	 function toStudy(startDate,endDate,openId){
	 	//判断是否可以学习
	 	  if(isStudy(startDate,endDate)){
	 		 window.location.href="${res}/study/toCoursePlay.html?openId="+openId; 
	 	}else{
	 		  layer.alert(resultStr,{icon:2});  
	 	}; 

	 }
	 function isStudy(startDate,endDate){
	 	var currentDate = new Date().getTime();
	 	if(currentDate-startDate>0&&currentDate-endDate<0){
	 		return true;
	 	}else if(currentDate-startDate<0){
	 		resultStr = "还未到学习时间";
	 		return false;
	 	}else{
	 		resultStr = "学习时间已截止";
	 		return false;
	 	}
	 } 
	 

	
</script>
</html>

   