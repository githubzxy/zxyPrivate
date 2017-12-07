<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/admin/layouts/comm.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改教师信息</title>

<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link href="${res}/front/css/fileUploadLogo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/uploadify/jquery.uploadify.min.js"></script>
<script src="${res}/plugin/layer/laydate/laydate.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/uploadPreview.js"></script><!--图片上传预览 -->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">修改教师信息</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>修改教师信息</span></div>
     <div class="padding5">
      <form class="jqtransform" action="${res}/admin/teacher/update.html">
         <table class="form_table"  cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
              <input type="hidden" name="userId" value="${users.userId}">
              <input type="hidden" name="loginId" value="${users.loginId}">
              <input type="hidden" name="teacherId" value="${users.teacherPo.teacherId}">
                <td class="td_right">姓名：</td>
                <td><input type="text" name="name" class="input-text" size="30" datatype="*2-4" errormsg="姓名名称必须是2到4位字符！" nullmsg="请输入姓名！" value="${users.name}" ></td>
                <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
                 <td class="td_right">出生日期：</td>
                <td><input type="text" value="<fmt:formatDate value="${users.birthday2}" type="time"  pattern="yyyy-MM-dd"/>"  name="birthday"  class="input-text laydate-icon" id="birthday" size="25"></td>
                 <td width="400"><span class="Validform_checktip">*选填项</span></td>
              </tr>
             <tr>
              <td class="td_right">性别：</td>
               <td><input type="radio" value="1" name="gender" id="male"  datatype="*" errormsg="请选择性别！"  checked="<c:if test='${users.gender==1}'>checked</c:if>"/><label>男</label> 
               <input type="radio" value="2" name="gender" id="female" checked="<c:if test='${users.gender==2}'>checked</c:if>" /><label>女</label></td>
               <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
               <td class="td_right" >个人邮箱：</td>
               <td><input type="text" name="email" class="input-text" size="25" datatype="e" errormsg="邮箱地址格式不对！" ignore="ignore" value="${users.email}"></td>
                <td width="400"><span class="Validform_check">*选填项</span></td>
             </tr>
              <tr>
                <td class="td_right">登录密码：</td>
                <td><input  type="text" value="${users.loginPo.loginPwd}" name="loginPwd" datatype="*6-15" errormsg="密码范围在6~15位之间！" class="input-text" size="30" nullmsg="请输入密码！"></td>
                 <td width="400"><span class="Validform_check"  style="color:#f00;">*必填项</span></td>
                 <td class="td_right">确认密码：</td>
                <td><input type="text"  value="${users.loginPo.loginPwd}" datatype="*" recheck="loginPwd" errormsg="您两次输入的账号密码不一致！"  class="input-text" size="25" nullmsg="请确认密码！"></td>
                 <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
              </tr>
               <tr>
                <td class="td_right">手机号码：</td>
                <td colsp><input type="text" name="mobile" class="input-text" size="30" datatype="m" errormsg="请正确输入11位手机号码！" ignore="ignore" value="${users.mobile}"></td>
                <td width="400"><span class="Validform_check" >*选填项</span></td>
                <td class="td_right" >职称：</td>
                <td><input type="text" name="position" class="input-text" size="25" ignore="ignore" value="${users.teacherPo.position}"  size="25" datatype="s2-8" errormsg="职称为2-8为位中文字符！" ></td>
                <td width="400"><span class="Validform_check">*选填项</span></td>
              </tr>

              <tr>
                 <td class="td_right">工&nbsp;号：</td>
                 <input type="hidden" id="beforeNumber" name="beforeNumber" value="${users.number}">
                <td><input type="text" id="tnumber" name="number" class="input-text" size="30" datatype="s4-11" sucmsg="工号验证通过！"  nullmsg="请输入工号！" errormsg="工号范围在4~12位之间"   value="${users.number}" ajaxurl=""></td>
                 <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
                 <td class="td_right" width="150">部&nbsp;门：</td>
                <td><input type="text" name="department" class="input-text" size="25"  ignore="ignore" value="${users.teacherPo.department}"></td>
                 <td width="400"><span class="Validform_checktip" >*选填项</span></td>
              </tr>
             <tr>
                <td class="td_right">身份证号码：</td>
                <td><input type="text" name="idCard" class="input-text"  datatype="idCard" size="30" ignore="ignore" errormsg="身份证号码必须是15/18位！" sucmsg="身份验证通过！" value="${users.idCard}"></td>
                 <td width="400"><span class="Validform_check" >*选填项</span></td>

               <td class="td_right" >个人头像：</td>
             
                  <td width="630">
	              	<input type="hidden" name="avatar" class="hiddenAvatar" value="${users.avatar}">
	              	<input type="hidden"  class="updateBeforeImg" value="">
				    <a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span>
				    <input name="file" type="file" id="up" class="filePrew" onclick="updateBeforeImg();"  >
				    </a>
	              	<img id="ImgPr" src="<c:if test="${users.avatar!=''}"><%=url %>/${users.avatar}</c:if>" onload="javascript:DrawImage(this,150,150)" />
					</td>
					<td width="500">
					</td>

              </tr>
              
              <tr>
                <td class="td_right">个人简介：</td>
                <td colspan="1"><textarea name="info" id="tinfo" cols="30" rows="10" class="textarea" style="width:245px;height:120px;">${users.info}</textarea></td>
                 <td width="400"><span class="Validform_checktip">*选填项</span></td>
                 <td class="td_right" id="showtext"></td>
                 
              </tr>
         
              <tr>
              <td class="td_right">&nbsp;</td>
               <td>
                 <input name="button" class="ext_btn ext_btn_submit" value="保存" id="beforesumbit" type=button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <input name="button" class="ext_btn ext_btn_submit" value="保存" id="teacher_sumbit" type="hidden" > 
                <input name="button" class="ext_btn ext_btn_error" value="重置" type="reset" onclick="restForm()"> 
                </td>
                <td width="400"></td>        
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
	$.extend($.Datatype,{//身份证严格验证正则表达式
		"idCard" : /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/
	});
  $(".jqtransform").Validform({
    tiptype:function(msg,o,cssctl){
      if(!o.obj.is("form")){
        var objtip=o.obj.parents("td").next().find(".Validform_check");
        cssctl(objtip,o.type);
        objtip.text(msg);
      }

    },
    showAllError:true,
    ajaxPost:true,
	btnSubmit:"#teacher_sumbit",
    callback:function(data){
    	if (1 == data.flag) {
			layer.alert(data.msg,{icon:1},function(){
				window.location.href="${res}/admin/teacher/list.html";
			});
		}else if(2== data.flag){
			layer.alert(data.msg,{icon:5});
		} 
    	else{
			layer.alert(data.msg,{icon:2});
		}
    }
  });
  //layer日历插件
  laydate.skin('molv');
  laydate({
  elem: '#birthday', 
  event: 'focus' 
  });
  $("#up").uploadPreview({ img: "ImgPr",width: 120, height: 120, imgType: ["gif", "jpeg", "jpg", "bmp", "png"]});
})
//选择图片是设个值用于ftp图片上传判断
function updateBeforeImg(){
	$(".updateBeforeImg").val(1);
	$(".hiddenAvatar").val("");
}
$("#beforesumbit").click(function(){
	var beforeImg=$(".updateBeforeImg").val();
	var imgUrl=$(".hiddenAvatar").val();
	if(imgUrl==""&&beforeImg==1){
		$.ajaxFileUpload({
		     type: "post",
		     url: "${res}/upload/uploadImg.html",
		     secureuri :false, 
	         fileElementId:'up',                        //文件选择框的id属性 
	         data:{type:2},
		     dataType: "json",
		     success: function(data,status){
		    	 $(".hiddenAvatar").val(data.url);
		    	 $("#teacher_sumbit").click();
		    	 
		     },
			 error:function(){
				  alert("错了");
			  }
		 });
	}else{
		 $("#teacher_sumbit").click();
	}
   	 
})
//重置表单
function restForm(){
	window.reload();
}

