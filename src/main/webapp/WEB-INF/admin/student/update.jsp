<%@page import="com.yz.center.util.BaseUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/fileUploadLogo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script src="${res}/plugin/layer/laydate/laydate.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/uploadPreview.js"></script><!--图片上传预览 -->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${res}/" target=＂_blank＂>首页</a></li>
      <li><a href="#">学生信息列表</a></li>
       <li><a href="#">修改学生</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>修改学生</span></div>
     <div class="padding5">
      <form class="jqtransform" action="${res}/admin/student/update.html">
      <input type="hidden" name="loginId" value="${studentInfo.studentForm.loginId}">
      <input type="hidden" name="userId" value="${studentInfo.studentForm.userId}">
      <input type="hidden" name="studentId" value="${studentInfo.studentForm.studentId}">
         <table class="form_table"  cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">姓名：</td>
                <td><input type="text"  name="name" class="input-text" size="30" datatype="*2-4" errormsg="姓名名称必须是2到4位字符！" value="${studentInfo.studentForm.name}"></td>
                <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
                 <td class="td_right">出生日期：</td>
                <td><input type="text" name="birthday"  class="input-text laydate-icon" ignore="ignore" id="birthday" size="25" value="<fmt:formatDate value="${studentInfo.studentForm.birthday2}" type="time"  pattern="yyyy-MM-dd"/>"></td>
                 <td width="400"><span class="Validform_check">*选填项</span></td>
              </tr>
             <tr>
              <td class="td_right">性别：</td>
              
               <td><input type="radio" value="1" name="gender" id="male"  datatype="*" errormsg="请选择性别！" <c:if test="${studentInfo.studentForm.gender==1}">checked</c:if> /><label>男</label> <input type="radio" value="2" name="gender" id="female" <c:if test="${studentInfo.studentForm.gender==2}">checked</c:if>/><label>女</label></td>
               <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
               <td class="td_right" >个人邮箱：</td>
               <td><input type="text" name="email" class="input-text" size="25" datatype="e" ignore="ignore" errormsg="邮箱地址格式不对！" value="${studentInfo.studentForm.email}"></td>
                <td width="400"><span class="Validform_check">*选填项</span></td>
             </tr>
              <tr>
            <td class="td_right">年级：</td>
                 <td> 
                     <select  name="gradeId" id="selectGrade"  class="select" style="width:250px;" datatype="*" onchange="getCla()"> 
                        <option selected value="">请选择年级</option> 
                       <c:forEach items="${grades}" var="grade" varStatus="status">
                      
                       <option value="${grade.gradeId}"  <c:if test="${grade.gradeId==studentInfo.classForm.gradeId}">selected</c:if>>${grade.name}</option>
                       </c:forEach>
                     </select>
                 </td>
                 <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
                  <td class="td_right">班级：</td>
                  <td> 
                     <select  name="classId" id="selectClass"  class="select" style="width:230px;" datatype="*"> 
                        <option selected value="">请选择班级</option> 
                       <c:forEach items="${studentInfo.classList}" var="cla" varStatus="status">
                       <option value="${cla.classId}" <c:if test="${cla.classId==studentInfo.classForm.classId}">selected</c:if>>${cla.name}</option>
                       </c:forEach>
                     </select>
                 </td>
                 <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
              </tr>
              <tr>
                <td class="td_right">登录密码：</td>
                <td><input  type="password"  name="loginPwd" datatype="*6-15" errormsg="密码范围在6~15位之间！" class="input-text" size="30" value="${studentInfo.studentForm.loginPwd}"></td>
                 <td width="400"><span class="Validform_check"  style="color:#f00;">*必填项</span></td>
                 <td class="td_right">确认密码：</td>
                <td><input type="password"  name="comfirmPwd" datatype="*" recheck="loginPwd" errormsg="您两次输入的账号密码不一致！"  class="input-text" size="25" value="${studentInfo.studentForm.loginPwd}"></td>
                 <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
              </tr>
               <tr>
                <td class="td_right">手机号码：</td>
                <td colsp><input type="text" name="phone" class="input-text" size="30" ignore="ignore" datatype="m" errormsg="请正确输入11位手机号码！" value="${studentInfo.studentForm.phone}"></td>
                <td width="400"><span class="Validform_check">*选填项</span></td>
               	<td class="td_right">学&nbsp;号：</td>
               	 <input type="hidden" id="beforeNumber" name="beforeNumber" value="${studentInfo.studentForm.number}">
                <td><input type="text"  id="stuNumber" name="number" class="input-text" size="30" datatype="s4-15"  sucmsg="通过信息验证！"  nullmsg="请输入学号！" errormsg="学号范围在4~15位之间" ajaxurl=""   value="${studentInfo.studentForm.number}"></td>
                <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
              </tr>
             <tr>
                <td class="td_right">身份证号码：</td>
                <td><input type="text" name="idCard" class="input-text" datatype="idCard" size="30" ignore="ignore" errormsg="身份证号码必须是15/18位！" sucmsg="身份验证通过！" value="${studentInfo.studentForm.idCard}"></td>
                 <td width="400"><span class="Validform_check" >*选填项</span></td>
                 <td class="td_right" >个人头像：</td>
             
                  <td width="630">
	              	<input type="hidden" name="avatar" class="hiddenAvatar" value="${studentInfo.studentForm.avatar}">
	              	<input type="hidden"  class="updateBeforeImg" value="0">
				    <a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span>
				    <input name="file" type="file" id="up" class="filePrew" onclick="updateBeforeImg();" >


				    </a>
	               	<img id="ImgPr" src="  <c:if test="${studentInfo.studentForm.avatar!=''}"><%=url %>/${studentInfo.studentForm.avatar}</c:if>" onload="javascript:DrawImage(this,150,150)"/>
					</td>
					<td width="500">
					</td>
              </tr>
              
              <tr>
                <td class="td_right">个人简介：</td>
                <td colspan="4"><textarea name="info" id="" cols="30" rows="10" class="textarea" style="width:600px;height:120px;">${studentInfo.studentForm.info}</textarea></td>
                 <td width="400"><span class="Validform_checktip">*选填项</span></td>
              </tr>
         
              <tr>
              <td class="td_right">&nbsp;</td>
               <td>
                 <input name="button" class="ext_btn ext_btn_submit" id="beforesumbit" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                 <input name="button" class="ext_btn ext_btn_submit" value="保存" id="teacher_sumbit" type="hidden" > 
                <input name="button" class="ext_btn ext_btn_error" value="重置" type="reset"> 
                </td>
                <td width="400"></td>        
              </tr> 
            </tbody>
          </table> 
        </form>
     </div>
  </div>
