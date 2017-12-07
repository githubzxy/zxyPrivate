<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="res" value="${pageContext.request.contextPath}"/>
<jsp:useBean id="nowDate" class="java.util.Date"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
<title>个人中心-亚卓数字教学中心</title>
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/student/css/paging.css">
<link rel="stylesheet" type="text/css" href="${res}/student/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/student/css/vip.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/student/js/paging.js"></script>
<!--/js-->
</head>
<body>
<!--个人中心栏目-->
<%@ include file="/WEB-INF/study/comm.jsp" %>
<!--/个人中心栏目-->
    
   <!-- 主体右边 -->
   <div class="mian_right minHeight500">  
    <h2 class="main_right_h2">学习进度</h2>
	<c:forEach items = "${requestScope.studentCourseVos}" var = "list" varStatus="status">
    <!-- 学习进度主体 -->
    <div class="studyProgress_one">
      <!-- 学习进度左边 -->
      <div class="studyProgress_one_left fl">
       <c:if test="${list.coverPo.maxUrl != null}">
           	<img src="<%=url %>/${list.coverPo.maxUrl }" alt="" />
           </c:if>
           <c:if test="${list.coverPo.maxUrl  == null}">
           <img src="${res}/student/img/test/2.png">
           </c:if>
        <div class="studyProgress_one_left_div">
          <div class="div1">${list.openCourseName}</div>
          <div class="div2">视频：${list.videoTotalCount}集 学分${list.studyScore}分 课时：${list.classhour}课时</div>
          <div class="div3"><div style="width:<fmt:formatNumber type="number" value="${list.coursePro}" pattern="0.0" maxFractionDigits="1"/>%;"></div></div>
          <div class="div4">已学
          <fmt:formatNumber type="number" value="${list.coursePro}" pattern="0.0" maxFractionDigits="1"/>
          
          % 剩余<span>&nbsp;
          	<c:set var = "endDate" value="${list.studyEndDate}"></c:set>
                                 <c:set var="interval" value="${ endDate.time-nowDate.time }"/>
                                 <c:if test="${interval/1000/60/60>=0}"><fmt:formatNumber type="number" value="${interval/1000/60/60/24}" pattern="#0"/></c:if>
          						 <c:if test="${interval/1000/60/60<0}">0</c:if>
          &nbsp;</span>天</div>
          <div class="div5">考核标准：视频${list.videoPercent}% 作业${list.paperPercent}% 考试${list.examinPercent}% 讨论${list.discussPercent}%</div>
        </div>
      </div>
      <!-- 学习进度左边 end -->
      <!-- 学习进度右边 -->
      <div class="studyProgress_one_right fr">
        <ul class="studyProgress_items">
          <li class="li_active">听课</li>
          <li>作业</li>
          <li>讨论</li>
          <li>考试</li>
        </ul>
        <div class="studyProgress_time">学习时间：
        <fmt:formatDate pattern="yyyy-MM-dd" 
            				value="${list.studyStartDate}" />
        --
        <fmt:formatDate pattern="yyyy-MM-dd" 
            				value="${list.studyEndDate}" /> </div>
        <div class="studyProgress_task1">
          <div class="task1">
            <a href="${res}/study/toCoursePlay.html?openId=${list.openId}" target="_blank">继续学习</a>
          </div>
        </div>
        <div class="studyProgress_task2" style="display:none;">
          <div class="task1">
            <a class="ck showWindow" onclick="findHomeWork(${list.openId});" type="button">查看作业</a>
          </div>
          <div class="task2">做作业次数：${list.mypaperCount} / ${list.paperCount}</div>
        </div>
        <div class="studyProgress_task3" style="display:none;">
          <div class="task1">
            <a href="${res}/study/toDisCenter.html?id=${list.openId}" target="_blank">参加讨论</a>
          </div>
          <div class="task2">发表讨论次数：${list.myDiscussTotalCount} / ${list.discussTotalCount}</div>
        </div>
        <div class="studyProgress_task4" style="display:none;">
          <div class="task2">考试开放时间：<fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${list.exameStartTime }" />
           	-
           	<fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${list.exameEndTime}" />				 		
           					 		 </div>
        </div>
      </div>
      <!-- 学习进度右边 end -->
    </div>
    <!-- 学习进度主体 end -->
	</c:forEach>
     <!--分页-->
    <div class="page2">
      <c:set var="pageNum1" value="${requestScope.page.pageNum}"></c:set>
      <c:set var="pageCount1" value="${requestScope.page.pageCount}"></c:set>
      <a href="
      <c:if test="${pageNum1>1}">${res}/pro/list.html?pageNum=${pageNum1-1}</c:if>
      <c:if test="${pageNum1<=1}">${res}/pro/list.html?pageNum=1</c:if>
      " >上一页</a>
      
      <c:forEach var = "i" begin="1" end="${requestScope.page.pageCount}" step="1">
                             		<c:if test="${i==pageNum1}"><span>${i}</span></c:if>
                             		<c:if test="${i!=pageNum1}"><a class="paginItem2" >${i}</a></c:if>
      </c:forEach>
      <a href="
      <c:if test="${pageNum1<pageCount1}">${res}/pro/list.html?pageNum=${pageNum1+1}</c:if>
      <c:if test="${pageNum1>=pageCount1}">${res}/pro/list.html?pageNum=${pageCount1}</c:if>
      ">下一页</a>
    </div>
    <!--/分页-->

    

   </div>
   <!-- 主体右边 end -->
    
