<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>平台修改</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link href="${res}/front/css/fileUploadLogo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<%-- <script src="${res}/js/jquery-1.8.3.min.js" type="text/javascript"></script> --%>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<%-- <script src="${res}/js/jquery-validation/1.10.0/jquery.validate.min.js" type="text/javascript" ></script>
<script src="${res}/js/jquery-validation/1.10.0/messages_bs_zh.js" type="text/javascript"></script> --%>
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
			<li><a href="#">平台设置</a></li>
		</ul>
	</div>
	<div class="rightinfo">
		<div class="formbody">
			<div class="formtitle">
				<span>平台设置</span>
			</div>
			<div class="padding5">
				<form class="updateform" action="${res }/admin/school/update.html">
					<table class="form_table" cellspacing="0" cellpadding="0"
						border="0">
						<tbody>
							<tr>
							<input type="hidden" name="schoolId" value="${school.schoolId}" />
								<td class="td_right" width="150">学校名称：</td>
								<td width="630"><input type="text" name="schoolName"
									class="input-text" size="40" datatype="s6-18"  value="${school.schoolName}"
									errormsg="学校名称至少6个字符,最多18个字符！"></td>
								<td width="500"><span class="Validform_check"
									style="color: #f00;">*必填项</span></td>
							</tr>
							<tr>
								<td class="td_right" width="150">联系人：</td>
								<td width="630"><input type="text" name="contacts"
									class="input-text" size="40" datatype="*2-4"
									errormsg="联系人名称必须是2到4位字符！" value="${school.contacts}"></td>
								<td width="500"><span class="Validform_check"
									style="color: #f00;">*必填项</span></td>

							</tr>
							<tr>
								<td class="td_right" width="150">官网地址：</td>
								<td width="630"><input type="text" name="website"
									class="input-text" size="40" value="${school.website}" ignore="ignore" datatype="url"
									errormsg="平台访问地址必须是一个地址！"></td>
								<td width="500"><span class="Validform_check">*非必填项</span></td>

							</tr>

							<tr>
								<td class="td_right" width="150">联系电话：</td>
								<td width="630"><input type="text" name="tel"
									class="input-text" size="40" datatype="m"
									errormsg="手机号码必须是11位数字！" value="${school.tel}"></td>
								<td width="500"><span class="Validform_check"
									style="color: #f00;">*必填项</span></td>
							</tr>
							<tr>
								<td class="td_right" width="150">平台访问IP：</td>
								<td width="630"><input type="text" name="url"
									class="input-text" size="40" datatype="url"
									errormsg="平台访问地址必须是一个地址！" value="${school.url}" readonly="true"></td>
								<td width="500"><span class="Validform_check"
									style="color: #f00;">*必填项</span></td>
							</tr>
							<tr>
								<td class="td_right" width="150">平台LOGO：</td>
								<td width="630">
								 <div>
			                     <img id="ImgPr" src="<%=url %>/${school.logo}" onload="javascript:DrawImage(this,250,250)"/>
			                     <div>&nbsp;</div>
			                     </div>
			                     <input type="hidden"  class="updateBeforeImg" value="0">
			                     <input type="hidden" name="logo" class="hiddenlogo" value="${school.logo}" />
			                     <a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span>
			                     <input name="file" type="file" id="up" class="filePrew" onclick="updateBeforeImg();">
			                     </a>
								</td>
								<td width="500"></td>
							</tr>
							<tr>
								<td class="td_right" width="150">学校简介：</td>
								<td width="630"><textarea name="info" id="" cols="30"
										rows="10" class="textarea"
										style="width: 600px; height: 120px;">${school.info}</textarea></td>
								<td width="500"><span class="Validform_checktip">*选填项</span></td>
							</tr>
							<tr>
								<td class="td_right" width="150">&nbsp;</td>
								<td width="630"><input name="button"
									class="ext_btn ext_btn_submit" id="beforesumbit" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="button"
									class="ext_btn ext_btn_submit" id="schoolAdd" value="保存" type="hidden">
									<input name="button" class="ext_btn ext_btn_error" value="重置" onclick="document.location.href='platUpdate.html';"
									type="reset"></td>
								<td width="500"></td>
							</tr>
						</tbody>

					</table>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/js/ajaxfileupload.js"></script>
<script type="text/javascript">
     $(function(){
         //验证 
       $(".updateform").Validform({
    	   tiptype:function(msg,o,cssctl){
    		      if(!o.obj.is("form")){
    		        var objtip=o.obj.parents("td").next().find(".Validform_check");
    		        cssctl(objtip,o.type);
    		        objtip.text(msg);
    		      }

    		    },
            ajaxPost:true,
            btnSubmit:'#schoolAdd',
            callback:function(data){
            	if(1 == data.flag){
	    			layer.alert(data.msg,{icon: 1, title:'提示'},function(){
	    				window.location.href="${res}/admin/school/platUpdate.html";
	    			});
	    		}else{
	    			layer.alert(data.msg,{icon: 2, title:'提示'});
	    		}
            }
      	 });
         $("#up").uploadPreview({ img: "ImgPr",width: 120, height: 120, imgType: ["gif", "jpeg", "jpg", "bmp", "png"]});
      })
      //选择图片是设个值用于ftp图片上传判断
function updateBeforeImg(){
	$(".updateBeforeImg").val(1);
	$(".hiddenlogo").val("");
}
     $("#beforesumbit").click(function(){
   	  var imgUrl=$(".hiddenlogo").val();
   	  if($(".updateBeforeImg").val()==1&&imgUrl==""){
   		$.ajaxFileUpload({
		     type: "post",
		     url: "${res}/upload/uploadImg.html",
		     secureuri :false, 
	         fileElementId:'up',                        //文件选择框的id属性 
	         data:{type:1},
		     dataType: "json",
		     success: function(data,status){
		    	 $(".hiddenlogo").val(data.url);
   		    	 $("#schoolAdd").click();
   		     },
   			 error:function(){
   				  alert("错了");
   			  }
   		 });
   	  }else{
   		  $("#schoolAdd").click();
   	  } 
     }) 
     
     
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