/* //提交表单
$("#teacher_sumbit").click(function(){
	var flag=false;
	 $(".Validform_check").each(function() { 
		 flag = false;
			if($(this).html()=="通过信息验证！"){
				flag = true;
			}
		});
	 if(flag){
		 var formData=$(".jqtransform").serialize();
			//formData = decodeURIComponent(formData,true);
			jQuery(".jqtransform").ajaxSubmit({
				  type: "POST",
				  url: "${res}/admin/teacher/update.html",
				  processData:true,
				  data:formData,
				  dataType: "json",
				  success: function(data){
			    		if(1 == data.flag){
			    			 layer.alert(data.msg,function(){
				    			window.location.href="${res}/admin/teacher/list.html"; 
			    			  });
			    			
			    		}else{
			    			layer.alert(data.msg);
			    		}
				  }
				  ,error:function(httpstate)
				  {alert("请求异常");}
				 });
	 }else{
		 layer.open({
		      time: 2000, //2s后自动关闭
		      title: '提示' , 
		      icon:2,  
		      content:'请填好所有信息通过后再提交！' 
		    });
	 }
}) */

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

//ajax实时验证绑定参数
$("#tnumber").change(function(){
	var url = $(this).attr("ajaxurl");
	var number=$("#tnumber").val();
	var beforeNumber=$("#beforeNumber").val();
	var ajaxurl="${res}/admin/teacher/validate.html?number="+number+"&beforeNumber="+beforeNumber;
	$(this).attr("ajaxurl",ajaxurl);
	
})
</script>

</body>
</html>