</div>
<!--main-->

<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>


<!--作业列表弹窗-->
<div class="chooseTip">
      <div class="chooseTiptop"><span>作业列表</span><a></a></div> 
      <div class="chooseinfo">
        <table class="tablelist" style="border-left:none;border-right:none;">
          <thead>
              <tr>  
                    <th>序号</th>
                    <th>作业名称</th>
                    <th>所属课程</th>
                    <th>是否完成</th>
                    <th>截至时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody id="hW"> <!--请循环8条数据-->
                
                 
            </tbody>
          </table>
                  <!--分页-->
    <div class="pageToolbar2">
     <%--  <c:set var="pageNum" value="${pageNo}"></c:set>
         <c:if test="${pageNo==1}">
      <a class="disabled prev_page" >上一页</a>
       </c:if>
       <c:if test="${pageNo!=1}">
      <a href="${res}/work/findHomeWork.html?pageNo=${pageNum-1}" >上一页</a>
       </c:if>
      
      <c:forEach var = "pageNow" begin="1" end="${totalPage}" step="1">
       <c:if test="${pageNow==pageNum}"><span>${pageNow}</span></c:if>
       <c:if test="${pageNow!=pageNum}"><a class="paginItem" href="${res}/work/findHomeWork.html?pageNo=${pageNow}">${pageNow}</a></c:if>
      </c:forEach>
      <c:if test="${pageNo==totalPage}">
      <a class="disabled prev_page" >下一页</a>
       </c:if>
       <c:if test="${pageNo!=totalPage}">
      <a href="${res}/work/findHomeWork.html?pageNo=${pageNum+1}">下一页</a>
       </c:if>
       <c:if test="${totalPage==0}">
       <div class="text" style=" text-align:center;font-size:20px">暂无考试</div>
       </c:if> --%>
    </div>
    <!--/分页-->
</div>
</div>   
<!--遮罩层-->
<div class="mask">
</div>
<!--遮罩层 end-->
<!--作业列表弹窗 end--> 
<!--footer-->
<script>
  $(".studyProgress_items li").click(function(){
    var temIndex = 0;

    //li实现点击事件
    //全部取消li_active
    $(this).parent('.studyProgress_items').children('li').each(function(index,e){
      if ($(e).hasClass("li_active")) {
        $(e).removeClass("li_active");
      }; 
    });
    //点击的li加上li_active
    $(this).addClass("li_active");
    //判断第几个li有li_active
    $(this).parent('.studyProgress_items').children('li').each(function(index,e){
      if ($(e).hasClass("li_active")) {
        temIndex = index;
      }; 
    });

    //显示不同的task
    $(this).parent('.studyProgress_items').parent('.studyProgress_one_right').children('div').each(function(index,e){
      if (index != 0) {$(this).css("display","none");};
      if (index==(temIndex + 1)) {
        $(this).show();
      };
    });
  });
  
  $(".paginItem2").click(function(){
	  var pageNum = $(this).text();
	  var pageSize = 5;
	  window.location.href="${res}/pro/list.html?pageNum="+pageNum+"&pageSize="+pageSize;
  })
  
  
  
  $(function(){
    var left = $(window).width()-$(".chooseTip").width();
    $(".showWindow").click(function(){
      $(".mask").show();
      $(".chooseTip").css('left',left/2+'px').fadeIn();
    });

    $(".chooseTiptop a").click(function(){
      $(this).parent().parent().fadeOut();
      $(".mask").hide();
    });

    $(window).resize(function(){
      var left1 = $(window).width()-$(".chooseTip").width();
      $(".chooseTip").css('left',left1/2+'px');
    });
  });
  
  
  function findHomeWork(openCourseId){
	  $.ajax({
			 type: "POST",
			  url: "${res}/work/findHomeWork.html",
			  processData:true,
			  data:{"openId":openCourseId},
			  dataType: "json",
			  success: function(data){
				  var htmlStr="";
				  $('.pageToolbar2').empty();
		             $('.pageToolbar2').Paging({pagesize:10,count:data.page.totalPage,toolbar:false,callback:function(page,size,count){

		             console.log(arguments); 
		              /*  alert('当前第 ' +page +'页,每页 '+size+'条,总页数：'+count+'页') */
		              PageTmp(size,page,openCourseId);
		              }}); 
				  HtmlTmp(data.page.list,htmlStr)
		    
			  },
			  error:function(){
				  altert("错了");
			  }
			 });
	  
  } 
