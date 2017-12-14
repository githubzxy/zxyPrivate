<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<link rel="stylesheet" type="text/css" href="${res}/student/css/layout.css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/layout.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/front/js/jwplayer.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/front/js/jquery.page.js"></script><!-- 分页插件 -->
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
    <div class="video_header_left fl" onclick="javascript :history.go(-1);"><em></em><span>${names.courseTypeName}</span><span class="span1">&gt;</span> <span class="span2">${names.openCourseName}</span></div>
    <div class="video_header_center fl"><span class="span1">正在播放：</span><span class="span2" id="current">${video.name}</span></div>
    
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
     <div id="yazhuoVideo"> </div> 
     <div class="video_list_course">
        <i class="icon-left"></i>
        <div class="operator">
          <div class="op chapter"><em class="icon-menu"></em>章节</div>
          <div class="op notes"><em class="icon-note"></em>作业</div>
          <div class="op question"><em class="icon-addques"></em>讨论</div>
        </div>
         <!--视频集数--> 
         <div class="yazhuo_couser_list_player">
            <div class="yazhuo_couser_list_player_title">${videos[0].courseName}</div>
             <!-- <ul class="yazhuo_couser_list_player_listt"> -->
             <div class="scroll_list">
              <ul class="play">
             <c:forEach items="${videos}" var="varVideo" varStatus="status">
              <!--   <li  class="lastlist"> -->
              <div class="list_view_detail1">
                <a href="javascript:;" name="${varVideo.url}" class="aa  lock " id="${varVideo.videoId}">${varVideo.name}</a>
              </div>
               <!--  </li> -->
                </c:forEach>
           <!--   </ul> -->
            </ul>
            </div>
          </div>
         <!--/视频集数-->
     </div>
   </div>
  </div>
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
  <!--video_wrap_play end-->
  <div class="yazhuo_study_video_discuss w1200">
    <div class="yazhuo_discuss_video">
      <div class="yazhuo_video_tit"><h2>课程讨论</h2></div>
      <div class="yazhuo_textarea">
        <textarea id="TextArea1" onkeyup="checkLength(this);"></textarea>
        <div class="yahzhuonumlimit">您还可以输入：<span id="sy" style="color:#f00;">140</span></div>
        <div class="yazhuo_button_150 mb15"><a>发布讨论</a></div>
      </div>
      <div class="clear"></div>
       <!--讨论列表-->
       <div class="yazhuo_discuss_div_area">
         <ul class="yazhuo_discuss_list_area">
            <!-- <li>
              <div class="yazhuo_discuss_header_pic fl"><img src="img/test/3.jpg" title="欧攀" width="80" height="80"></div>
              <div class="yazhuo_discuss_neirong_con fr">
                <div class="yazhuo_discuss_neirong">这个将得还是不错的很好，同将得还是不错的很好，同将得还是不错的很好，同将得还是不错的很好，同将得还是不错的很好，同学们都听得懂！这个将得还是不错的很好，同学们都听得懂！这个将得还是不错的很好，同学们都听得懂！</div>
                <div class="yazhuo_discuss_xuesheng fr"><span class="xingming">欧攀</span>在<span class="timess">2015-09-23 14:23:32</span> 发表</div>
              </div>
            </li> --><!--单条评论数据-->
   
         </ul>
          <!-- 分页 -->
        <div class="tcdPageCode"></div>
        <!-- 分页 end -->  
       </div><!--/讨论列表-->
    </div>
    </div>

</div>
<!--mian-->

<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer end-->
<script type="text/javascript">
var pageNum;
var openId='${openId}';
var thePlayer;
var second='${video.second}';
var _second='${video.second}';
var videoId='${video.videoId}';
var unlockNum = '${unlockNumber}'; //已经解锁的个数
var ip="<%=url%>";
$(function(){
	getCommentList(1);
	if('${video.isover}'!=1){
	 LoadingJwPlayer('${video.url}');
	 lockOrUnlock(ids[unlockNum-1]);
	 
	}else{
		$("#current").html(courseNamesArr[0]);
	 LoadingJwPlayer(urlsArr[0]);
	 lockOrUnlock(ids[0].toString());
	 videoId=ids[0];
	}
	 startTimer(); 
	 
})
$(".notes").click(function(){
	  location.href="${res}/work/getHomeWork.html";
})
$(".question").click(function(){
	location.href="${res}/study/toDisCenter.html?id="+openId;
})
 var ids=new Array();
