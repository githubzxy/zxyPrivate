<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发布公告</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link rel="stylesheet" type="text/css" href="${res}/umeditor/themes/default/css/umeditor.css">

<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">发布公告</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>发布公告</span></div>
     <div class="padding5">
      <form class="fbafficheform" action="#">
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">公告标题：</td>
                <td class=""> <input name="title" class="input-text" size="50" type="text"  datatype="*" value=""></td>
                 <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                </tr>
                 <tr>
                  <td class="td_right">公告内容：</td>
                  <td class="">
                    <script type="text/plain"  name="content" id="myEditor" style="width:600px;height:240px;">
                <p></p>
               </script>
                  </td>
                   <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                 </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" class="ext_btn ext_btn_submit" id = "add" value="确认发布" type="button">
                   </td>
                    <td width="500"></td>
                 </tr>
               </tbody>
          </table>
        </form>
     </div>
  </div>
</div>
 <script> var imageUrlOfReal="<%=url%>";</script>
 <script type="text/javascript" src="${res}/umeditor/third-party/template.min.js"></script>
 <script type="text/javascript" charset="utf-8" src="${res}/umeditor/umeditor.config.js"></script>
 <script type="text/javascript" charset="utf-8" src="${res}/umeditor/umeditor.min.js"></script>
 <script type="text/javascript" src="${res}/umeditor/lang/zh-cn/zh-cn.js"></script>
 <script type="text/javascript">
//实例化编辑器
 var um = UM.getEditor('myEditor');  
  $(function(){  
    $(".fbafficheform").Validform({
      tiptype:2
    });
    
    $("#add").click(function(){
    	if($("input[name='title']").val()==""||$("input[name='content']").val()==""){
    		layer.confirm('亲,请输入。。。',{icon: 3, title:'提示'},function(){ 
    			layer.closeAll();
    		});
    	}else{
    
    	
		 $.ajax({
			url: '${res}/admin/notice/add.html',
			type: 'post',
		    dataType:'json',
		    contentType : 'application/x-www-form-urlencoded',
		    data: $(".fbafficheform").serialize(),
			

		    success: function(data) {
		    	if(data.flag=="1"){
		    		window.location.href="${res}/admin/notice/list.html";
		    	}
		    	
		    }
		    	
		 
		})
    	}
	});
    
    
 });
  
  
  
</script>
</body>
</html>
