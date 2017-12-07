<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
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
    
   <!-- 主体右边 -->
   <div class="mian_right minHeight500">
      <h2 class="main_right_h2">我的考试</h2>
      <div class="exam_ul_list">
      <c:forEach items="${page.list}" var="test" varStatus="status">
         <div class="li">
            <div class="img"><a href="###">
             <c:if test="${test.maxUrl != null}">
           	<img src="<%=url %>/${test.maxUrl }" alt="" />
           </c:if>
           <c:if test="${test.maxUrl  == null}">
           <img src="${res}/student/img/test/2.png">
           </c:if>
          
            </a></div>
              <div class="txt">
                <h2 class="h2">课程：${test.courseName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;试卷：${test.title}</h2>
                <p class="times">起止日期：<em><fmt:formatDate value="${test.examineStartDate}" pattern="yyyy-MM-dd  HH:mm" />----<fmt:formatDate value="${test.examineEndDate}" pattern="yyyy-MM-dd  HH:mm" /></em></p>
                <p class="grade">考试时长：<c:if test="${test.isTimeLimit >0}"><em>${test.limitTime }</em>分</c:if><c:if test="${test.isTimeLimit<0||test.isTimeLimit==''}"><em>不限时</em></c:if></p>
                <p class="grade">及格分数：<em>${test.passScore }</em>分</p>
                <p class="grade">课程学分：<em>${test.studyScore }</em>分</p>
               
                <div class="alink">
                 <c:if test="${test.examineStartDate<=now&&test.examineEndDate>=now}">
                <a  class="l"  onclick="www_helpor_net('+${test.paperId}+','+${test.openCourseId}+','+${test.studentPaperId}+','+${test.title}+');">马上考试</a>
                </c:if>
                <c:if test="${test.examineStartDate>now}">
                <a  class="l">未开始</a>
                </c:if>
                 <c:if test="${now>test.examineEndDate}">
                <a  class="l">已结束</a>
                </c:if>
                
                </div>
              </div>
          </div><!--单挑数据-->
            </c:forEach>
      </div>
      
        <!--分页-->
      <!--  <div id="pageToolbar"></div> -->
        <!--分页 end-->
    <div class="page2">
     <c:if test="${page.totalPage!=0}">
       <c:set var="pageNo" value="${page.pageNum}"></c:set>
         <c:if test="${page.pageNum==1}">
      <a class="disabled prev_page" >上一页</a>
       </c:if>
       <c:if test="${page.pageNum!=1}">
      <a href="${res}/student/test/toMyTest.html?pageNum=${pageNo-1}" >上一页</a>
       </c:if>
      <c:forEach var = "pageNow" begin="1" end="${page.totalCount}" step="1">
       <c:if test="${pageNow==pageNo}"><span>${pageNow}</span></c:if>
       <c:if test="${pageNow!=pageNo}"><a class="paginItem" href="${res}/student/test/toMyTest.html?pageNum=${pageNo}">${pageNo}</a></c:if>
      </c:forEach>
      <c:if test="${pageNum==pageNow}">
      <a class="disabled prev_page" >下一页</a>
       </c:if>
       <c:if test="${pageNum!=pageNow}">
      <a href="${res}/student/test/toMyTest.html?pageNum=${pageNo+1}">下一页</a>
       </c:if>
       </c:if>
    
       <c:if test="${page.totalPage==0}">
       <div class="text" style=" text-align:center;font-size:20px">暂无考试</div>
       </c:if>
</div>

<!--main-->
     </div>
</div>
<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->
<script>
/* //初始化时就调用
jQuery(function ($) {
    initTable(); 
});
var  $elist=$(".exam_ul_list");
//抽取公共部分1
function PageTmp(size,page){
	var html = "";
	 $.ajax({
		 type: "POST",
		  url: "${res}/student/test/myTest.html",
		  processData:true,
		  data:{"pageSize":size,"pageNo":page},
		  dataType: "json",
		  success: function(data){
			  var datas=data.testList;
			  $elist.empty();
			  var html2=' <i class="icon-stars"></i>';
			  $.each(datas, function (index, test) {
				 html+=' <div class="li">';
				 html+='<div class="img"><a href="###"><img src="${res}/student/img/test/2.png"></a></div>';
				 html+='<div class="txt">';
				 html+=' <h2 class="h2">'+test.courseName +'</h2>';
				 html+=' <p class="times">开始时间：<em>'+test.examineStartDate+'----'+test.examineEndDate+'</em></p>';
			     html+='<p class="grade"> 及格分数：<em>'+test.passScore+'</em>分</p>'
			     html+=' <p class="grade">课程学分：<em>'+test.studyScore+'</em>分</p>';
				 html+='<div class="alink">';
				 html+='<a href="${res }/student/test/todoTest.html?paperId='+test.paperId+'"class="l" target="_blank" >马上考试</a>';
				 html+='</div>'; 
				 html+='</div>'; 
				 html+='</div>'; 
				 
				
				 
             });
			  $elist.append(html);
	    
		  },
		  error:function(){
			  altert("错了");
		  }
		 });
};
//抽取公共部分2
function HtmlTmp(datas,html){
	 
	 $elist.empty();
	 var html2=' <i class="icon-stars"></i>';
	  $.each(datas, function (index, test) {
			     html+=' <div class="li">';
				 html+='<div class="img"><a href="###"><img src="${res}/student/img/test/2.png"></a></div>';
				 html+='<div class="txt">';
				 html+=' <h2 class="h2">'+test.courseName +'</h2>';
				 html+=' <p class="times">开始时间：<em>'+test.examineStartDate+'----'+test.examineEndDate+'</em></p>';
				 html+='<p class="grade"> 及格分数：<em>'+test.passScore+'</em>分</p>'
			     html+=' <p class="grade">课程学分：<em>'+test.studyScore+'</em>分</p>';
				 html+='<div class="alink">';
				 html+='<a href="${res }/student/test/todoTest.html?paperId='+test.paperId+'"class="l" target="_blank" >马上考试</a>';
				 html+='</div>'; 
				 html+='</div>'; 
				 html+='</div>'; 
				 
     });
	  $elist.append(html);
}
function initTable() {
	 $.ajax({
		 type: "POST",
		  url: "${res}/student/test/myTest.html",
		  processData:true,
		  dataType: "json",
		  success: function(data){
			  var html = "";
			 $('#pageToolbar').Paging({pagesize:5,count:data.count,toolbar:false,callback:function(page,size,count){

				 console.log(arguments); 
					/*  alert('当前第 ' +page +'页,每页 '+size+'条,总页数：'+count+'页') */
					/* PageTmp(size,page);
					}}); 
			  HtmlTmp(data.testList,html);
 	    
 		  }
 		 });
} */
//跳转去除工具栏页面
function   www_helpor_net(paperId,openId,studentPaperId,title){   
	  var  targeturl="${res }/student/test/examineAdd.html?paperId="+paperId+"&openId="+openId+"&studentPaperId="+studentPaperId+"&title="+title; 
	  var tmp=window.open("about:blank","","fullscreen=1");
	    tmp.moveTo(0,0);
	    tmp.resizeTo(screen.width+20,screen.height);
	    tmp.focus();
	    tmp.location=targeturl;
	  }   
</script>
</body>
</html>

   


