$(".list_view_detail1").children("a").each(function(){
	   $(this).attr("id")
     ids.push($(this).attr("id"));	   
});


var courseAllNmu = $(".play div").length;

var courseNamesArr = []; //课程名字数组
var urlsArr = []; //超链接数组

//取得课程名称和超链接
$(".list_view_detail1 a").each(function(){
 courseNamesArr.push($(this).html());
 urlsArr.push($(this).attr('name'));
});
var selectedVideoId;
//通过函数重写ul
function lockOrUnlock(changeColorParam) {
	var tmpHtml = "";//中间变量
 for (var i = 0; i < courseAllNmu; i++) {
	 if (unlockNum==courseAllNmu && i == courseAllNmu-1) {
		 var tmpLastHtml  = "";
		 if(ids.indexOf(changeColorParam)==unlockNum-1){
			 tmpLastHtml= '<div class="list_view_detail1">'
				 +'<a  class="aa play" onclick="getVideoBySelected('+ids[i]+')">'+ courseNamesArr[i] +'</a>'
	          +'</div>';     
		          
		     tmpHtml += tmpLastHtml;
		     break;
		 }
		 tmpLastHtml= '<div class="list_view_detail1">'
			 +'<a  class="aa lock" onclick="getVideoBySelected('+ids[i]+')">'+ courseNamesArr[i] +'</a>'
          +'</div>';     
	          
	     tmpHtml += tmpLastHtml;
		 
			break;
	         
			
	}
	 
	 if (i==ids.indexOf(changeColorParam)) {
		 tmpHtml += '<div class="list_view_detail1">'
             +'<a  class="aa play" onclick="getVideoBySelected('+ids[i]+')">'+ courseNamesArr[i] +'</a>'
           +'</div>';
		 continue;
	}
	
	
   if (i<unlockNum) {
	  
     tmpHtml += '<div class="list_view_detail1">'
                 +'<a  class="aa lock" onclick="getVideoBySelected('+ids[i]+')">'+ courseNamesArr[i] +'</a>'
               +'</div>';
   } else if (i>=unlockNum && i< courseAllNmu-1) {
     tmpHtml += '<div class="list_view_detail1">'
                 +'<a href="#" class="unlock">'+ courseNamesArr[i] +'</a>'
               +'</div>';
   }else {
     tmpHtml += '<div class="list_view_detail1">'
                 +'<a  href="#" class="unlock">'+ courseNamesArr[i] +'</a>'
               +'</div>';
   }
	
   
  
 };
 $(".play").html(tmpHtml);

}


var sign=0;//判断是否需要禁止拖动，解锁的课程视频是可以拖动的
//播放已经解锁的视频
function getVideoBySelected(selectedVideoId){
	 $.ajax({
			type:"post",
			url:"getVideoBySelected.html",
			 data:{openId:openId,videoId:selectedVideoId}, 
			 dataType:"json",
			success:function(result){
				 second=0;
				 _second=0;
				 videoId=result.video.videoId;
				/*  alert(ids);
				 alert(ids.indexOf(videoId.toString()));
				 alert(unlockNum); */
				$("#current").html(result.video.name);
				lockOrUnlock(selectedVideoId.toString());
				LoadingJwPlayer(result.video.url,videoId);
				 
				 
		},
		
		}); 
	
}
 var isFast=0;
