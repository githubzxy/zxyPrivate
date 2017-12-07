<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
<<title>个人中心-亚卓数字教学中心</title>
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
<script type="text/javascript" src="${res }/js/global.js"></script>
<!--/js-->
</head>
<body>
<!--个人中心栏目-->
<%@ include file="/WEB-INF/study/comm.jsp" %>
<!--/个人中心栏目-->
    
   <!-- 主体右边 -->
   <div class="mian_right minHeight500">
      <h2 class="main_right_h2">作业列表</h2>
      <div class="exam_ul_list">
       <c:forEach items="${page.list}" var="hw" varStatus="status">
          <div class="li">
             <div class="img"><a href="###">
             <c:if test="${hw.maxUrl != null}">
           	<img src="<%=url %>/${hw.maxUrl }" alt="" />
           </c:if>
           <c:if test="${hw.maxUrl  == null}">
           <img src="${res}/student/img/test/2.png">
           </c:if>
            </a></div>
              <div class="txt">  
                <h2 class="h2">${hw.courseName }</h2>
                <p class="times">截至时间：<em><fmt:formatDate value="${hw.finishDate}" pattern="yyyy-MM-dd HH:mm"/>  </em></p>
                <p class="grade">作业套数：<em>${hw.taskCount}</em>套</p>
                <p class="grade">完成进度：<em>${hw.finishCount}</em>/<em>${hw.taskCount }</em>套</p>
                <p class="grade">授课教师：<em>${hw.lecturerName}</em>老师</p>
                <div class="alink aw">
                <c:if test="${hw.taskCount==0}"><a href="javascript:void(0)" class="ms">无作业</a></c:if>
                <c:if test="${hw.taskCount!=0}">
                <c:if test="${hw.finishCount==hw.taskCount}">
                  <a href="javascript:void(0)" class="ywc">已完成</a>
                  <a href="javascript:void(0);" class="ck showWindow" onclick="findHomeWork(${hw.openCourseId});" type="button">查看作业</a>
                   </c:if>
                   <c:if test="${hw.finishCount<hw.taskCount}">
		                 <a href="javascript:void(0)" class="wwc">未完成</a>
		                  <a href="javascript:void(0)" class="ms showWindow" onclick="findHomeWork(${hw.openCourseId});" type="button">查看作业</a>
                   </c:if>  
                   </c:if>
                </div>
                
              </div>
          </div><!--单挑数据-->
          </c:forEach>
      </div>
             <!--分页-->
    <div class="page2">
    <c:if test="${page.totalPage!=0}">
      <c:set var="pageNo" value="${page.pageNum}"></c:set>
         <c:if test="${page.pageNum==1}">
      <a class="disabled prev_page" >上一页</a>
       </c:if>
       <c:if test="${page.pageNum!=1}">
      <a href="${res}/work/getHomeWork.html?pageNum=${pageNo-1}" >上一页</a>
       </c:if>
      
      <c:forEach var = "pageNow" begin="1" end="${page.totalCount}" step="1">
       <c:if test="${pageNow==pageNo}"><span>${pageNow}</span></c:if>
       <c:if test="${pageNow!=pageNo}"><a class="paginItem" href="${res}/work/getHomeWork.html?pageNum=${pageNow}">${pageNow}</a></c:if>
      </c:forEach>
      <c:if test="${pageNum==pageNow}">
      <a class="disabled prev_page" >下一页</a>
       </c:if>
       <c:if test="${pageNum!=pageNow}">
      <a href="${res}/work/getHomeWork.html?pageNum=${pageNo+1}">下一页</a>
       </c:if>
       </c:if>
     
       <c:if test="${page.totalPage==0}">
       <div class="text" style=" text-align:center;font-size:20px">暂无作业</div>
       </c:if>
    </div>
    <!--/分页-->
    
       
     </div>
  
   <!-- 主体右边 end -->
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
                    <th>(学习/作业)截至时间</th>
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
</div>
<!--main-->

<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<script>
var  $hwStr=$("#hW");
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
  
  function findHomeWork(openId){
	  PageTmp(openId);
  } 
  function HtmlTmp(datas,htmlStr,startIndex){
    $hwStr.empty();
     $.each(datas, function (index, homWork) {
      htmlStr+="<tr>";
      htmlStr+="<td>"+(++startIndex)+"</td>";
      htmlStr+="<td>"+homWork.title+"</td>";
      htmlStr+="<td>"+homWork.courseName+"</td>";
      var createDate = new Date(homWork.studyEndDate);
      if(homWork.isSubmit!=null){
	      if(homWork.isSubmit==0){
	        htmlStr+=" <td class='undo'>未完成</td>";
			htmlStr+='<td>'+createDate.pattern("yyyy-MM-dd hh:mm")+'</td>';
	        htmlStr+='<td><a class="btn" onclick="www_helpor_net('+homWork.paperId+","+homWork.isSubmit+","+homWork.studentPaperId+');">马上去做</a></td>';
	        htmlStr+="</tr>";
	      }else{
	        htmlStr+=" <td>已完成</td>";
			htmlStr+='<td>'+createDate.pattern("yyyy-MM-dd hh:mm")+'</td>';
	        htmlStr+="<td><a href='${res}/work/checkHomework.html?paperId="+homWork.paperId+"&studentPaperId="+homWork.studentPaperId+"' class='ytn' target='_blank'>查看作业</a></td>";
	        htmlStr+="</tr>";
	      }
      }else{
    	  htmlStr+=" <td>未学习</td>";
		  htmlStr+='<td>'+createDate.pattern("yyyy-MM-dd hh:mm")+'</td>';
          htmlStr+="<td><a href='${res}/study/toCoursePlay.html?openId="+homWork.openCourseId+"' class='ytn'>马上学习</a></td>";
          htmlStr+="</tr>";	
        	
     }
      
      
      });
     $hwStr.append(htmlStr);
  }
  
  function PageTmp(openId,size,page){
		var htmlStr = "";
		$.ajax({
			  type: "POST",
			  url: "${res}/work/findHomeWork.html",
		      processData:true,
		      data:{"pageSize":6,"pageNum":page,"openId":openId},
			  dataType: "json",
			  success: function(data){
				  $hwStr.empty();
				  if(data.page.totalPage>0){
				  if((typeof(size) == "undefined")){
					  var htmlStr = "";
					  $('.pageToolbar2').empty();
					  $hwStr.empty();
						  $('.pageToolbar2').Paging({pagesize:6,count:2,callback:function(page,size,count){
								console.log(arguments); 
								PageTmp(openId,size,page);
							  }}); 
				  }
				HtmlTmp(data.page.list,htmlStr,data.page.startIndex);
				  }else{
					  $hwStr.append("<tr><td colspan='9' style='text-align:center;color:red;'>暂无|･ω･｀)</td></tr>");
				  }
			  },
			  error:function(e){
				  alert("错误");
			  }
			 });
	};
	//跳转去除工具栏页面
	  function   www_helpor_net(paperId,isSubmit,studentPaperId){  
	  	  var   targeturl="${res}/work/homeworkAdd.html?paperId="+paperId+"&isSubmit="+isSubmit+"&studentPaperId="+studentPaperId;
	  	  var tmp=window.open("about:blank","","fullscreen=1");
	  	    tmp.moveTo(0,0);
	  	    tmp.resizeTo(screen.width+20,screen.height);
	  	    tmp.focus();
	  	    tmp.location=targeturl;
	  	  }  	  
</script>

</body>
</html>

   



























