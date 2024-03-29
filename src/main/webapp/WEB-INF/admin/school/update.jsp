<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改学校</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link href="${res}/front/css/fileUploadLogo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/laydate/laydate.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/uploadPreview.js"></script><!--图片上传预览 -->
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="${res}/" target=＂_blank＂>首页</a></li>
			<li><a href="#">修改学校</a></li>
		</ul>
	</div>
	<div class="rightinfo">
		<div class="formbody">
			<div class="formtitle">
				<span>修改学校</span>
			</div>
			<div class="padding5">
				<form class="registerform" name="registerform" action="${res}/admin/school/update.html">
					<table class="form_table" cellspacing="0" cellpadding="0"
						border="0">
						
						<tbody>
							<tr>
								<input type="hidden" name="schoolId" value="${schoolPo.schoolId}">
								<input type="hidden" name="logo" value="">
								<td class="td_right" width="150">学校名称：</td>
								<td width="630"><input type="text" name="schoolName"
									class="input-text" size="40" datatype="s6-18" value="${schoolPo.schoolName}"
									errormsg="学校名称至少6个字符,最多18个字符！"></td>
								<td width="500"><span class="Validform_checktip"
									style="color: #f00;">*必填项</span></td>
							</tr>
							<tr>
								<td class="td_right" width="150">联系人：</td>
								<td width="630"><input type="text" name="contacts" value="${schoolPo.contacts}"
									class="input-text" size="40" datatype="*2-4"
									errormsg="联系人名称必须是2到4位字符！"></td>
								<td width="500"><span class="Validform_checktip"
									style="color: #f00;">*必填项</span></td>

							</tr>
							<tr>
								<td class="td_right" width="150">官网地址：</td>
								<td width="630"><input type="text" name="website" value="${schoolPo.website}"
									class="input-text" size="40" datatype="*2-20"
									errormsg="官网地址必须是一个地址！"></td>
								<td width="500"><span class="Validform_checktip"
									style="color: #f00;">*非必填项</span></td>
							</tr>

							<tr>
								<td class="td_right" width="150">联系电话：</td>
								<td width="630"><input type="text" name="tel" value="${schoolPo.tel}"
									class="input-text" size="40" datatype="m"
									errormsg="手机号码必须是11位数字！"></td>
								<td width="500"><span class="Validform_checktip"
									style="color: #f00;">*必填项</span></td>
							</tr>
							<tr>
								<td class="td_right" width="150">平台访问地址：</td>
								<td width="630"><input type="text" name="url" value="${schoolPo.url}"
									class="input-text" size="40" datatype="*2-20"
									errormsg="官网地址必须是一个地址！"></td>
								<td width="500"><span class="Validform_checktip"
									style="color: #f00;">*必填项</span></td>

							</tr>
							<tr>
								<td class="td_right" width="150">平台LOGO：</td>
								<td width="630">
								 <div>
			                     <img id="ImgPr" src="${schoolPo.logo}" onload="javascript:DrawImage(this,250,250)"/>
			                     <div>&nbsp;</div>
			                     </div>
			                     <a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span>
			                     <input name="file" type="file" id="up" class="filePrew" onchange="javascript:updateImg();" >
			                     </a>
								</td>
								<td width="500"></td>
							</tr>
							<tr>
								<td class="td_right">使用时间：</td>
								<td><input name="startDateForm" class="input-text laydate-icon" 
									value="<fmt:formatDate value="${schoolPo.startDate}" pattern="yyyy/MM/dd HH:mm:ss"/>"
									size="20" datatype="*" id="startDate" type="text">--<input
									name="finishDateForm" class="input-text laydate-icon" size="20" 
									value="<fmt:formatDate value="${schoolPo.finishDate}" pattern="yyyy/MM/dd HH:mm:ss"/>"
									datatype="*" id="finishDate" type="text"><span
									class="pl15 f00">*</span></td>
								<td width="500"><span class="Validform_checktip"
									style="color: #f00;"></span></td>
							</tr> 
							<tr>
								<td class="td_right" width="150">学校简介：</td>
								<td width="630"><textarea name="info" id="tinfo" cols="30" value="${schoolPo.info}"
										rows="10" class="textarea" 
										style="width: 600px; height: 120px;">${schoolPo.info}</textarea></td>
								<td width="500"><span class="Validform_checktip">*选填项</span></td>
							</tr>
							<tr>
								<td class="td_right" width="150">&nbsp;</td>
								<td width="630"><input name="button"
									class="ext_btn ext_btn_submit" id="schoolAdd" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="button" class="ext_btn ext_btn_error" value="重置"
									type="button"></td>
								<td width="500"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/js/ajaxfileupload.js"></script>
