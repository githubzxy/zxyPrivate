var thePlayer;//视频播放器
var domain_url = "/static/jwplayer/";
var _openCourseId,_showtime,_isHasTask;
var url1 ="http://localhost/12.mp4";
var lastTim=0;
var timer;
function loadJwPlayer(url,srtUrl,isCanDrag,showtime,isHasTask,openCourseId) {
	alert("loadJwplayer>>url>>"+url);
	_openCourseId = openCourseId;
	_showtime = showtime;
	//_openCourseId = openCourseId;
	_isHasTask = isHasTask;
	thePlayer = jwplayer("_player").setup({
        flashplayer: "/static/jwplayer/jwplayer.flash.swf",
        autostart: "true",
        bufferlength: '1024*1024',
        width: '100%',
        height: '100%',
        controls: false,  // 改参数设为fales则可以禁止用户拖动进度
        tracks: [{
            file: srtUrl,
            kind: "captions",
            "default": true
        }],
        playlist: [{duration:32,file:url,image:"/static/img/gg.png"}],
             "playlist.position":"right",
             "playlist.size":360,
        events: {
        	onComplete: function () { stopTime();
        	complationShow(url,thePlayer.getPosition())},
            onVolume: function () { console.log("声音大小改变!!!"); },
            onReady: function () { console.log("准备就绪!");},
            onPlay: function () {  console.log("开始播放");
            
            },
            onPause: function () { console.log("暂停!!!"); },
            onBufferChange: function () { console.log("缓冲改变!!!"); },
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
	timer =  setInterval("showTask();",15000);//每15秒执行一次
}

/**
 * 判断是否显示作业
 */
function showTask() {
	
	if(_isHasTask!=1)
	{
		stopTime(timer);
	}
	if (thePlayer!=null) {
		var position = thePlayer.getPosition();
		if (position >= _showtime) {
			stopTime(timer);
			pause();
			showTime();
		}
	}
	$("#_player").focus();
	play();
}
/**
 * 关闭计时器
 */
function stopTime(currenttimer) {
	if (currenttimer!=null) {
		clearInterval(currenttimer);
	}
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
function addStu(selectCourseId,vid,number){
	var url = "/student/course/record/"+selectCourseId+"/"+vid+"/"+number;
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
