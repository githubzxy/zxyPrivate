<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/admin/layouts/comm.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改课程</title>
<link href="${res }/plugin/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/jstree/default/style.min.css" type="text/css"
	rel="stylesheet" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet"
	type="text/css" />
	<link href="${res}/front/css/fileUploadLogo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/js/jquery.tablescroll.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script>
<!--弹窗-->
<script type="text/javascript"
	src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript"
	src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res }/plugin/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript"
	src="${res}/plugin/layer/laydate/laydate.js"></script>
<script type="text/javascript" src="${res}/plugin/jstree/jstree.min.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/addCourse.js"></script>
<script type="text/javascript" src="${res}/js/uploadPreview.js"></script><!--图片上传预览 -->
<script type="text/javascript" src="${res}/js/ajaxfileupload.js"></script>
<style type="text/css">
.uploadify-button {text-align:center;}
.uploadify-button .uploadify-button-text{display:block;width:100%;text-align:center;}
</style>
</head>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="${res}/" target=＂_blank＂>首页</a></li>
			<li><a href="#">修改课程</a></li>
		</ul>
	</div>
	<div class="rightinfo">
		<div class="formbody">
			<div class="formtitle">
				<span>修改课程</span>
			</div>
			<div class="padding5">
				<div class="topbar">
					<ul class="box-step">
						<li class="cur"><a href="javascript:void(0);">编辑课程基本信息</a></li>
						<li><a href="javascript:void(0);">编辑课程目录信息</a></li>
						<li><a href="javascript:void(0);">选择课程类别信息</a></li>
					</ul>
				</div>
				<div class="jian-notice">
					<h2>温馨提示：</h2>
					<p style="text-indent: 35px;">亲爱的老师，您好！首先非常感谢您使用亚卓教育研发的课程建设系统，课程建设采用三步完成，第一步编辑课程的基本信息，第二步编辑课程的目录信息，鼠标右键选择章节可以添加目录，第三步选择课程的类别，每一步完成编辑后，请点击上面按钮进入下一步。以上三步完成后，即可完成建课。谢谢，祝您使用愉快！</p>
				</div>
				<div class="box-course">
					<form id="form" enctype="multipart/form-data">
						<input type="hidden" id="courseId" value="${course.courseId }" />
						<input type="hidden" id="coverId" name="coverId" value="${course.coverId}" />
						<input type="hidden" id="coverIdTmp" name="coverIdTmp" value="" />
						
						<table class="form_table" width="100%" cellspacing="0"
							cellpadding="0" border="0">
							<tbody>
								<tr>
									<td class="td_right">课程名称：</td>
									<td><input type="text" name="courseName"
										value="${course.courseName }" class="input-text" size="40"></td>
									<td><input type="hidden" name="courseId" class="courseId"
										value="${course.courseId }"></td>
									<td class="td_right"></td>
								</tr>
								<tr>
									<td class="td_right">课程简介：</td>
									<td><textarea name="courseInfo" id="" cols="30" rows="10"
											class="textarea" style="width: 600px; height: 120px;">${course.courseInfo }</textarea></td>
								</tr>
								<tr>
									<td class="td_right">课程封面：</td>
									<%-- <td class="fl" style="display: none"><input type="text" name="coverName" fN="${course.cover.coverId}" value="${course.cover.name}" class="coverName"><a href="" class="delCover">删除</a></td> --%>
									<td class="f1" style="display:none"><input type="file" name="coverFile" id="upload_org_code"/></td>
									<td class="f2" style="display:none"><img id="upload_org_code_img" fN="${course.cover.coverId}" src="${course.cover.maxUrl}" width="150" height="150">
									<a href="#" class="delCover ext_btn ext_btn_error">删除</a></td>
								<tr>
									<td class="td_right">课程学时：</td>
									<td><input type="text" name="classhour"
										value="${course.classhour }" class="input-text" size="6">&nbsp;&nbsp;学时</td>
									<td class="td_right"></td>
								</tr>
								<tr>
									<td class="td_right" valign="top" align="center" height="119"><p>&nbsp;</p>
										<p>研发团队：</p></td>
									<td valign="middle" align="left">
										<div class="kcxx">
											<table width="100%" cellspacing="0" cellpadding="0"
												border="0">
												<thead>
													<tr>
														<td width="20%" valign="middle" align="center">序号</td>
														<td width="30%" valign="middle" align="center">教师姓名</td>
														<td width="30%" valign="middle" align="center">职称</td>
														<td width="20%" valign="middle" align="center">操作</td>
													</tr>
												</thead>
												<tbody id="lecturer_list_table">
													<c:forEach items="${course.lecturerPo}" var="lecture">
														<tr>
															<td valign="middle" align="center"><input
																name="lectureIds" value="${lecture.lecturerId }"
																type="checkbox" checked="checked"></td>
															<td valign="middle" align="center">${lecture.name }</td>
															<td valign="middle" align="center">${lecture.position }</td>
															<td valign="middle" align="center"><input
																class="ext_btn ext_btn_error" value="移除" type="button"
																onclick="remove_lecturer(this, ${lecture.lecturerId });" />
															</td>
														</tr>
													</c:forEach>
												</tbody>
												<tfooter>
												<tr>
													<td colspan="4" valign="middle" align="center">
													<!-- <input
														class="ext_btn ext_btn_submit" value="添加新讲师" type="button"
														id="addTeacher_list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
													<%-- 	<a href="${res}/admin/lecturer/add.html"><span><img src="${res}/images/t01.png"></span>新增讲师</a> --%>
														<input class="ext_btn ext_btn_success" value="在系统中选择"
														type="button" id="sysTeacher"></td>
												</tr>
												</tfooter>

											</table>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<input class="nexnt editStepOne" value="下一步" name="stop" type="button" />
					<input class="nexnt editsaveStepOne" name="stop" type="button" value="保存">
					<!--  <input type="button" class="nexnt" onclick="addStepOne()" value="下一步"> -->
				</div>
				<!--第一步-->

				<div class="box-course edit-mulu hidden" >
					<div class="content_wrapl" style="margin-bottom:30px;">
						<div class="title1" style="">
							章节目录 <span></span>
						</div>
						<div class="chapter_tree" id="ChapterTree"></div>
					</div>
					<!--left-->
					<div class="content_wrapr" style="margin-bottom:30px;">
						<div class="title1">
							目录名称：<input type="text" class="input-text chapterName"
								id="chapterName" value="班主任每周一课"> <input
								class="newChapter" type="button" value="添加新章节" />
						</div>
						<iframe id="iframe" scrolling="auto" frameborder="0"
							src="${res }/admin/course/chapter/chapterInfo.html?chapter_id=0"
							style="width: 100%; height: 440px;">
						</iframe>
					</div>
					<!--right-->
					<div style="clear:both;">
						<input  class="nexnt stepnext2" id="submit" name="stop" type="button" value="下一步">
						<input class="nexnt updateChapter" name="stop" type="button" value="保存">
					</div>
				</div>
				<!--第三 步-->
				<div class="box-course hidden">
					<table class="form_table" width="100%" cellspacing="0"
						cellpadding="0" border="0">
						<tbody>
							<tr>
								<td class="td_right">课程分类：</td>
								<td><select name="" class="select courseType"
									style="width: 120px;">
									<option selected="selected" value="">请选择</option>
										<c:forEach items="${courseTypes}" var="courseType">
											<c:choose>
												<c:when
													test="${course.courseTypeId eq courseType.courseTypeId}">
													<option value="${courseType.courseTypeId }"
														selected="selected">${courseType.typeName }</option>
												</c:when>
												<c:otherwise>
													<option value="${courseType.courseTypeId }">${courseType.typeName }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
								</select></td>
								<td class="td_right"></td>
							</tr>
							<tr>
								<td class="td_right" width="150">&nbsp;</td>
								<td><input name="button"
									class="ext_btn ext_btn_submit addCourseType" value="保存"
									type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									name="button" class="ext_btn ext_btn_error" value="重置"
									type="button" onclick="$('select').val('')"></td>

							</tr>
						</tbody>
					</table>
				</div>
				<!--第三步-->

			</div>
		</div>
	</div>
	<!--系统教师选择-->
	<div class="chooseteacher" id="teacherList"
		style="overflow: scroll; overflow-x: hidden;">
		<div class="chooseteachertop">
			<span>选择研发团队</span><a></a>
		</div>
		<div class="chooseteacherinfo">
			<ul class="prosearch">
				<li><a style="padding-left: 10px;"><input name=""
						class="input-text teacherName" placeholder="教师姓名" type="text"></a>
					<a><input name="" class="search" value="搜索" type="button"></a>
				</li>
			</ul>
			<table class="tablelist lecturerTable"
				style="border-left: none; border-right: none;">
				<thead>
					<tr>
						<th width="65"><input name="ur_allSelect" value=""
							type="checkbox" id="allSelect"></th>
						<th>教师姓名</th>
						<th>性别</th>
						<th>职称</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
		<div class="chooseteachertopbtn">
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input
				name="" type="button" class="sure" value="确定" id="ur_sure" />
		</div>
	</div>
	<!--系统教师选择 end-->
	
	<!--系统资源选择-->
	<div class="chooseResource" id="ResourceList" style="overflow: scroll;display:none; overflow-x: hidden;">
		<div class="chooseResourcetop">
			<span>选择系统资源</span><a></a>
		</div>
		<div class="chooseResourceinfo">
			<table class="tablelist resourceTable" style="border-left: none; border-right: none;">
				<thead>
					<tr>
						<th width="65"><input name="ur_allSelect" value=""
							type="checkbox" id="allSelect1"></th>
						<th>资源名称</th>
						<th>资源类型</th>
						<th>创建/修改时间</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
		<div class="chooseResourcetopbtn">
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input
				name="" type="button" class="sure" value="确定" id="ur_sure1" />
		</div>
	</div>
	<!--系统资源选择 end-->
	<!--遮罩层-->
	<div class="mask"></div>
	<!--遮罩层 end-->

	<script type="text/javascript">
  $(function(){
	  $("#up").uploadPreview({ img: "ImgPr",width: 120, height: 120, imgType: ["gif", "jpeg", "jpg", "bmp", "png"]});
	  var coverId = '${course.cover.coverId}';
	  if(coverId != null && coverId != ""){
		  $(".f1").css('display','none');
		  $(".f2").css('display','block');
	  }else{
		  $(".f1").css('display','block');
		  $(".f2").css('display','none');
	  }
	  
		/* //上传封面
		 $("#upload_org_code").uploadify({
				 'formData'      : {'someKey' : 'someValue', 'someOtherKey' : 1},
                 'height'        : 27,
                 'width'         : 80, 
                 'buttonText'    : '选择图片',
                 'swf'           : '${res }/plugin/uploadify/uploadify.swf',
                 'uploader'      : '${res }/admin/course/uploadCover.html',
                 'auto'          : true,
                 'multi'         : true,
                 'removeCompleted':false,
                 'queueSizeLimit' : 1,  //同时上传文件的个数  
                 'cancelImg'     : '${res }/plugin/uploadify/uploadify-cancel.png',
                 'fileTypeExts'  : '*.jpg;*.jpge;*.gif;*.png',
                 'fileSizeLimit' : '2MB',
                 'fileObjName' : 'fileData',
                 'removeCompleted' : true,//上传完成后自动删除队列 
                 'onUploadStart' : function(file) {
                 	$("#uploadify").uploadify("settings", "formData", {'courseId': 1});
                 },
                 'onUploadSuccess':function(file,data,response){
                	 var file=eval("("+data+")");
                     $('#' + file.id).find('.data').html('');
                     $("#upload_org_code_name").val(data);
                     $("#upload_org_code_img").attr("src","${res }/"+file.url);  
                     $(".f1").css("display","none");
                     $(".f2").show();
                 },
                 //加上此句会重写onSelectError方法【需要重写的事件】
                 'overrideEvents': ['onSelectError', 'onDialogClose'],
                 //返回一个错误，选择文件的时候触发
                 'onSelectError':function(file, errorCode, errorMsg){
                     switch(errorCode) {
                         case -110:
                             alert("文件 ["+file.name+"] 大小超出系统限制的" + jQuery('#upload_org_code').uploadify('settings', 'fileSizeLimit') + "大小！");
                             break;
                         case -120:
                             alert("文件 ["+file.name+"] 大小异常！");
                             break;
                         case -130:
                             alert("文件 ["+file.name+"] 类型不正确！");
                             break;
                     }
                 },
		 }); */
	
		//上传封面
		 $("#upload_org_code").uploadify({
				 'formData'      : {'someKey' : 'someValue', 'someOtherKey' : 1},
                 'height'        : 27,
                 'width'         : 80, 
                 'buttonText'    : '选择图片',
                 'swf'           : '${res }/plugin/uploadify/uploadify.swf',
                 'uploader'      : '${res }/admin/course/uploadCover.html',
                 'auto'          : true,
                 'multi'         : true,
                 'removeCompleted':false,
                 'queueSizeLimit' : 1,  //同时上传文件的个数  
                 'cancelImg'     : '${res }/plugin/uploadify/uploadify-cancel.png',
                 'fileTypeExts'  : '*.jpg;*.jpge;*.gif;*.png',
                 'fileSizeLimit' : '2MB',
                 'fileObjName' : 'fileData',
                 'removeCompleted' : true,//上传完成后自动删除队列 
                 'onUploadStart' : function(file) {
                 	$("#uploadify").uploadify("settings", "formData", {'courseId': 1});
                 },
                 'onUploadSuccess':function(file,data,response){
                	 var file=eval("("+data+")");
                	 $("#coverIdTmp").val(file.id);
                     $('#' + file.id).find('.data').html('');
                     $("#upload_org_code_name").val(data);
                     $("#upload_org_code_img").attr("fN",file.id);  
                     $("#upload_org_code_img").attr("src",file.url);  
                     $(".f1").css("display","none");
                     $(".f2").show();
                 },
                 //加上此句会重写onSelectError方法【需要重写的事件】
                 'overrideEvents': ['onSelectError', 'onDialogClose'],
                 //返回一个错误，选择文件的时候触发
                 'onSelectError':function(file, errorCode, errorMsg){
                     switch(errorCode) {
                         case -110:
                             alert("文件 ["+file.name+"] 大小超出系统限制的" + jQuery('#upload_org_code').uploadify('settings', 'fileSizeLimit') + "大小！");
                             break;
                         case -120:
                             alert("文件 ["+file.name+"] 大小异常！");
                             break;
                         case -130:
                             alert("文件 ["+file.name+"] 类型不正确！");
                             break;
                     }
                 },
		 });
		
    //选择系统教师
    $("#sysTeacher").click(function(){
    	getLecture();
      $("#teacherList").show();
      $(".mask").show();
    });
      
      $(".chooseteachertop a").click(function(){
          $(".mask").hide();
      $("#teacherList").fadeOut(200);
    });
      $(".search").click(function(){
    	  getLecture();
    	})
    	//选择系统资源
		  
		  $(".chooseResourcetop a").click(function(){
	      	$(".mask").hide();
	      $("#ResourceList").fadeOut(200);
	  });
    //上传按钮的显示
/*    	var coverName = $(".coverName").val();
  	if(coverName =="" || coverName == null){
  		$(".coverName").parent().next().css('display','block');
  	}else{
  		$(".coverName").parent().css('display','block');
  	} */
    	function getLecture(){
    	  var lecturerName = $(".teacherName").val();
	  		$.ajax({
	  			type: "POST",
	  			  url: "${res}/admin/lecturer/lecturerList.html",
	  			  data:{"lecturerName":lecturerName},
	  			  success: function(dat){
	  				  var data = eval("(" + dat + ")");
	  				  $(".lecturerTable tbody").empty();
	  				  for(var i = 0;i<data.length;i++){
	  					  html='<tr><td><input name="ur_checkbox" class="test" value="'+data[i].lecturerId+'" type="checkbox"></td><td class="ur_tdValue">'+data[i].name+'</td>';
	  					  if(data[i].gender == 1){
	  					  	html+='<td>男</td>';
	  					  }else{
	  						html+='<td>女</td>';
	  					  }
	  	                   html+='<input  class="ur_tdlecturerId" value="'+data[i].lecturerId+'" type="hidden" /></td><td class="ur_tdposition">'+data[i].position+'</td></tr>';
	  	                   $(".lecturerTable tbody").append(html);
	  				  }
	  			  }
	  		})
      }
  	
    /**教师实现确定按钮**/
    $("#ur_sure").click(function(){
       $("#teacherList").hide();
       $(".mask").hide();
       var html="";
       var lectureIds=$("input[name='lectureIds']");
       var flag=0;
      //取得checkbox的集合
      var selectBoxNum = $("[name='ur_checkbox']");
      if(lectureIds.length>0){
    	
      for (var i = 0; i < selectBoxNum.length; i++) {
        if (selectBoxNum[i].checked == true) {
        	lectureIds=$("input[name='lectureIds']");
        	  lectureIds.each(function(index){
        		if($(this).val()!=selectBoxNum[i].value){
        			 flag=1;
                     
        		}else{
        		flag=0;
        		return false;
        		}
        	})
        	if(flag==1){
        		  html='<tr>'+
                  '<td valign="middle" align="center">'+
                  '<input name="lectureIds" value="'+selectBoxNum[i].value+'" type="checkbox" checked="checked">'+
                  '</td><td valign="middle" align="center">'+$(".ur_tdValue").eq(i).html()+'</td>'+
                  '<td valign="middle" align="center">'+$(".ur_tdposition").eq(i).html()+'</td>'+
                  '<td valign="middle" align="center">'+
                      '<input class="ext_btn ext_btn_error" value="移除" type="button" onclick="remove_lecturer(this, '+$(".ur_tdlecturerId").eq(i).val()+');">'+
                   '</td>'+
                 '</tr>'
             $("#lecturer_list_table").append(html);
        	}
        	
        	
        
        };
    	  }
      }else{
    	  for (var i = 0; i < selectBoxNum.length; i++) {
    	        if (selectBoxNum[i].checked == true) {
    	        	 lectureIds=$("input[name='lectureIds']");
    	        			  html='<tr>'+
    	                      '<td valign="middle" align="center">'+
    	                      '<input name="lectureIds" value="'+selectBoxNum[i].value+'" type="checkbox" checked="checked">'+
    	                      '</td><td valign="middle" align="center">'+$(".ur_tdValue").eq(i).html()+'</td>'+
    	                      '<td valign="middle" align="center">'+$(".ur_tdposition").eq(i).html()+'</td>'+
    	                      '<td valign="middle" align="center">'+
    	                          '<input class="ext_btn ext_btn_error" value="移除" type="button" onclick="remove_lecturer(this, '+$(".ur_tdlecturerId").eq(i).val()+');">'+
    	                       '</td>'+
    	                     '</tr>'
    	                 $("#lecturer_list_table").append(html);
    	        		}
    	        	
    	    	  }
      }
    });
    
    /**资源实现确定按钮**/
    $("#ur_sure1").click(function(){
       $("#ResourceList").hide();
       $(".mask").hide();
       var html="";
       //取得checkbox的集合
       var selectBoxNum = $("[name='ur_checkbox1']");
       for (var i = 0; i < selectBoxNum.length; i++) {
         if (selectBoxNum[i].checked == true) {
                 html+='<tr><td valign="middle" align="center">'+
                 '<input name="fileIds2" class="resourceId" value="'+selectBoxNum[i].value+'" type="checkbox" checked="checked">'+
                 '</td><td valign="middle" align="center">'+$(".ur_tdValue1").eq(i).html()+'</td><td valign="middle" align="center">'+
 				'<input class="ext_btn ext_btn_error" value="移除" type="button" onclick="this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode)"></td></tr>';
         };
       };
       $("#iframe").contents().find("#resource_list_table").append(html);
     });
  
  //layer日历插件
  laydate.skin('molv');
  laydate({
  elem: '#birthday', 
  event: 'focus' 
  });


});
//删除封面
$(".delCover").click(function(){
 	var coverId = $("#upload_org_code_img").attr("fN");
 	var courseId = '${course.courseId }';
	$("#upload_org_code_img").attr("fN","");
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/course/delCover.html",
		  processData:true,
		  data:{"coverId":coverId,"courseId":courseId},
		  dataType: "json",
		  success: function(data){	
			  $(".f1").css('display','block');
			  $(".f2").css('display','none');
			  $("#upload_org_code_img").attr("fN","");
			  $("#fileQueue").empty();
		  }
	});
});
//删除讲师
function remove_lecturer(obj,lecturerId){
	    			$(obj).parent("td").parent("tr").remove();
}
function updateImg(type){
	 $.ajaxFileUpload({
	     type: "post",
	     url: "${res}/upload/uploadImg.html",
	     secureuri :false, 
       fileElementId:'up',                        //文件选择框的id属性 
       data:{type:type},
	     dataType: "json",
	     success: function(data,status){
	    	 $(".hiddenAvatar").val(data.url);
	     },
		 error:function(){
			  layer.alert("上传头像失败",{icon: 2, title:'提示'});
		  }
	 });
}
</script>
</body>
</html>
