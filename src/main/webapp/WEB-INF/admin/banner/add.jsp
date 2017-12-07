<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/admin/layouts/comm.jsp" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传轮播图</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link href="${res}/front/css/fileUploadLogo.css" rel="stylesheet" type="text/css" />
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
       <li><a href="#">上传轮播图</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>上传轮播图</span></div>
     <div class="padding5">
      <form class="jqtransform" action="" method="post" modelAttribute="studentAdd">
         <table class="form_table"  cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">标题：</td>
                <td><input type="text"  name="title" class="input-text" size="30" value=""/></td>
                <td width="400"><span class="Validform_check" style="color:#f00;">*必填项</span></td>
              </tr>
        <tr>
                  <td class="td_right" >上传图片：</td>
             
                  <td width="630">
                  <div>
                  	<img id="ImgPr" src="${users.avatar}" onload="javascript:DrawImage(this,150,150)"/>
                  	<div>&nbsp;</div>
                  </div>
	              	<input type="hidden" name="bannerUrl" class="hiddenAvatar" value="">
				    <a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span>
				    <input name="file" type="file" id="up" class="filePrew" >
				    </a>
					</td>
					<td width="400"><span class="Validform_check" style="color:#f00;">*必填项（上传图片尺寸应为"1200x420px"）</span></td>
					<td width="500">
					</td>
              </tr>
              <tr>
              <td class="td_right">&nbsp;</td>
               <td>
                 <input name="button" class="ext_btn ext_btn_submit" value="保存" type="button"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input name="button" class="ext_btn ext_btn_error" value="重置" type="button"/> 
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
  $(".jqtransform").Validform({
    tiptype:function(msg,o,cssctl){
      if(!o.obj.is("form")){
        var objtip=o.obj.parents("td").next().find(".Validform_check");
        cssctl(objtip,o.type);
        objtip.text(msg);
      }
    },
  });
 
  $("#up").uploadPreview({ img: "ImgPr",width: 120, height: 120, imgType: ["gif", "jpeg", "jpg", "bmp", "png"]});
  
})


function isQualified(){
	var node=$("#up");
	var src = node.val();
if(!src.match( /.jpg|.gif|.png|.bmp/i ) ){ 
   return false;
}
 return true;
};



function updateImg(){
	var imgtype=isQualified();
	if(imgtype){
    	 $.ajaxFileUpload({
		     type: "post",
		     url: "${res}/upload/uploadImg.html",
		     secureuri :false, 
	         fileElementId:'up',                        //文件选择框的id属性 
	         data:{type:4},
		     dataType: "json",
		     success: function(data,status){
		    	 $(".hiddenAvatar").val(data.url);
		    	 add();
		     },
			 error:function(){
				  layer.alert("上传失败",{icon:2});
			  }
		 });
	}else{
		layer.alert('图片格式无效！',{icon:2}); 
	}
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
function add(){
	 $(".jqtransform").ajaxSubmit({
	     type: "post",
	     url: "add.html",
	     dataType: "json",
	     success: function(result){
	          if(result.flag==1){
	        	  /* updateImg(); */
	        	  layer.alert("创建成功",{icon:1},function(){
	        		  document.location.href="list.html";
	        		  layer.closeAll();
	        	  });
	          }else{
	        	  layer.open({
	    		      time: 3000, 
	    		      title: '提示', 
	    		      icon:2,  
	    		      content:'创建失败' 
	    		    });
	          }
	     }
	 });
}
$(".ext_btn_submit").click(function(){
	var title=$("input[name='title']").val();
	if(title!=""){
		updateImg();
	
	}else{
		 layer.open({
		      time: 3000, 
		      title: '提示', 
		      icon:2,  
		      content:'请填好所有信息通过后再提交！' 
		    });
	 }
	  
  })
//重置
$(".ext_btn_error").click(function(){
	 document.location.href="add.html";
})
</script>


</body>
</html>
