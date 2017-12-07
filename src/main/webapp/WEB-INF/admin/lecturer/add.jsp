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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建专家</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link href="${res}/front/css/fileUploadLogo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
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
      <c:if test='${lecturerPo.lecturerId!=null}'>
       <li><a href="#">修改专家资料</a></li>
      </c:if>
      <c:if test='${lecturerPo.lecturerId==null}'>
       <li><a href="#">新建专家</a></li>
      </c:if>
      
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><c:if test='${lecturerPo.lecturerId!=null}'>
       <span>修改专家资料</span>
      </c:if>
      <c:if test='${lecturerPo.lecturerId==null}'>
       <li><a href="#">新建专家</a></li>
      </c:if>
      </div>
     <div class="padding5">
      <form class="jqtransform" action="${res}/admin/lecturer/lecturerAdd.html"  >
         <table class="form_table"  cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">专家姓名：</td>
                 <input type="hidden" name="lecturerId" value="${lecturerPo.lecturerId}">
                <td><input type="text" name="name"  id="tname"class="input-text" size="30" value="${lecturerPo.name }" datatype="*2-4" errormsg="姓名名称必须是2到4位字符！" ></td>
                <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
                 <td class="td_right">出生日期：</td>
                <td><input type="text" value="<fmt:formatDate value="${lecturerPo.birthday2}"  pattern="yyyy-MM-dd"/>" name="birthday" class="input-text laydate-icon" id="birthday" size="25"></td>
                 <td width="400"><span class="Validform_checktip">*选填项</span></td>
              </tr>
             <tr>
              <td class="td_right">性别：</td>
               <td><input type="radio" value="1" name="gender" id="male"  datatype="*" errormsg="请选择性别！" <c:if test='${lecturerPo.gender==1}'>checked</c:if>/><label>男</label> <input type="radio" value="2" name="gender" id="female" <c:if test='${lecturerPo.gender==2}'>checked</c:if> /><label>女</label></td>
               <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
               <td class="td_right" >个人邮箱：</td>
               <td><input type="text" name="email" id="temail" value="${lecturerPo.email}" class="input-text" size="25" datatype="e" errormsg="邮箱地址格式不对！" ignore="ignore"></td>
                <td width="400"><span class="Validform_check" >*选填项</span></td>
             </tr>
               <tr>
                <td class="td_right">手机号码：</td>
                <td><input type="text" name="phone" id="tmobile" value="${lecturerPo.phone}" ignore="ignore" class="input-text" size="30" datatype="m" errormsg="请正确输入11位手机号码！"></td>
                <td width="400"><span class="Validform_check">*选填项</span></td>
                <td class="td_right" >职称：</td>
                <td><input type="text" name="position" value="${lecturerPo.position}" class="input-text" ignore="ignore" size="25" datatype="s2-8" errormsg="职称为2-8为位中英字符！"  id="tposition" ></td>
                <td width="400"><span class="Validform_check">*选填项</span></td>
              </tr>
             <tr>
                 <td class="td_right">个人简介：</td>
                <td colspan="1"><textarea name="info" id="tinfo" cols="30" rows="10" class="textarea" style="width:245px;height:120px;">${lecturerPo.info}</textarea></td>
                 <td width="400"><span class="Validform_checktip">*选填项</span></td>
                <td class="td_right" >个人头像：</td>
              	<td width="630">
              	<input type="hidden" name="avatar" class="hiddenAvatar" value="${lecturerPo.avatar}">
              	<input type="hidden"  class="updateBeforeImg" value="">
			    <a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span>
			    <input name="file" type="file" id="up" class="filePrew"  onclick="updateBeforeImg();">
			    </a>
			    <img id="ImgPr" src="<c:if test="${lecturerPo.avatar!=null}"><%=url %>/${lecturerPo.avatar} </c:if>" onload="javascript:DrawImage(this,150,150)"/>
				</td>
				<td width="500">
				</td>
              </tr>
            
         
              <tr>
              <td class="td_right">&nbsp;</td>
               <td>
                 <input name="button" class="ext_btn ext_btn_submit" id="teacher_sumbit" value="保存" type="hidden">
                 <input name="button" class="ext_btn ext_btn_submit" id="beforesumbit" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input name="button" class="ext_btn ext_btn_error" value="重置" type="reset" onclick="document.location.href='${res}/admin/teacher/add.html';"> 
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
  $(".jqtransform").Validform({
    tiptype:function(msg,o,cssctl){
      if(!o.obj.is("form")){
        var objtip=o.obj.parents("td").next().find(".Validform_check");
        cssctl(objtip,o.type);
        objtip.text(msg);
      }

    },showAllError:true,
    ajaxPost:true,
	btnSubmit:"#teacher_sumbit",
    callback:function(data){
    	if(data.flag==1){
			  layer.alert(data.msg,{icon:1},function(){
				  window.location.href="${res}/admin/lecturer/list.html";
			  });
		  }else if(data.flag==2){
			  $(".moveNum").hide();
      	  $(".checkNum").html(data.msg);
		  }else{
			  layer.alert(data.msg,{icon:2});
		  }
	  },error:function(httpstate){alert("请求异常");}
  
   
    
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

function del() {
	$.ajax({
		url : "delPic.html",
		type : "get",
		data : {
			"picPath" :$("#picPath").val()
		},
		success : function() {
			$(".file").css('display', 'none');
			$("#fileQueue").empty();
			$(".upload").css('display', 'block');
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
