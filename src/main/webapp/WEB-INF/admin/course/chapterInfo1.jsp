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
<script type="text/javascript" src="${res }/js/jquery-1.11.3.js"></script>
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
						<span class="font-wenzi" style="display: inline-block">
							<c:if test="${video.videoId==null}"><b>无视频</b></c:if>
						</span>
					</span>
				</td>
				<td>
					<div class="upload " style="display: none">
					<input type="file" class="uploadify" id="uploadify" name="fileData">
					</div>
					<div id="vidiofile" class="file" style="display: none">
					    <input name="videoId" id="videoId" type="hidden"  value="${video.videoId}"/>
						<input name="fileId" class="fileId" id="fileId" fN="" type="text" value="${video.name }"/>
						<c:if test="${video.videoId!=null}">
      <a href="javascript:void(0)" onclick="updateVideo(${video.videoId},${video.courseId})" class='ext_btn ext_btn_error'>修改</a>
       </c:if>
       <c:if test="${video.videoId==null}">
     <%--  <a href="javascript:void(0)" onclick="delVideo(${video.videoId},${video.courseId})" class='ext_btn ext_btn_error'>删除</a> --%>
      <a href="javascript:void(0)" onclick="delVideo()" class='ext_btn ext_btn_error'>删除</a>
       </c:if>
					</div>
					<div id="fileQueue"></div>
					<%-- <span id="_uploadfile_video"></span> &nbsp;&nbsp;(<spring:message code='upload_video_types'/>，大小700M以内)
					     	<div id="fsUploadProgress_video"></div>
							  <input id="btnCancel_video" type="button" value="Cancel All Uploads" onclick="swfuVideo.cancelQueue();" disabled="disabled" style="display:none;"/>
				 --%></td>
				<td>
					
					<span style="display:inline">(*.flv;*.mp4，大小2GB以内)</span>
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
							<a id="uploadify2" >资源上传</a>
							<a href="javascript:void(0)" class="ur_sure dialog" style="display:inline-block;width:120px;line-height:25px;height:25px;text-align:center;font-size:13px;color:#fff;border-radius:8px;background:#f00;" id="dialog">资源库资源选择</a>
						    </td>
						    </tr>
						    </tfooter>
					</table>
					<div id="fileQueue2"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var sessionId=$("#sessionId").val();
    $(function(){ 
    	parent.document.getElementById("chapterName").value=$("#moduleName").val();
    	var courseId = $("#courseId").val();
    	//alert(courseId);
    	var fileId = '${video.videoId}';
    	if(fileId =="" || fileId == null){
    		$(".upload").css('display','block');
    		$(".font-wenzi").css('display','inline-block');
    	}else{
    		$(".file").css('display','inline-block');
    	}
    	var jsessionid='${pageContext.session.id}';
        $(".uploadify").uploadify({ 
        	'formData'      : {'someKey' : 'someValue', 'someOtherKey' : 1},
            'debug'     : false, //开启调试  
            'auto'           : true, //是否自动上传     
            'swf'            : '${res }/plugin/uploadify/uploadify.swf',  //引入uploadify.swf    
            'uploader'       : '${res }/resource/uploadRes.html;jsessionid='+sessionId, //请求路径    
            'queueID'        : 'fileQueue',//队列id,用来展示上传进度的    
            'width'     : '100',  //按钮宽度    
            'height'    : '25',  //按钮高度  
            'queueSizeLimit' : 1,  //同时上传文件的个数    
            'fileTypeDesc'   : '视频文件:',    //可选择文件类型说明  
            'fileTypeExts'   : '*.mp4;*.flv;', //控制可上传文件的扩展名    
            'multi'          : true,  //允许多文件上传    
            'buttonText'     : '视频上传',//按钮上的文字    
            'fileSizeLimit' : '2GB', //设置单个文件大小限制     
            'fileObjName' : 'fileData',  //<input type="file"/>的name    
            'method' : 'get', 
            'progressData' : 'all', // 'percentage''speed''all'//队列中显示文件上传进度的方式：all-上传速度+百分比，percentage-百分比，speed-上传速度
            'removeTimeout': '3',
            'successTimeout':'5000',
            'removeCompleted' : true,//上传完成后自动删除队列   
            'onUploadStart' : function(file) {
            	$("#uploadify").uploadify("settings", "formData", {'type':1,'chapterId': 1,'courseId': courseId});
            },
            'onFallback':function(){      
                alert("您未安装FLASH控件，无法完成上传！请安装FLASH控件后再试。");      
            },   
            'onUploadSuccess' : function(file, data, response){//单个文件上传成功触发  
	        	var dat=eval("("+data+")");
            	$(".font-wenzi").css('display','none');
            	$(".file").css('display','inline-block'); 
            	$(".upload").css('display','none'); 
            	$(".fileId").val(file.name);
            	$(".fileId").attr("fN",dat.id);
            	$(".fileId").append(data.name); 
            	layer.alert("上传成功！",{icon:1});
            }, 
            });
        $("#uploadify2").uploadify({
	        'debug'     : false, //开启调试  
	        'auto'           : true, //是否自动上传     
	        'swf'            : '${res }/plugin/uploadify/uploadify.swf',  //引入uploadify.swf    
	        'uploader'       : '${res }/resource/uploadRes.html;jsessionid='+sessionId,//请求路径    
	        'queueID'        : 'fileQueue2',//队列id,用来展示上传进度的    
	        'width'     : '75',  //按钮宽度    
	        'height'    : '24',  //按钮高度  
	        'queueSizeLimit' : 4,  //同时上传文件的个数    
	        'fileTypeDesc'   : '资源文件:',    //可选择文件类型说明  
	        'fileTypeExts'   : '*', //控制可上传文件的扩展名    
	        'multi'          : true,  //允许多文件上传    
	        'buttonText'     : '资源上传',//按钮上的文字    
	        'fileSizeLimit' : '2GB', //设置单个文件大小限制     
	        'fileObjName' : 'fileData',  //<input type="file"/>的name    
	        'method' : 'get',    
	        'successTimeout':'5000',
	        'removeCompleted' : true,//上传完成后自动删除队列   
	        'onUploadStart' : function(file) {
	        	$("#uploadify2").uploadify("settings", "formData", {'type':2,'chapterId': 1,'courseId': courseId});
	        },
	        'onFallback':function(){      
	            alert("您未安装FLASH控件，无法完成上传！请安装FLASH控件后再试。");      
	        },   
	        'onUploadSuccess' : function(file, data, response){//单个文件上传成功触发  
	        	
	        	var dat=eval("("+data+")");
	        	layer.alert("上传成功！",{icon:1});
	        $("#resource_list_table").append('<tr><td valign="middle" align="center">'+
	                 '<input name="fileIds" class="resourceId" value="'+dat.id+'" type="checkbox" checked="checked">'+
	                 '</td><td valign="middle" align="center">'+file.name+'</td><td valign="middle" align="center">'+
	 				'<input class="ext_btn ext_btn_error" value="删除" type="button" onclick="this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode)"></td></tr>');
		        },  
		     'onUploadComplete': function (file) {
                   
                },
	        });
    }); 
    </script>
</html>