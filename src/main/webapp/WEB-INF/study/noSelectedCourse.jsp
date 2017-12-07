<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" type="text/css" href="${res}/student/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/student/css/vip.css" />

<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script src="${res}/front/js/jquery.page.js"></script><!-- 分页插件 -->
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<!--/js-->
</head>
<body>
<%@ include file="/WEB-INF/study/comm.jsp" %>
   <!--/vip_left-->
   <!-- 主体右边 -->
   <div class="mian_right minHeight500">
    <h2 class="main_right_h2">我要选课</h2>
    <!-- 搜索  -->
    <div class="selectedCourse_one" style="height:60px;">
      <ul class="selectedCourse_ul">
        <li><i>课程分类：</i></li>
        <li>
          <select name="" id="courseTypeId" class="select">
          	<c:set var="coursetypeId" value="${requestScope.courseTypeId }"></c:set>
            <option value="${list.courseTypeId}">所有分类</option>
          	 <c:forEach items = "${requestScope.courseTypePos}" var = "list" varStatus="status">
          	  <option value="${list.courseTypeId}" 
          	  <c:if test="${list.courseTypeId==coursetypeId}">selected = "selected"</c:if>
          	   >${list.typeName }</option>
          	 </c:forEach>
          </select>
        </li>
        <li><i>课程名称：</i></li>
        <li><input class="text" id="keywords" value="${page.keywords}" type="text"/></li>
        <li><a href="###" class="btn2">查询</a></li>
      </ul>
    </div>
    <!-- 搜索 end  -->

<c:forEach items = "${requestScope.openCourseVos}" var = "list" varStatus="status">
      <div class="selectedCourse_one">
      <!-- 已选课程左边 -->
     	<div class="studyProgress_one_left fl">
         <c:if test="${list.maxUrl != null}">
           	<img src="<%=url %>/${list.maxUrl }" alt="" />
           </c:if>
           <c:if test="${list.maxUrl  == null}">
           <img src="${res}/student/img/test/2.png">
           </c:if>
        <div class="studyProgress_one_left_div">
        <div class="div1 selectedCourse_one_div1">${list.courseName}</div>
        <div class="div2 selectedCourse_one_div2 " style="font-size:15px;">讲师：${list.lecturerName }</div>
          <div class="div4" style="font-size:15px;margin-top:15px;">课时：<span>&nbsp;${list.classhour }&nbsp;</span>课时</div>
        </div>
      </div>
      <!-- 已选课程左边 end -->
       
      <!-- 学习进度右边 -->
      <div class="studyProgress_one_right selectedCourse_one_right fr">
        <a  class="l" onclick="add(${list.openId})">我要学习</a>
        <input type="hidden" value="${list.openId}"/> 
        <a href="${res}/main/toChapter.html?openId=${list.openId}" class="r">查看课程</a> 
      </div>
      <!-- 学习进度右边 end -->
      </div>
      <!-- 已选课程主体 end -->
     </c:forEach>
	<c:if test="${requestScope.page.pageCount !=0}">
    <!--分页-->
    <div class="page2">
    <div class="tcdPageCode"></div>
      <%-- <c:set var="pageNum" value="${requestScope.page.pageNum}"></c:set>
      <c:set var="pageCount" value="${requestScope.page.pageCount}"></c:set>
      <a 
      onclick="page(
      <c:if test="${pageNum>1}">${pageNum-1}</c:if>
      <c:if test="${pageNum<=1}">1</c:if>
      )">上一页</a>
     <c:set var="pageNum" value="${requestScope.page.pageNum}"></c:set>
      <c:forEach var = "i" begin="1" end="${requestScope.page.pageCount}" step="1">
                             		<c:if test="${i==pageNum}"><span>${i}</span></c:if>
                             		<c:if test="${i!=pageNum}"><a class="paginItem" onclick="page(${i})">${i}</a></c:if>
      </c:forEach>
      <a onclick="page(
      <c:if test="${pageNum<pageCount}">${pageNum+1}</c:if>
      <c:if test="${pageNum>=pageCount}">${pageCount}</c:if>
      )"
      >下一页</a> --%>
    </div>
    <!--/分页-->
    </c:if>
    <c:if test="${requestScope.page.pageCount==0}">
    	 <br>
   		 <div class="text" style=" text-align:center;font-size:20px">暂无课程信息</div>
    </c:if>
  </div>
  <!-- 主体右边 end -->

<!--main-->
</div>
</div>
<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->
</body>
<script type="text/javascript">
		//分页
			var pageCount =${page.pageCount};
			var pageNum = ${page.pageNum};
		$(".tcdPageCode").createPage({
		    pageCount:pageCount,
		    current:pageNum,
		    backFn:function(p){
		        // console.log(p);
		        window.location.href="${res}/study/toNoselectedcourse.html?pageNum="+p+"&pageSize=5";
		        //单击回调方法，p是当前页码
		    }
		});

	$(".btn2").click(function(){
		var courseTypeId = $("#courseTypeId option:selected").val();
		var keywords = $("#keywords").val();
		window.location.href="${res}/study/toNoselectedcourse.html?courseTypeId="+courseTypeId+"&keywords="+keywords;
	})
	function add(openId){
		var openId = openId;
		layer.confirm('确认选择？',{icon: 3, title:'提示'},function(){ 
    		layer.closeAll();
		$.ajax({
			url:'${res}/course/open/addCourseStudent.html',
		    type:'post',
		    dataType:'json',
		    data:{openId:openId},
		    success : function(data){
		    	if(1 == data.flag){
  	    			layer.alert(data.msg,{icon:1},function(){
        				  document.location.href="${res}/study/toNoselectedcourse.html"
        			  });;
  	    		}else{
  	    			layer.alert(data.msg,{icon:2});
  	    		}
				}
		})
		})
	}
	
	function page(pageNum){
		var courseTypeId = $("#courseTypeId option:selected").val();
		var keywords = $("#keywords").val();
		window.location.href="${res}/study/toNoselectedcourse.html?pageNum="+pageNum+"&keywords="+keywords+"&courseTypeId="+courseTypeId;
	}
</script>
</html>