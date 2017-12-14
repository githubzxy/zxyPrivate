<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="亚卓教育、锦岸文化" />
<meta name="description" content=" “亚卓教育”是为中国基础教育和职业教育领域提供领先在线教学资源和教育技术的国有参股企业，拥有国家高新技术企业资质和国家级高新区“上规入库”企业评级，也是国内唯一在线教育机构与教育部主管和指导的《中国教育信息化》杂志社、《基础教育参考》杂志构建战略合作关系，共同研发在线课程资源产品的公司。author:亚卓教育技术部 " />
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/front/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/layout.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/front/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${res}/front/js/jquery.page.js"></script><!-- 分页插件 -->
<script type="text/javascript" src="${res}/front/js/jwplayer.js"></script>
<script type="text/javascript" src="${res}/front/js/global.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/front/js/jquery.nicescroll.js"></script><!-- 滚动条 -->
<!--/js-->
<style type="text/css">
.scroll_list{height:400px;overflow:hidden;}
</style>
</head>
<body>
<!--top-->
<div class="video_top div100">
  <div class="w1200 video_header">
   <div class="video_header_left fl" ><a  href="#" onClick="javascript :history.go(-1);"><em></em></a>
   <span>${CourseName.courseTypeName}</span>
   <span class="span1" >&gt;</span> <span class="span2">${CourseName.openCourseName}</span>
   </div>
   <div class="video_header_center fl"><span class="span1">正在播放：</span>
   <span class="span2" id="currentName">${video.name}</span>
 </div>
  </div>
</div>
<!--top-->
<!--mian-->
<div class="video_main">
  <div class="video_wrap_play">
   <div class="w1200">
   <!-- 学校logo水印 -->
     <div class="school_logo"></div>
     <!-- 学校logo水印 -->
     <div id="yazhuoVideo"> 
     </div> 
     <div class="video_list_course">
        <i class="icon-left"></i>
        <div class="operator">
          <div class="op chapter"><em class="icon-menu"></em>章节</div>
        </div>
          <!--视频集数--> 
          <div class="yazhuo_couser_list_player">
            <div class="yazhuo_couser_list_player_title" title="${videos[0].courseName}">
            	<c:choose>
            		<c:when test="${fn:length(videos[0].courseName)>12 }">
            			${fn:substring(videos[0].courseName,0,12) }...
            		</c:when>
            		<c:otherwise>
            			${fn:substring(videos[0].courseName,0,12) }
            		</c:otherwise>
            	</c:choose>
            </div>
            <div class="scroll_list">
             <dl class="video_dl_list">
              <dt title="${videos[0].parentName}">
                 	<c:choose>
	            		<c:when test="${fn:length(videos[0].parentName)>20 }">
	            			${fn:substring(videos[0].parentName,0,20) }...
	            		</c:when>
	            		<c:otherwise>
	            			${fn:substring(videos[0].parentName,0,20) }
	            		</c:otherwise>
            		</c:choose>
              
              </dt>
              <dd>
              <c:forEach items="${videos}" var="video" varStatus="status">
             <c:if test="${video.level==2}">
                 <p class="list_view_title1 ${video.name} lastlist" onclick="javascript:clickVideo('${video.videoUrl}',this);" id="${video.chapterId}" name="${video.videoUrl}" title="${video.chapterName}">
                 	<c:choose>
	            		<c:when test="${fn:length(video.chapterName)>16 }">
	            			${fn:substring(video.chapterName,0,16) }...
	            		</c:when>
	            		<c:otherwise>
	            			${fn:substring(video.chapterName,0,12) }
	            		</c:otherwise>
            		</c:choose>
                 	
                 </p>
                    </c:if>
                    <c:if test="${video.level==3}">
                 <div class="list_view_detail1">
                 
                   <a href="" class="aa ${video.name} lock lastlist" id="${video.chapterId}" name="${video.videoUrl}" title="${video.chapterName}">
                   		<c:choose>
		            		<c:when test="${fn:length(video.chapterName)>16 }">
		            			${fn:substring(video.chapterName,0,16) }...
		            		</c:when>
		            		<c:otherwise>
		            			${fn:substring(video.chapterName,0,12) }
		            		</c:otherwise>
	            		</c:choose>
                   </a>
                
                  
                  </div>
                    </c:if>
                 
                  
                  </c:forEach>
              </dd>
           </dl>
          </div>
          </div>
         <!--/视频集数-->
         <script type="text/javascript">
		   //滚动条美化
		   $(".scroll_list").niceScroll({  
		     cursorcolor:"#f60",  
		     cursoropacitymax:1,  
		     touchbehavior:false,  
		     cursorwidth:"5px",  
		     cursorborder:"0",  
		     cursorborderradius:"5px"  
		   }); 
 </script>
          </div>
   </div>
  </div><!--video_wrap_play end-->
   <div class="yazhuo_study_video_discuss w1200">
    <div class="yazhuo_discuss_video fl">
      <div class="yazhuo_video_tit"><h2>课程讨论</h2></div>
      <div class="yazhuo_textarea">
        <textarea id="TextArea1" onkeyup="checkLength(this);"></textarea>
        <div class="yahzhuonumlimit">您还可以输入：<span id="sy" style="color:#f00;">140</span></div>
        <div class="yazhuo_button_150 mb15"><a>发布评论</a></div>
      </div>
      <div class="clear"></div>
       <!--讨论列表-->
       <div class="yazhuo_discuss_div_area">
         <ul class="yazhuo_discuss_list_area">
         </ul>
          <!-- 分页 -->
        <div class="tcdPageCode"></div>
        <!-- 分页 end -->      
       </div><!--/讨论列表-->
    </div>
     <c:if test="${sessionScope.baseUser.roleCode!='student'}">
           <div class="yazhuo_homework_video fr">
      <div class="yazhuo_video_tit"><h2>资源下载</h2></div>
      <ul class="resourceList">
      </ul>
    </div>
           </c:if>
    
  </div>  