//视频加载
function LoadingJwPlayer(fileUrl){
	var urlAddr=ip+"/"+fileUrl;
jwplayer.key="bAoNHra71KE/mHvb0sirT4HeWLTAkpiYa1mVsA==";
	  thePlayer=jwplayer("yazhuoVideo").setup({ 
  	    flashplayer: "${res}/plugin/jwPlayer/jwplayer.swf",
  	    file:urlAddr,
  	   /*  controls: false, */
  	    autostart : true , 
  	    height: "530px",
  	    width: "900px",
  	    volume: 80,
  	    image: "${res}/front/images/start.png",
  	    title:"关注心理健康",
  	    stretching:'uniform',
  	    smoothing: "true",
  	    events: {
  	    onReady: function(){
  	    	 thePlayer.seek(second);	
  	    	},
  		 
  		  onSeek: function () {
  		
  	  		  _second=thePlayer.getPosition();
  	  		
  	  		
  			isFast=1;
  	  		  },
  	  		 onPlay: function () {  
  	  			  console.log("开始播放");
  	  		 
  	  		  },
  	  		  onTime:function(){
  	  			  if(isFast==1){
  	  			 if( _second !=second){
  	  			 if(ids.indexOf(videoId.toString())>=unlockNum-1){ 
  	  	  			  thePlayer.seek(second);
  	  			 }
  	  	  	 	  _second=second; 
  	  			 }
  	  			  }
  	  		  },
  	  	  onPause: function () { 
  	  		  console.log("暂停!!!");
  	  		
  	  		  },

        onComplete:function() {
        	stopTimer();
    	$.ajax({
			type:"post",
			url:"getVideoByChapter.html",
			 data:{openId:openId,videoId:videoId,unlockNum:unlockNum}, 
			dataType: "json",
			success:function(result){
				var video=result.video;
			if(video==1){
				unlockNum++;
				if(result.task==1){
					layer.confirm('童鞋，视频已经观看完毕，是否立即完成相关作业？（ps:该课程已经学习完毕，请查看考试相关资讯）', {
					  btn: ['是的','取消'] //按钮
					}, function(){
						var isSubmit=result.isSubmit;
						var paperId=result.paperId;
						var studentPaperId=result.studentPaperId;
					  layer.alert('立即前往', {icon: 1},function(){
						 
	location.href="${res}/work/homeworkAdd.html?paperId="+paperId+"&isSubmit="+isSubmit+"&studentPaperId="+studentPaperId;
					  });
					  
					}, function(){
						layer.confirm('童鞋，课程已经学习完毕，是否立即查看考试相关资讯？', {
							  btn: ['是的','取消'] //按钮
							}, function(){
							  layer.alert('立即前往', {icon: 1},function(){
								  location.href="${res}/student/test/toMyTest.html";
							  });
							  
							}, function(){
							   
							});
					});
					}else{
						layer.confirm('童鞋，课程已经学习完毕，是否立即查看考试相关资讯？', {
							  btn: ['是的','取消'] //按钮
							}, function(){
							  layer.alert('立即前往', {icon: 1},function(){
								  location.href="${res}/student/test/toMyTest.html";
							  });
							  
							}, function(){
							   
							});
					}
				
				
			}else if(video==0){
				alert("欧哦，视频加载出错");
			}else{
				//询问框
				if(result.task==1){
				layer.confirm('童鞋，该视频已经观看完毕，是否立即完成相关作业？', {
				  btn: ['是的','取消'] //按钮
				}, function(){
					var paperId=result.paperId;
					var isSubmit=result.isSubmit;
					var studentPaperId=result.studentPaperId;
					  layer.alert('立即前往', {icon: 1},function(){
		location.href="${res}/work/homeworkAdd.html?paperId="+paperId+"&isSubmit="+isSubmit+"&studentPaperId="+studentPaperId;
					  });
				}, function(){
					 LoadingJwPlayer(video.url);
						videoId=video.videoId;
						second=video.second;
						$("#current").html(video.name);
						//当看完一个视频后
						if(result.flag==1){
						unlockNum++;
						}
						startTimer();
						lockOrUnlock(videoId.toString()); 
				});
				}else{
					layer.confirm('童鞋，该视频已经观看完毕，是否继续观看？', {
						  btn: [ '是的','取消'] //按钮
						}, function(){
					
							layer.msg('玩命加载中',function(){
								 LoadingJwPlayer(video.url);
									videoId=video.videoId
									second=video.second;
									$("#current").html(video.name);
									//当看完一个视频后,flag为1是需要向下解锁，为0就是不需要向下解锁
									if(result.flag==1){
									unlockNum++;
									}
									startTimer();
									lockOrUnlock(videoId.toString());
							});
						
						}, function(){    
						});
					
				}
					
				
			}
		},
		
		});
    	
    },
    onError:function(){
    		alert('加载视频失败！请选择其他线路！');
    	   }
    	 
     }
	  }) 
	
	 }
	 
	 
