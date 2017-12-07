<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="亚卓教育、锦岸文化" />
<meta name="description" content=" “亚卓教育”是为中国基础教育和职业教育领域提供领先在线教学资源和教育技术的国有参股企业，拥有国家高新技术企业资质和国家级高新区“上规入库”企业评级，也是国内唯一在线教育机构与教育部主管和指导的《中国教育信息化》杂志社、《基础教育参考》杂志构建战略合作关系，共同研发在线课程资源产品的公司。author:亚卓教育技术部 " />
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<title>亚卓数字教学中心</title>
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/front/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/layout.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/front/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${res}/front/js/global.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<!--/js-->
</head>
<body>
<!--top-->
<%@ include file="/WEB-INF/home/common_top.jsp" %>
<!--top-->
<!--mian-->
<div class="chapter_wrap">
  <div class="w1200 chapter_header">
      <!--面包屑-->
       <div class="crumbs">
         <a href="${res}/" target="_blank">课程资源库</a>&gt;
         <a onClick="javascript :history.go(-1);" target="_blank">${course.typeName}</a>
        &gt;${course.courseName}
       </div>
      <!--面包屑-->
      <div class="chapter_detail">
        <div class="course_img">
        	<c:if test="${course.maxUrl != null}">
           	<img src="<%=url %>/${course.maxUrl}" alt="" />
           </c:if>
           <c:if test="${course.maxUrl == null}">
          <img src="${res}/front/images/test/1p.png" alt=""  title="${course.courseName}"/>
           </c:if>
        </div>
        <div class="course_mess">
           <h2 class="course_t">${course.courseName}</h2>
           <div class="course_info_t">
             <div class="info cousre_1">
                <span>课程评分</span>
                <span class="nume">10.0</span>
             </div>
             <div class="info cousre_1">
                <span>课程时长</span>
                <span class="nume">${course.classhour}课时</span>
             </div>
             <div class="info cousre_1">
                <span>学习人数</span>
                <span class="nume">${course.count}人</span>
             </div>  
           </div>
           <a href="toCoursePlay.html?openId=${course.openId}&&courseId=${course.courseId}"  class="start_study">开始学习</a>
        </div>
      </div>
  </div>
  <div class="w1200 course_chapter_"> 
    <div class="yazhuo_course_list">
      <div class="fl  yazhuo_study_intro_list">
        <h3 class="chapter_introduces01">课程介绍</h3>
        <div class="course_shortdecription01">
       ${course.courseInfo}
        </div>
        <h3 class="chapter_catalog01">课程提纲</h3>
        <div class="chapter_list_view">
         <c:forEach items="${chapters}" var="chapter">
              <c:if test="${chapter.parentId==null}">
              <c:set var="myparent" value="${chapter.chapterId}"></c:set>
           <dl>
              <dt><img src="${res}/front/images/icon/icon_zhangjie-new.png" alt="" /></dt>
              <dd>
                 <p class="list_view_title" title="${chapter.chapterId},${course.courseId},${chapter.videoId}" >${chapter.chapterName}</p>
                 <div class="list_view_detail">
                  <c:forEach items="${chapters}" var="chapter">
                <c:if test="${chapter.parentId==myparent}">
                	<c:set var="myparent2" value="${chapter.chapterId}"></c:set>
                   <p class="list_view_chpatetitle" title="${chapter.chapterId},${myparent},${course.openId},${chapter.videoId }">${chapter.chapterName}</p>
                    <c:forEach items="${chapters}" var="chapter">
		             <c:if test="${chapter.parentId==myparent2}">
                   		<a href="${res}/main/toCoursePlay.html?chapterId=${chapter.chapterId}&parentId=${myparent}&openId=${course.openId}&currentVideoId=${chapter.videoId}"  class="oldstyle" target="_blank">${chapter.chapterName}</a>
                    </c:if>
	                  </c:forEach>
	                  </c:if>
	                   </c:forEach>
                  </div>
              </dd>
           </dl>
            </c:if>
            </c:forEach>
           <!--单条数据-->
        </div>
      </div> 
      <div class="yazhuo_course_right fr">
                <dl>
                  <dt>研发团队</dt>
                  <dd>
                  <c:forEach items="${lecturers}" var="lecturer">
                    <div class="course_teacher01">
                        <a href="#" class="teacer_pic01">
                        <c:if test="${lecturer.avatar!=null&&lecturer.avatar!=''}">
                        <img src="<%=url %>/${lecturer.avatar}" height="80" width="80">
                        </c:if>
                         <c:if test="${lecturer.avatar==null||lecturer.avatar==''}">
                      <img src="${res}/front/images/teacherAvatar.png" height="80" width="80" />
                        </c:if>
                        </a>
                       <h3>
                         <a href="#">${lecturer.name}</a>
                         <span class="teacher_icon01"></span>
                       </h3>
                        <p>职称:${lecturer.position }</p>
                      <br class="clear">
                     <div class="discrip01 autowrap01">

                        <p>&nbsp; &nbsp; &nbsp; &nbsp;${lecturer.info}&nbsp;</p>
                      </div>
                    </div>
                    </c:forEach>
                  </dd>
               </dl>
      
          </div>

       
     
    </div>