//抽取公共部分2
  function HtmlTmp(datas,htmlStr){
    
    $("#hW").empty();
     $.each(datas, function (index, homWork) {
      htmlStr+="<tr>";
      htmlStr+="<td>"+(index+1)+"</td>";
      htmlStr+="<td>"+homWork.title+"</td>";
      htmlStr+="<td>"+homWork.courseName+"</td>";
      if(homWork.isSubmit!=null){
	      if(homWork.isSubmit==0){
	        htmlStr+=" <td class='undo'>未完成</td>";
	        htmlStr+="<td>"+homWork.studyEndDateStr+"</td>";
	        htmlStr+='<td><a class="btn" onclick="www_helpor_net('+homWork.paperId+","+homWork.isSubmit+","+homWork.studentPaperId+');">马上去做</a></td>';
	        htmlStr+="</tr>";
	      }else{
	        htmlStr+=" <td>已完成</td>";
	        htmlStr+="<td>"+homWork.studyEndDateStr+"</td>";
	        htmlStr+="<td><a href='${res}/work/checkHomework.html?paperId="+homWork.paperId+"&studentPaperId="+homWork.studentPaperId+"' class='ytn' target='true'>查看作业</a></td>";
	        htmlStr+="</tr>";
	      }
      }else{
    	  htmlStr+=" <td>未学习</td>";
          htmlStr+="<td>"+homWork.studyEndDateStr+"</td>";
          htmlStr+="<td><a href='${res}/study/toCoursePlay.html?openId="+homWork.openCourseId+"' class='ytn' target='true'>马上学习</a></td>";
          htmlStr+="</tr>";	
        	
     }
      
      
      });
      $("#hW").append(htmlStr);
  }
  
  function PageTmp(size,page,openCourseId){
	    var htmlStr="";
	     $.ajax({
	       type: "POST",
	        url: "${res}/work/findHomeWork.html",
	        processData:true,
	        data:{"pageSize":size,"pageNo":page,"openId":openCourseId},
	        dataType: "json",
	        success: function(data){
	          var datas=data.page.list;
	         $("#hW").empty();
	      
	         $.each(datas, function (index, homWork) {
	          htmlStr+="<tr>";
	          htmlStr+="<td>"+(index+1)+"</td>";
	          htmlStr+="<td>"+homWork.title+"</td>";
	          htmlStr+="<td>"+homWork.courseName+"</td>";
	          if(homWork.isSubmit != null){
	          if(homWork.isSubmit==0){
	              htmlStr+=" <td class='undo'>未完成</td>";
	              htmlStr+="<td>"+homWork.studyEndDateStr+"</td>";
	  	          htmlStr+='<td><a class="btn" onclick="www_helpor_net('+homWork.paperId+","+homWork.isSubmit+","+homWork.studentPaperId+');">马上去做</a></td>';
	              htmlStr+="</tr>";
	            }else{
	              htmlStr+=" <td>已完成</td>";
	              htmlStr+="<td>"+homWork.studyEndDateStr+"</td>";
	              htmlStr+="<td><a href='${res}/work/checkHomework.html.html?paperId="+homWork.paperId+"&studentPaperId="+homWork.studentPaperId+"' class='ytn'>查看作业</a></td>";
	              htmlStr+="</tr>";
	            }
	          }
	          else{
	        	  htmlStr+=" <td>未学习</td>";
	              htmlStr+="<td>"+homWork.studyEndDateStr+"</td>";
	              htmlStr+="<td><a href='${res}/work/checkPaper.html?paperId="+homWork.openCourseId+"&studentPaperId="+homWork.studentPaperId+"' class='ytn'>马上学习</a></td>";
	              htmlStr+="</tr>";	
	            	
	            }
	               });
	          $("#hW").append(htmlStr);
	        
	        },
	        error:function(){
	          altert("错了");
	        }
	       });
	  };
	//跳转去除工具栏页面
	  function   www_helpor_net(paperId,isSubmit,studentPaperId){  
	  	  var   targeturl="${res}/work/homeworkAdd.html.html?paperId="+paperId+"&isSubmit="+isSubmit+"&studentPaperId="+studentPaperId;
	  	  var tmp=window.open("about:blank","","fullscreen=1");
	  	    tmp.moveTo(0,0);
	  	    tmp.resizeTo(screen.width+20,screen.height);
	  	    tmp.focus();
	  	    tmp.location=targeturl;
	  	  }  	  
</script>
</body>
</html>