var myVar;
function startTimer(){ 
    /*setInterval() 间隔指定的毫秒数不停地执行指定的代码*/
    myVar=setInterval(function(){
    	isFast=0;
    	second=parseInt(thePlayer.getPosition());
    	if(thePlayer.getState() !='PAUSED'){
    	 $.ajax({
			type:"post",
			url:"updatePlayRecord.html",
			 data:{openId:openId,second:second,videoId:videoId,unlockNum:unlockNum}, 
			 dataType:"json",
			success:function(result){
				var flag=result.flag;
				if(flag!=0){
					 console.log("修改记录成功");
				}else{
					console.log("修改记录失败");	
				}
		},
		
		}); 
    	}
    	},10000);
    }

  
function stopTimer()
{
	/* clearInterval() 方法用于停止 setInterval() 方法执行的函数代码*/
    clearInterval(myVar);
}

//评论字数限制
function checkLength(which) {
  var maxChars = 140; //
  if(which.value.length > maxChars){
    alert("您输入的字数已超过限制，超过的内容将被截取!");
    // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
    which.value = which.value.substring(0,maxChars);
    return false;
  }else{
    var curr = maxChars - which.value.length; //250 减去 当前输入的
    document.getElementById("sy").innerHTML = curr.toString();
    
    return true;
  }
}

  
//分页
var pageNum;
var totalPage;
/* $(".tcdPageCode").createPage({
    pageCount:totalPage,
    current:pageNum,
    backFn:function(p){
        // console.log(p);
        //单击回调方法，p是当前页码
        getCommentList(p)
    }

}); */
//局部刷新评论
function getCommentList(p){
		$.ajax({
		type:"post",
		url:"${res}/main/commentList.html",
		data:{openId:openId,pageNum:p},
		success:function(result){
			var comments=result.comments;
			 $(".yazhuo_discuss_list_area").empty();
			 if(comments==null||comments.length<1){
					$(".tcdPageCode").html("暂无评论");
			 }else{
			for(var i=0;i<comments.length;i++){
				 $(".yazhuo_discuss_list_area").append("<li><div class='yazhuo_discuss_header_pic fl'><img src='<%=url%>/"
						 +comments[i].avatar+"' title='"
						 +comments[i].userName+"' width='80' height='80'></div><div class='yazhuo_discuss_neirong_con fr'><div class='yazhuo_discuss_neirong'>"
	               +comments[i].content+"</div><div class='yazhuo_discuss_xuesheng fr'><span class='xingming'>"
	               +comments[i].userName+"</span>在<span class='timess'>"
	               +comments[i].createDt+"</span> 发表</div></div></li>")
	               
			}
			  pageNum=result.page.pageNum;
			  totalPage=result.page.totalPage;
			
			$(".tcdPageCode").createPage({
	            pageCount:totalPage,
	            current:pageNum,
	            backFn:function(p){
	                // console.log(p);
	                //单击回调方法，p是当前页码
	                getCommentList(p)
	            }
			
	        });
			  
		}
		},
		dataType:"Json"
}) 
  }
    //发表评论   
$(".mb15").click(function(){
	var content=$("#TextArea1").val();
	if(content.length <= 0){
		layer.alert("请输入评论内容");
	}else{
		$.ajax({
			type:"post",
			url:"${res}/main/addComment.html",
			data:{openId:openId,content:content},
			success:function(result){
				if(result.flag>=1){
					$("#TextArea1").val("");
					layer.alert("发表成功");
					getCommentList(1);
				
				}else{
					layer.alert("发表失败");
				}
	
			
		},
		dataType:"Json"
		}); 
	}
})

//浏览器窗口切换
 $(window).blur(function() {
	thePlayer.play(false);
	stopTimer();
}); 
$(window).focus(function() {
	thePlayer.play(true);
	startTimer();
}); 

//禁止jwplayer拖动
/*  var maxPlayPosition;   = parseInt({KS:Field:historytime});  
var seeking = false;
jwplayer().onTime(function(event) 
		{
		if (!seeking) 
		{
		maxPlayPosition = Math.max(event.position, maxPlayPosition); 
		}
		})
		.onPlaylistItem(function()
		{
		maxPlayPosition = 0.0;
		}) // consider using only if you have playlists
		.onSeek(function (event) 
		{
		if (!seeking) 
		{
		if (event.offset > maxPlayPosition) 
		{
		seeking = true;
		setTimeout(function ()
		{ 
		jwplayer().seek(maxPlayPosition);
		}, 100);
		}
		} 
		else 
		{
		seeking = false;
		} 
		}); */
		  
		 
</script>
</body>
</html>

   



