<script type="text/javascript">
      $(function(){
    	  //alert("aldfjasldjfalsjdflasjldfijasl");
    	  $(".registerform").Validform({
  			tiptype : 4,
  			ajaxPost:true,
  			btnSubmit:"#schoolAdd",
  			callback:function(data){
  				if (1 == data.flag) {
					layer.alert(data.msg,{icon: 1, title:'提示'},function(){
	    				window.location.href="${res}/admin/school/list.html";
	    			});
				} else {
					layer.alert(data.msg,{icon: 2, title:'提示'});
				}
  			}
      });
	//layer日历插件
		laydate.skin('molv');
		laydate({
			elem : '#startDate',
			format : 'YYYY/MM/DD hh:mm:ss'
		});
		laydate({
			elem : '#finishDate',
			format : 'YYYY/MM/DD hh:mm:ss'
		});
		//验证 
		$("#up").uploadPreview({ img: "ImgPr",width: 120, height: 120, imgType: ["gif", "jpeg", "jpg", "bmp", "png"]});
	})
    function updateImg(){
    	// 图片地址
    	  var img_url = $("#up").val();
    	    
    	  // 创建对象
    	  var img = new Image();
    	    
    	  // 改变图片的src
    	  img.src = img_url;
    	    
    	  // 定时执行获取宽高
    	  var check = function(){
    	   document.body.innerHTML += 'from:check : width:'+img.width+',height:'+img.height+'' ;
    	  };
    	    
    	  var set = setInterval(check,40);
    	    
    	  // 加载完成获取宽高
    	  img.onload = function(){
    	   document.body.innerHTML += 'from:onload : width:'+img.width+',height:'+img.height+'';
    	    
    	   // 取消定时获取宽高
    	   clearInterval(set);
    	  };   	  
     	 $.ajaxFileUpload({
 		     type: "post",
 		     url: "${res}/upload/uploadImg.html",
 		     secureuri :false, 
 	         fileElementId:'up',                        //文件选择框的id属性 
 	         data:{type:1},
 		     dataType: "json",
 		     success: function(data,status){
 		    	 $(".hiddenlogo").val(data.url);
 		     },
 			 error:function(){
 				  alert("错了");
 			  }
 		 });
      }
	function updateSchool() {
		var formData = $(".registerform").serialize();
		//alert(formData);
		//formData = decodeURIComponent(formData, true);
		//alert(formData);
		$(".registerform").ajaxSubmit({
			type : "POST",
			url : "${res}/admin/school/update.html",
			//processData : true,
			data : formData,
			dataType : "json",
			success : function(data) {
				if (1 == data.flag) {
					layer.alert(data.msg,{icon: 1, title:'提示'},function(){
	    				window.location.href="${res}/admin/school/list.html";
	    			});
				} else {
					layer.alert(data.msg,{icon: 2, title:'提示'});
				}
			},
			error : function() {
				layer.alert("请求异常",{icon: 2, title:'提示'});
			}
		});
	}
	function DrawImage(ImgD,iwidth,iheight){      
	    //参数(图片,允许的宽度,允许的高度)      
	    var image=new Image();      
	    image.src=ImgD.src;      
	    if(image.width>0 && image.height>0){      
	      if(image.width/image.height>= iwidth/iheight){      
	          if(image.width>iwidth){        
	              ImgD.width=iwidth;      
	              ImgD.height=(image.height*iwidth)/image.width;      
	          }else{      
	              ImgD.width=image.width;  
	              ImgD.height=image.height; 
	          }      
	      }else{      
	          if(image.height>iheight){        
	              ImgD.height=iheight;      
	              ImgD.width=(image.width*iheight)/image.height;              
	          }else{      
	              ImgD.width=image.width;        
	              ImgD.height=image.height;      
	          }      
	      }      
	    }      
	} 
</script>
</body>
</html>