</div>
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
    ajaxPost:true,
    btnSubmit:'#teacher_sumbit',
    callback:function(data){
    	if(data.flag==1){
      	  layer.alert(data.msg,{icon:1},function(){
      		  document.location.href="${res}/admin/student/list.html";
      	  });
        }else{
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
//选择图片是设个值用于ftp图片上传判断
function updateBeforeImg(){
	$(".updateBeforeImg").val(1);
	$(".hiddenAvatar").val("");
}
  $("#beforesumbit").click(function(){
	  var imgUrl=$(".hiddenAvatar").val();
	  if($(".updateBeforeImg").val()==1&&imgUrl==""){
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
				 layer.alert("出错",{icon:2});
			  }
		 });
	  }else{
		  $("#teacher_sumbit").click();
	  } 
  }) 
    	 
     
function getCla(gradeId){
var gradeId=$("#selectGrade").val();
  	$.ajax({
		type:"post",
		url:"${res}/admin/student/getClassByGrade.html",
		data:{gradeId:gradeId},
		success:function(result){
			var jsonList = eval("(" +result+ ")") ;
			var select=document.getElementById('selectClass'); 
			var o=document.createElement("option");
		 if(jsonList.length==0){
			 select.options.length=0;
			    o.setAttribute("value","");          // 设置OPTION的 VALUE 
				o.appendChild(document.createTextNode("暂无班级")); // 设置OPTION的 TEXT
				select.appendChild(o);
			layer.alert("该年级尚未创建班级",{icon:2});
		}else{
			select.options.length=0;
			o.setAttribute("value","");          // 设置OPTION的 VALUE 
			o.appendChild(document.createTextNode("请选择班级")); // 设置OPTION的 TEXT
			select.appendChild(o);
			for(var i=0;i<jsonList.length;i++){
			
			var op=document.createElement("option");      // 新建OPTION (op) 
			op.setAttribute("value",jsonList[i].classId);          // 设置OPTION的 VALUE 
			op.appendChild(document.createTextNode(jsonList[i].name)); // 设置OPTION的 TEXT
			select.appendChild(op);           // 为SELECT 新建一 OPTION(op)

			}
		}  
		
	},
	
	});
}
//ajax实时验证绑定参数
  $("#stuNumber").change(function(){
  	var url = $(this).attr("ajaxurl");
  	var number=$("#stuNumber").val();
  	var beforeNumber=$("#beforeNumber").val();
  	var ajaxurl="${res}/admin/student/validate.html?number="+number+"&beforeNumber="+beforeNumber;
  	$(this).attr("ajaxurl",ajaxurl);
  	
  })  
</script>

</body>
</html>
