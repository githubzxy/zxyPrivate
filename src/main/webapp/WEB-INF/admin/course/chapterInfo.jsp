<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<link href="${res }/plugin/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<link href="${res }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res }/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/webuploader/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${res}/webuploader/0.1.5/webuploader.css">
<link rel="stylesheet" type="text/css" href="${res}/webuploader/icheck/icheck.css">
<script type="text/javascript" src="${res}/webuploader/bootstrap-3.3.7/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/webuploader/0.1.5/webuploader.js"></script>
<script type="text/javascript" src="${res}/webuploader/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${res}/webuploader/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${res }/plugin/uploadify/jquery.uploadify.min.js"></script>
<%-- <script type="text/javascript" src="${res }/js/upload/uploadVideo.js"></script> --%>
<script type="text/javascript" src="${res }/js/global.js"></script>
<script type="text/javascript" src="${res }/js/chapterInfo.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<%-- <script type="text/javascript" src="${res }/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res }/plugin/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="${res }/plugin/swfupload/fileprogress.js"></script>
<script type="text/javascript" src="${res }/plugin/swfupload/handlers.js"></script> --%>
<style type="text/css">
.video_tt{font-size:16px;font-weight:600;color:#110;padding:10px;}
.font-wenzi{font-weight:500;font-size:14px;color:#000;padding:10px;}
.upload_resource_wrap > h2{font-weight:600;font-size:15px;color:#000;padding:10px 0 10px 10px;}
.upload_video_wrap .upload{margin:10px;}
.upload_video_wrap .uploadify-button-text{display:block;width:100%;text-align:center;}
#uploadify2{display:inline-block;margin-top:10px;}
#resource_list_table{position:relative;}
.newChapter{border:none;background:#f60;}
#resource_list_table .ur_sure {position:absolute;top:10px;left:540px;}
#fileId{float:left;margin-left:30px;}
.tablelist td{line-height:22px; text-indent:0px;border-bottom: dotted 1px #c7c7c7; border-right: dotted 1px #c7c7c7;}
</style>
</head>
<body>
<input id="sessionId" type="hidden" value="${pageContext.session.id}"/> 
	<div class="title">
		<input class="inputText" name="moduleName" id="moduleName"
			value="${chapterName}" maxlength="16" type="hidden">
	</div>
	<div class="upload_video_wrap" id="upload_video_wrap">
		<table>
			<tr>
				<td>
				<input type="hidden" id="courseId" value="${courseId }">
					<span class="video_tt"><span>教学视频</span>
					</span>
				</td>
				<td class="upload" id="uploadSelect" style=" position: absolute; opacity: 0; filter:Alpha(opacity=0);">
				
					<div id="uploader" class="wu-example">
    <div id="thelist" class="uploader-list"></div>
    <div class="btns">
        <div id="picker">选择视频</div>
        <button id="ctlBtn" class="btn btn-default">开始上传</button>
    </div>
</div>
</td>
<td>
<div id="vidiofile" class="file" style="display: none">
					    <input name="videoId" id="videoId" type="hidden"  value="${video.videoId}"/>
						<input name="fileId" class="fileId" id="fileId" fN="" type="text" value="${video.name}"/>
						<c:if test="${video.videoId!=null}">
      <a href="javascript:void(0)" onclick="updateVideo(${video.videoId},${video.courseId})" class='ext_btn ext_btn_error'>修改</a>
       </c:if>
       <c:if test="${video.videoId==null}">
     <%--  <a href="javascript:void(0)" onclick="delVideo(${video.videoId},${video.courseId})" class='ext_btn ext_btn_error'>删除</a> --%>
      <a href="javascript:void(0)" onclick="delVideo()" class='ext_btn ext_btn_error'>删除</a>
       </c:if>
					</div>
</td>
					
				<td>
				
					
					<span style="display:inline">(*.flv;*.mp4，大小1GB以内)</span>
				</td>
			</tr>
			
		</table>
	</div>
	<div class="upload_resource_wrap">
		<h2>教学资源或概要信息</h2>
		<div class="ueditor_wrap">
			<textarea class="textbox" id="chapterInfo"
				style="width: 98%; height: 150px; resize: none;margin-left:12px;">${video.info }</textarea>
		</div>
		<div style="margin-top: 15px; margin-left: 20px;">
			<h2 style="font-size: 16px; padding-top: 10px; padding-left: 5px;">教学课件上传或者资源库选择
			</h2>
			<div id="uploadfileresource"  style="width: 98%;margin:10px auto; height: 300px;">
					<table width="100%" class="tablelist">
						<thead>
							<tr>
								<th width="10%" valign="middle" align="center">序号</th>
								<th width="50%" valign="middle" align="center">文件名</th>
								<th width="20%" valign="middle" align="center">操作</th>
							</tr>
						</thead>
						<tbody id="resource_list_table">
							<c:forEach items="${FileList}" var="file">
								<tr id="${file.id}">
									<td valign="middle" align="center"><input
										name="resourceIds" value="${file.id}"
										type="checkbox" checked="checked"></td>
									<td valign="middle" align="center">${file.name}</td>
									<td valign="middle" align="center">
									<input class="ext_btn ext_btn_error" value="删除" type="button"
										onclick="delFile(this,'${file.id}','${file.url}')" />
									</td>
								</tr>
							</c:forEach>
							</tbody>
							<tfooter>
							<tr style="height:40px;">
							<td valign="middle" align="center" colspan="3" style="hieght:40px;">
							<a>
							<div id="uploader2" class="wu-example">
    <div id="thelist2" class="uploader-list"></div>
    <div class="btns">
        <div id="picker2">选择文件</div>
        <button id="ctlBtn2" class="btn btn-default">开始上传</button>
        <a href="javascript:void(0)" class="ur_sure dialog" style="display:inline-block;width:120px;line-height:34px;height:34px;text-align:center;font-size:13px;color:#fff;border-radius:8px;background:#f00;" id="dialog">资源库资源选择</a>
    </div>
</div>
</a>
							
						    </td>
						    </tr>
						    </tfooter>
					</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var courseId; 
    $(function(){ 
    	parent.document.getElementById("chapterName").value=$("#moduleName").val();
    	 courseId = $("#courseId").val();
    	//alert(courseId);
    	var fileId = '${video.videoId}';
    	if(fileId =="" || fileId == null){
    		  var obj = document.getElementById("uploadSelect");
    		   obj.style.cssText = "opacity: 1; filter:Alpha(opacity=1);"
    		$(".font-wenzi").css('display','inline-block');
    		
    	}else{
    		$(".file").css('display','inline-block');
    	}
    	//视频上传
    	 $list = $("#thelist"),
 		$btn = $("#ctlBtn"),
 		state = "pending",
 		uploader;
 	  var uploader = WebUploader.create({

 		    // swf文件路径
 		    swf:'${res}/webuploader/0.1.5/Uploader.swf',

 		    // 文件接收服务端。
 		    server: '${res}/resource/uploadRes2.html',
 		    duplicate:true, //同一文件是否可重复选择
 		  /*  auto: true, */

 		    // 选择文件的按钮。可选。
 		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
 		    formData: { "courseId": courseId,"resourceType":1},
 		    pick: '#picker',
 		    multiple: false,
 		   method:'POST',
 		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
 		    resize: false
 		    /* fileSingleSizeLimit:2*1024*1024 , */
 		   /*   chunked : true, // 分片处理 */
 			/* chunkSize : 50 * 1024 * 1024 */  // 每片50M,经过测试，发现上传1G左右的视频大概每片50M速度比较快的，太大或者太小都对上传效率有影响 
 		});
 	// 当有文件被添加进队列的时候
 	  uploader.on( 'fileQueued', function( file ) {
 	      $list.html( '<div id="' + file.id + '" class="item">' +
 	          '<h4 class="info">' + file.name + '</h4>' +
 	          '<p class="state">等待上传...</p>' +
 	      '</div>' );
 	  });
 	// 文件上传过程中创建进度条实时显示。
 	  uploader.on( 'uploadProgress', function( file, percentage ) {
 	      var $li = $( '#'+file.id ),
 	          $percent = $li.find('.progress .progress-bar');

 	      // 避免重复创建
 	      if ( !$percent.length ) {
 	          $percent = $('<div class="progress progress-striped active">' +
 	            '<div class="progress-bar" role="progressbar" style="width: 0%">' +
 	            '</div>' +
 	          '</div>').appendTo( $li ).find('.progress-bar');
 	      }

 	      $li.find('p.state').text('上传中');

 	      $percent.css( 'width', percentage * 100 + '%' );
 	  });
 	  uploader.on( 'uploadSuccess', function( file ) {
 		  /*   $( '#'+file.id ).find('p.state').text('已上传'); */
 		 $( '#'+file.id ).find('p.state').text('');
		 layer.alert("上传成功！",{icon:1});
 		});

 		uploader.on( 'uploadError', function( file ) {
 		    $( '#'+file.id ).find('p.state').text('上传出错');
 		});

 		uploader.on( 'uploadComplete', function( file ) {
 		    $( '#'+file.id ).find('.progress').fadeOut();
 		});
 		uploader.on('all', function (type) {
 	        if (type === 'startUpload') {
 	            state = 'uploading';
 	        } else if (type === 'stopUpload') {
 	            state = 'paused';
 	        } else if (type === 'uploadFinished') {
 	            state = 'done';
 	        }

 	        if (state === 'uploading') {
 	            $btn.text('暂停上传');
 	        } else {
 	            $btn.text('开始上传');
 	        }
 	    });

 	    $btn.on('click', function () {
 	        if (state === 'uploading') {
 	            uploader.stop();
 	        } else {
 	            uploader.upload();
 	        }
 	    });
 	   uploader.on("uploadAccept", function (object, ret) {
           //服务器响应了
           //ret._raw  类似于 data
           var data = JSON.parse(ret._raw);
      	$(".fileId").attr("fN",data.id);
       	$(".fileId").append(data.name);
       	$(".font-wenzi").css('display','none');
       	$(".file").css('display','inline-block'); 
     	$(".upload").css('display','none');
    	$(".fileId").val(data.name);
       });
    }); 
    $(function(){ 
    	parent.document.getElementById("chapterName").value=$("#moduleName").val();
    	 courseId = $("#courseId").val();
    	//视频上传
    	 $list2 = $("#thelist2"),
 		$btn2 = $("#ctlBtn2"),
 		state = "pending",
 		uploader2;
 	  var uploader2 = WebUploader.create({

 		    // swf文件路径
 		    swf:'${res}/webuploader/0.1.5/Uploader.swf',

 		    // 文件接收服务端。
 		    server: '${res}/resource/uploadRes2.html',

 		    // 选择文件的按钮。可选。
 		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
 		    formData: { "courseId": courseId,"resourceType":2,'chapterId': 1},
 		    pick: '#picker2',

 		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
 		    resize: false
 		});
 	// 当有文件被添加进队列的时候
 	  uploader2.on( 'fileQueued', function( file ) {
 	      $list2.append( '<div id="' + file.id + '" class="item">' +
 	          '<h4 class="info">' + file.name + '</h4>' +
 	          '<p class="state">等待上传...</p>' +
 	      '</div>' );
 	  });
 	// 文件上传过程中创建进度条实时显示。
 	  uploader2.on( 'uploadProgress', function( file, percentage ) {
 	      var $li = $( '#'+file.id ),
 	          $percent = $li.find('.progress .progress-bar');

 	      // 避免重复创建
 	      if ( !$percent.length ) {
 	          $percent = $('<div class="progress progress-striped active">' +
 	            '<div class="progress-bar" role="progressbar" style="width: 0%">' +
 	            '</div>' +
 	          '</div>').appendTo( $li ).find('.progress-bar');
 	      }

 	      $li.find('p.state').text('上传中');

 	      $percent.css( 'width', percentage * 100 + '%' );
 	  });
 	  uploader2.on( 'uploadSuccess', function( file ) {
 		   /*  $( '#'+file.id ).find('p.state').text('已上传'); */
 		    $( '#'+file.id ).find('p.state').text('');
 		   $(".info").text("");
 		 layer.alert("上传成功！",{icon:1});
 		});

 		uploader2.on( 'uploadError', function( file ) {
 		    $( '#'+file.id ).find('p.state').text('上传出错');
 		});

 		uploader2.on( 'uploadComplete', function( file ) {
 		    $( '#'+file.id ).find('.progress').fadeOut();
 		});
 		uploader2.on('all', function (type) {
 	        if (type === 'startUpload') {
 	            state = 'uploading';
 	        } else if (type === 'stopUpload') {
 	            state = 'paused';
 	        } else if (type === 'uploadFinished') {
 	            state = 'done';
 	        }

 	        if (state === 'uploading') {
 	            $btn2.text('暂停上传');
 	        } else {
 	            $btn2.text('开始上传');
 	        }
 	    });

 	    $btn2.on('click', function () {
 	        if (state === 'uploading') {
 	            uploader2.stop();
 	        } else {
 	            uploader2.upload();
 	        }
 	    });
 	   uploader2.on("uploadAccept", function (object, ret) {
           //服务器响应了
           //ret._raw  类似于 data
           var dat = JSON.parse(ret._raw);
        $("#resource_list_table").append('<tr><td valign="middle" align="center">'+
                '<input name="fileIds" class="resourceId" value="'+dat.id+'" type="checkbox" checked="checked">'+
                '</td><td valign="middle" align="center">'+dat.name+'</td><td valign="middle" align="center">'+
				'<input class="ext_btn ext_btn_error" value="删除" type="button" onclick="this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode)"></td></tr>');
       });
    });
    
    </script>
</html>