</div>
<!--mian-->
<!--footer-->
<%@ include file="/WEB-INF/home/common.jsp" %>  
<!--footer-->
<script type="text/javascript">
$(function(){
	var p1=$(".list_view_title");
	p1.each(function(index){
		if($(this).next("div").children("p").length==0){
			var arr=$(this).attr("title").split(",");
			
			//$(this).attr("onclick","javascript:dd("+arr[0]+","+arr[1]+","+arr[2]+")");
		}else{
			$(this).next("div").children("p").each(function(index){
			if($(this).next("a").length==0){
				var text=$(this).text();
				var params=$(this).attr("title");
				var paramArr=params.split(",");
				$(this).replaceWith('<a  class="oldstyle" style="font-size:16px;padding-left:20px;"  href="${res}/main/toCoursePlay.html?chapterId='+paramArr[0]+'&parentId='+paramArr[1]+'&openId='+paramArr[2]+'&currentVideoId='+paramArr[3]+'">'+text+'</a>');
		}
			})
		
	}
	})
}
)
function dd(chapterId,courseId,videoId){
	//判断旗下是否有子章节
	  $.ajax({
		  type: "POST",
		  url: "${res}/main/isHavaSonChapter.html",
		  processData:true,
		  data:{"chapterId":chapterId,"courseId":courseId},
		  dataType: "json",
		  success: function(data){
			 if(data.flag==0)
			 {
				 //<a href="${res}/main/toCoursePlay.html?chapterId=${chapter.chapterId}&parentId=${myparent}&openId=${course.openId}&currentVideoId=${chapter.videoId}" class="oldstyle">${chapter.chapterName}</a>
				 window.location.href="${res}/main/toCoursePlay.html?chapterId="+chapterId+"&parentId=0&openId="+${course.openId}+"&currentVideoId="+videoId;
			 }
			 
		  }
		  });  
	}
$(function(){
    //弹窗登录
    var tc_left = ($(window).width()-$(".tc_login_wrap").width())/2;
    var tc_top = ($(window).height()-$(".tc_login_wrap").height())/2;
    $("#tclogin").click(function(){
       $(".mask_wrap_login").show();
       $(".tc_login_wrap").show();
       $(".tc_login_wrap").css("left",tc_left+'px').css("top",(tc_top+80) + 'px');
    });
    $(".closex").click(function(){
       $(".mask_wrap_login").hide();
       $(".tc_login_wrap").hide();
    });
  });
  
  $("#submit").click(function(){
	  
	  $.ajax({
          url:'${res}/admin/login/indexLogin.html',
          type:'post',
          dataType:'json',
          contentType : "application/x-www-form-urlencoded",
         data: {
            userName: $('#userName').val(),
            passWord: $('#passWord').val(),
           } ,
          beforeSend : function () {
            $("#shade").show();
            $(".loading2").show();
        }, 
        success : function (data) {
        	$("#layer").show();
            $("#shade").show(); 
            $("#layer dd").text(data.msg);
            $(".loading2").hide();
            setTimeout(function(){
            	if(data.flag=="1"){
            		window.location.href="${res}/main/category.html";
            		
            	}
            },1000);  
        }
	  })
  })
</script>
</body>
</html>

  