</div>
<!--mian-->
  
<!--footer-->
<%@ include file="/WEB-INF/home/common.jsp" %>  
<!--footer-->
<script type="text/javascript">
	var pageNum;
	var totalPage;
	var url;
	var ids=new Array();
	var urls=new Array();
	var videoNames=new Array();
	var currentChapterId="${chapterId}";
	var index=0;
	var thePlayer;  //保存当前播放器以便操作  
	var i = 0;
	var ip="<%=url%>";
	$(".lastlist").each(function(i){
		$(this).attr("href","javascript:clickVideo('"+$(this).attr("name")+"',"+i+");");
	    ids.push($(this).attr("id"));
	    urls.push($(this).attr("name"));
	    videoNames.push($(this).attr("class").split(" ")[1]);
	});
	function clickVideo(url,i){
		if(url!=null&&url!=""){
			 index=i;
			 $("#currentName").html(videoNames[index]);
			 playOrnot(index);
		   		LoadingJwPlayer(url);
		   }
	   }
	function playOrnot(index){
		$(".lastlist").each(function(){
			$(this).removeClass("play");
		})
		 $("#"+ids[index]+"").addClass("play");
	}
   $(function() {
	   getCommentList(1);
	   var as=$('.list_view_detail1');
	   var ps=$('.list_view_title1');
	   var str="";
	     ps.each(function(){
		   if($(this).next().children("a").length==0){
			    var text=$(this).text();
			    var id= $(this).attr("id");
			    var  i= ids.indexOf(id);
			 $(this).replaceWith('<div class="list_view_detail1"><a href="javascript:clickVideo(\''+urls[i]+'\','+i+')" class="aa '+videoNames[i]+' lock lastlist" id="'+ids[i]+'" name="'+urls[i]+'">'+text+'</a></div>');
			  
		   }
	   })    
	   
    	
    	var cIndex = "${currentVideoIndex}";
    	if(cIndex!=null && cIndex != -1){
    		index = parseInt(cIndex);
    		$("#currentName").html(videoNames[index]);
    		playOrnot(index);
			LoadingJwPlayer(urls[index]);
    	}else{
	    	for(var i=0;i<urls.length;i++){
	     	   if(urls[i]!=null&&urls[i]!=""){
	     		 	index=i;
	     		 	$("#currentName").html(videoNames[i]);
	     			playOrnot(index);
					LoadingJwPlayer(urls[i]);
					break;
	     	   }
    		}
    	}
      })
   
       function LoadingJwPlayer(Url){
	   
	   
	   var urlAddr=ip+"/"+Url;
    	var chapterId=ids[index];
    	if("${sessionScope.baseUser.roleCode}" != 'student'){
    	$(".resourceList").html("");
    	$.ajax({
			type : "post",
			url : "getResourceByChapterId.html",
			data : {
				chapterId : chapterId
			},
			success : function(data) {
				var result=eval('('+data+')'); 
				var html="";
				for(var i = 0;i < result.length;i++){
					html+="<li><span>"+result[i].fileName+"</span><a href='${res}/upload/downFile.html?fn="+result[i].url+"&&fName="+result[i].fileName+"'>下载</a></li>";
				}
				
					$(".resourceList").html(html);
				
				
			}
    	
		});
    	}
    	jwplayer.key="bAoNHra71KE/mHvb0sirT4HeWLTAkpiYa1mVsA==";
    	  thePlayer=jwplayer("yazhuoVideo").setup({ 
      	    flashplayer: "${res}/plugin/jwPlayer/jwplayer.swf",	
      	    file:urlAddr,
      	    autostart : true , 
      	    height: "530px",
      	    width: "900px",
      	    volume: 80,
      	    image: "${res}/front/images/start.png",
      	    title:"关注心理健康",
      	    stretching:'uniform',
      	    smoothing: "true",
      	    events: {
        onComplete:function() {
        	for (var i = index + 1; i < urls.length; i++) {
						if (urls[i] != null && urls[i] != "") {
							layer.confirm('该视频已经观看完毕，是否继续观看？', {
								btn : [ '是的', '取消' ]
							//按钮
							}, function() {
								layer.msg('玩命加载中', function() {
									index = i;
									url = urls[i];
									$("#currentName").html(videoNames[i]);
									playOrnot(index);
									LoadingJwPlayer(url);
								});

							}, function() {

							});
							break;
						}else{
							layer.alert("亲，本节视频已经观看完了哟！");
						}
						
					}

				},
				onError : function() {
					layer.alert('加载视频失败！请选择其他线路！',{icon:2});
				}

			}
		})
	}
	//获取视频长度  
	$('.player-length').click(function() {
		//alert(thePlayer.getDuration());
	});
	//获取播放进度  
	$('.player-current').click(function() {
		//alert(thePlayer.getPosition());
	});

	//跳转到指定位置播放  
	$('.player-goto').click(function() {
		if (thePlayer.getState() != 'PLAYING') { //若当前未播放，先启动播放器  
			thePlayer.play();
		}
		thePlayer.seek(30); //从指定位置开始播放(单位：秒)  
	});

	//局部刷新评论
	function getCommentList(p) {
		$.ajax({
					type : "post",
					url : "commentList.html",
					data : {
						openId : "${openId}",
						pageNum : p
					},
					success : function(result) {
						var comments = result.comments;
						$(".yazhuo_discuss_list_area").empty();
						if (comments == null||comments.length<1) {
							$(".tcdPageCode").html("暂无评论");
							
						} else {
							
							for (var i = 0; i < comments.length; i++) {
								var htmlStr="";
								
								htmlStr+="<li><div class='yazhuo_discuss_header_pic fl'><img src='<%=url%>/";
								if(comments[i].avatar==null){
									htmlStr+="avatar/201703/20170330/77D920630383950CC91E0051266B027D1490860220339.jpg";
								}else{
									htmlStr+=comments[i].avatar;
  						 }
  						 htmlStr+="' title='"
  						 +comments[i].userName+"' width='80' height='80'></div><div class='yazhuo_discuss_neirong_con fr'><div class='yazhuo_discuss_neirong'>"
														+ comments[i].content
														+ "</div><div class='yazhuo_discuss_xuesheng fr'><span class='xingming'>"
														+ comments[i].userName
														+ "</span>在<span class='timess'>"
														+ comments[i].createDt
														+ "</span> 发表</div></div></li>";
  						$(".yazhuo_discuss_list_area").append(htmlStr);
														
							}

							pageNum = result.page.pageNum;
							totalPage = result.page.totalPage;

							$(".tcdPageCode").createPage({
								pageCount : totalPage,
								current : pageNum,
								backFn : function(p) {
									// console.log(p);
									//单击回调方法，p是当前页码
								}

							});

						}
					},
					dataType : "Json"
				})
	}
	$(".yazhuo_button_150").click(function() {
		var content = $("#TextArea1").val();
		if(content.length <= 0){
			layer.alert("请输入评论内容",{icon:2});
		}else{
		$.ajax({
			type : "post",
			url : "addComment.html",
			data : {
				openId : "${openId}",
				content : content
			},
			success : function(result) {
				if (result.flag >= 1) {
					$("#TextArea1").val("");
					layer.alert("发表成功",{icon:1});
					getCommentList(1);

				} else {
					layer.alert("发表失败",{icon:2});
				}

			},
			dataType : "Json"
		});
		}
	})

	//分页

	$(".tcdPageCode").createPage({
		pageCount : totalPage,
		current : pageNum,
		backFn : function(p) {
			// console.log(p);
			//单击回调方法，p是当前页码
			getCommentList(p);
		}
	});

	

	//评论字数限制
	function checkLength(which) {
		var maxChars = 140; //
		if (which.value.length > maxChars) {
			  layer.alert("您输入的字数已超过限制，超过的内容将被截取!");
			// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
			which.value = which.value.substring(0, maxChars);
			return false;
		} else {
			var curr = maxChars - which.value.length; //250 减去 当前输入的
			document.getElementById("sy").innerHTML = curr.toString();
			return true;
		}
	}



$(function() {
		//学生看视频列表显示
		$(".video_list_course .icon-left").click(function() {
			$(this).parent().css('width', '0px');
			$(this).stop(true, true).fadeOut();
			$(this).siblings('.yazhuo_couser_list_player').hide();
			$("#yazhuoVideo").css('width', '1200px');
			$(".video_list_course .operator").stop(true, true).fadeIn();
		});
		$(".video_list_course .operator .chapter").click(
				function() {
					$("#yazhuoVideo").css('width', '900px').animate('left',
							'0px');
					$(".video_list_course .operator").stop(true, true)
							.fadeOut();
					$(".video_list_course").css('width', '300px').animate(
							'left', '300px');
					$(this).parent().siblings('.yazhuo_couser_list_player')
							.show();
					$('.video_list_course .icon-left').stop(true, true)
							.fadeIn();
				});

	});  
</script>
</body>
</html>

 