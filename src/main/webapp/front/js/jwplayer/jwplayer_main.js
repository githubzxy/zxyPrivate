var thePlayer;//视频播放器
var domain_url = "${res}/front/js/jwplayer/";
var _openCourseId,_showtime,_isHasTask;
var url1 ="http://localhost/12.mp4";
var lastTim=0;
function loadJwPlayer(url,srtUrl,isCanDrag,showtime,isHasTask,openCourseId,startTime) {
	_openCourseId = openCourseId;
	_showtime = showtime;
	//_openCourseId = openCourseId;
	_isHasTask = isHasTask;
	thePlayer = jwplayer("_player").setup({
        flashplayer: "${res}/front/js/jwplayer/jwplayer.flash.swf",
        autostart: "true",
        bufferlength: '1024*1024',
        width: '100%',
        height: '100%',
        controls: true,  // 改参数设为fales则可以禁止用户拖动进度
        tracks: [{
            file: srtUrl,
            kind: "captions",
            "default": true
        }],
        playlist: [{duration:32,file:url,image:"/static/img/gg.png"}],
             "playlist.position":"right",
             "playlist.size":360,
        events: {
        	onComplete: function () {if($(".click").next("li").hasClass("s")){addStu(2);}stopTime();complationShow(url,thePlayer.getPosition());},
            onVolume: function () { console.log("声音大小改变!!!"); },
            onReady: function () { console.log("准备就绪!");},
            onPlay: function () {  console.log("开始播放");/*if(_showtime != showtime){thePlayer.seek(_showtime);_showtime=showtime}*/},
            //onSeek: function () { _showtime=thePlayer.getPosition();},
            onPause: function () { console.log("暂停!!!");},
            onBufferChange: function () { console.log("缓冲改变!!!");},
            onBufferFull: function () { console.log("视频缓冲完成!!!");},
            onError: function (obj) { console.log("播放器出错!!!" + obj.message);},
            onFullscreen: function (obj) { if (obj.fullscreen) { console.log("全屏");/*openBig();*/ } else { console.log("非全屏"); /*goBackWidth();*/} },
            onMute: function (obj) { console.log("静音/取消静音") }
        }
    });
	var videoId=$("#_cd1").attr("x");
	lastTim=$.cookie(videoId+"");
	if(lastTim!=null&&lastTim!=0){
		thePlayer.seek(lastTim);
	}
	if (isCanDrag) {
		$("#_playerButton").hide();
	}
}

/**
 * 判断是否显示作业
 */
function _ishasTask(prefix1,openCourseId,vid){
	jQuery.ajax({
		type:"POST",   
		async: false,    
		cache: false,     
		url: prefix1+"/student/hastask/"+openCourseId+"/"+vid, 
		dataType:"text",  
		timeout : 120000, 
		success:function(d){
		  var data=JSON.parse(d);
		  if(data&&data.paperExamineId&&data.paperExamineId.length>0){
			  if(data.hasPaperStudent&&data.hasPaperStudent=="0"){
				  $(".operation").show();
				  _loadTask(prefix1,data.paperExamineId);
			  }
		  }else{
			  jQuery("#task_video").html("");
		  }
		} , 
		error : function(e){} 
	});

}

/**
 * 开始播放
 */
function play() {
	if (thePlayer == null) return;
	if (thePlayer.getState() != 'PLAYING')
		thePlayer.play(true);
}
/**
 * 暂停播放
 */
function pause() {
	if (thePlayer == null) return;
	if (thePlayer.getState() == 'PLAYING') 
        thePlayer.play(false);
}
/**
 * 添加记录
 */
function addStu(i){
	var url;
	if(i==1){
		url = '/student/course/record/'+$("#_cd1").attr("s")+'/'+$("#_cd1").attr("x")+'/'+$(".click").attr("n")+'/'+0+'/'+1;
	}else if(i==2){
		url = '/student/course/record/'+$("#_cd1").attr("s")+'/'+$("#_cd1").attr("x")+'/'+$(".click").attr("n")+'/'+parseInt(thePlayer.getDuration())+'/'+parseInt(thePlayer.getDuration());
	}else{
		url = '/student/course/record/'+$("#_cd1").attr("s")+'/'+$("#_cd1").attr("x")+'/'+$(".click").attr("n")+'/'+parseInt(thePlayer.getPosition())+'/'+parseInt(thePlayer.getDuration());
	}
	$.ajax({
		type:"post",
		url:url,
		data:{},
		dataType:"String",
		success:function(dat){
		}
	})
	if(i==2){
		unlock1();
	}
		
}
/**
 * 视频看完后添加学生的观看记录
 * @param path
 */
function complationShow(path,time){
	$.ajax({
		type:"post",
		url:"/student/course/videoComplation",
		data:{"url":path,"time":time},
		dataType:"string",
		success:function(dat){
		}
	})
}
function unlock1(){
	var v=$(".click").next("li");
	if(v.hasClass("exam")&&v.hasClass("s")){
		v.removeClass("s");
		$("#_exam_span").remove();
		v.addClass("x");
	}else if(v&&v.size()>0&&v.hasClass("s")){
		var vidx=v.attr("x");
		v.removeClass("s");
		$("#_"+v.attr("n")+"_span").remove();
		$(".click").removeClass("click");
		v.addClass("click");
		v.addClass("unlock");
		$("#_curr_").html(v.attr("n"));
		_loadVideo($(".click").attr("x"),$("#_cd1").attr("o"),$("#_cd1").attr("s"),$(".click").attr("n"),$("#_cd1").attr("c"));
		addStu(1);
//		if(vidx&&vidx.length>0){
//			$.ajax({
//				type:"POST",
//				url: '/student/hasrecord/'+$("#_cd1").attr("s")+'/'+$(".click").attr("x"), 
//				dataType:"text",  
//				timeout : 120000, 
//				success:function(d){
//					alert(d);
//				  if(d=="ok"){
//					    v.removeClass("s");
//					    v.addClass("unlock");
//					    $("#_"+v.attr("n")+"_span").remove();
//				  }else{
//					  _loadVideo($(".click").attr("x"),$("#_cd1").attr("o"),$("#_cd1").attr("s"),$(".click").attr("n"),$("#_cd1").attr("c"));
//				  }
//				} , 
//				error : function(e){} 
//			});
//			
//		}else{
//			var s=v.attr("s");
//			if(s&&s==4){
//				v.removeClass("s");
//				$("#_exam_span").remove();
//				v.attr("target","_blank");
//				v.attr("href","/student/examine/detail/"+$("#_cd1").attr("o")+"_1");
//			}
//		}
	}
}