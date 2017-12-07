jQuery(function() {
	var swfuVideo,swfuSubtitle,swfuPic;
	var _uploadObj=$("#upload_video");
	var settingsVideo = {
		flash_url : prefix+"/static/public/swfupload/swfupload.swf",
		upload_url: prefix+'/managers/upload',
		file_post_name : "uploadfile",
		post_params: {"dir":_uploadObj.attr("path")},
		file_size_limit : "1024 MB",
		file_types : _uploadObj.attr("videoTypes"),
		file_types_description : "Video Files",
		file_upload_limit : 100,
		file_queue_limit : 0,
		custom_settings : {
			progressTarget : "fsUploadProgress_video",
			cancelButtonId : "btnCancel_video"
		},
		debug: false,
	
		// Button settings
		button_image_url: prefix+"/static/public/swfupload/images/80x30.png",
		button_cursor:SWFUpload.CURSOR.HAND,
		button_action:SWFUpload.BUTTON_ACTION.SELECT_FILE,
		button_width: "80",
		button_height: "30",
		button_placeholder_id: "_uploadfile_video",
		button_text: '<span class="theFont">上传视频</span>',
		button_text_style: '.theFont {color:#FFFFFF;font-size:14px;font-family:"Microsoft YaHei","宋体","Georgia", "Times New Roman", "Times", "serif";}',
		button_text_left_padding: 10,
		button_text_top_padding: 2,
		
		// The event handler functions are defined in handlers.js
		file_queued_handler : fileQueued,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		upload_start_handler : uploadStart,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccessVideo,
		upload_complete_handler : uploadComplete,
		queue_complete_handler : queueComplete	// Queue plugin event
	};
	
	swfuVideo = new SWFUpload(settingsVideo);
	
	var settingsSubtitle = {
			flash_url : prefix+"/static/public/swfupload/swfupload.swf",
			upload_url: prefix+'/managers/upload',
			file_post_name : "uploadfile",
			post_params: {"dir":_uploadObj.attr("path")},
			file_size_limit : "200 MB",
			file_types : _uploadObj.attr("subtitleTypes"),
			file_types_description : "Subtitle Files",
			file_upload_limit : 100,
			file_queue_limit : 0,
			custom_settings : {
				progressTarget : "fsUploadProgress_subtitle",
				cancelButtonId : "btnCancel_subtitle"
			},
			debug: false,
		
			// Button settings
			button_image_url: prefix+"/static/public/swfupload/images/80x30.png",
			button_cursor:SWFUpload.CURSOR.HAND,
			button_action:SWFUpload.BUTTON_ACTION.SELECT_FILE,
			button_width: "80",
			button_height: "30",
			button_placeholder_id: "_uploadfile_subtitle",
			button_text: '<span class="theFont">上传字幕</span>',
			button_text_style: '.theFont {color:#FFFFFF;font-size:14px;font-family:"Microsoft YaHei","宋体","Georgia", "Times New Roman", "Times", "serif";}',
			button_text_left_padding: 10,
			button_text_top_padding: 2,
			
			// The event handler functions are defined in handlers.js
			file_queued_handler : fileQueued,
			file_queue_error_handler : fileQueueError,
			file_dialog_complete_handler : fileDialogComplete,
			upload_start_handler : uploadStart,
			upload_progress_handler : uploadProgress,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccessSubtitle,
			upload_complete_handler : uploadComplete,
			queue_complete_handler : queueComplete	// Queue plugin event
		};
	swfuSubtitle = new SWFUpload(settingsSubtitle);
	
		var settingsPic = {
				flash_url : prefix+"/static/public/swfupload/swfupload.swf",
				upload_url: prefix+'/managers/upload',
				file_post_name : "uploadfile",
				post_params: {"dir":_uploadObj.attr("path")},
				file_size_limit : "2 MB",
				file_types : _uploadObj.attr("picTypes"),
				file_types_description : "Image Files",
				file_upload_limit : 100,
				file_queue_limit : 0,
				custom_settings : {
					progressTarget : "fsUploadProgress_pic",
					cancelButtonId : "btnCancel_pic"
				},
				debug: false,
			
				// Button settings
				button_image_url: prefix+"/static/public/swfupload/images/80x30.png",
				button_cursor:SWFUpload.CURSOR.HAND,
				button_action:SWFUpload.BUTTON_ACTION.SELECT_FILE,
				button_width: "80",
				button_height: "30",
				button_placeholder_id: "_uploadfile_pic",
				button_text: '<span class="theFont">预览图片</span>',
				button_text_style: '.theFont {color:#FFFFFF;font-size:14px;font-family:"Microsoft YaHei","宋体","Georgia", "Times New Roman", "Times", "serif";}',
				button_text_left_padding: 10,
				button_text_top_padding: 2,
				
				// The event handler functions are defined in handlers.js
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccessPic,
				upload_complete_handler : uploadComplete,
				queue_complete_handler : queueComplete	// Queue plugin event
			};
		swfuPic = new SWFUpload(settingsPic);	
			
});
/** swfupload  start**/
function uploadSuccessVideo(file, serverData) {
	try {
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("上传完成.");
		progress.toggleCancel(false);
		var _data= JSON.parse(serverData);
		var str = '<a href="'+$("#upload_video").attr("data")+_data.path+'">[下载]</a>&nbsp;';
		str += "<a href='javascript:deleteFile(\""+_data.path+"\",\"_videoShow\",\"url\")'>[删除]</a>";
		$("#_videoShow").html(str);
		$("#url").val(_data.path);
		var vname=$.trim($("#videoName").val());
		if(!vname||vname.length<0)
			$("#videoName").val(file.name);
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadSuccessSubtitle(file, serverData) {
	try {
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("上传完成.");
		progress.toggleCancel(false);
		var _data= JSON.parse(serverData);
		var str = '<a href="'+$("#upload_video").attr("data")+_data.path+'">[下载]</a>&nbsp;';
		str += "<a href='javascript:deleteFile(\""+_data.path+"\",\"_subtitleShow\",\"srt\")'>[删除]</a>";
		$("#_subtitleShow").html(str);
		$("#srt").val(_data.path);
		
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadSuccessPic(file, serverData) {
	try {
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("上传完成.");
		progress.toggleCancel(false);
		var _data= JSON.parse(serverData);
		var str = '<a href="'+$("#upload_video").attr("data")+_data.path+'">[下载]</a>&nbsp;';
		str += "<a href='javascript:deleteFile(\""+_data.path+"\",\"_picShow\",\"pic\")'>[删除]</a>";
		$("#_picShow").html(str);
		$("#pic").val(_data.path);
		
	} catch (ex) {
		this.debug(ex);
	}
}

function deleteFile(file,id1,id2){
	$.ajax({
		url:prefix+"/managers/delete",
		data:{fileName:file},
		type: "post",
		dataType:"json",
		timeout:60000,
		success: function(data){
			$("#"+id1).html("未上传");
			$("#"+id2).val("");
		},
		error:function(e){
			
		}
	});
}


/** swfupload end**/