<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/admin/layouts/comm.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新建资源类别</title>
<link href="${res }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res }/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res }/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res }/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res }/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res }/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res }/plugin/swfupload/swfupload.js"></script>
<script src="${res }/plugin/layer/laydate/laydate.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
       <c:if test="${resourceType.name!=null}"> <li><a href="#">修改资源类别</a></li></c:if>
       <c:if test="${resourceType.name==null}"> <li><a href="#">新建资源类别</a></li></c:if>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle">
     <c:if test="${resourceType.name!=null}">  <span>修改资源类别</span></c:if>
       <c:if test="${resourceType.name==null}">  <span>新建资源类别</span></li></c:if>
    
     </div>
     <div class="padding5">
     <form class="addTypeform" action="${res}/resource/addResType.html">
      <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">资源分类名称：</td>
                <td><input name="name" class="input-text name" size="40" type="text" datatype="*2-6" value="${resourceType.name}" errormsg="资源分类名称必须是2到6位中文字符！"/>
                <input name="id" class="id"  type="hidden" value="${resourceType.id }"/></td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                </tr>
                 <tr>
                  <td class="td_right">资源分类描述：</td>
                  <td >
                    <textarea name="info" class="info" id="" cols="100" rows="7" class="textarea" >${resourceType.info}</textarea>
                  </td>
                   <td width="400"><span class="Validform_checktip" >*选填项</span></td>
                 </tr>
        
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td>
                     <input name="submit" class="ext_btn ext_btn_submit" value="保存" type="button"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                     <input name="button" class="ext_btn ext_btn_error"  value="重置" type="reset"/> 
                   </td>
                 </tr>
               </tbody>
          </table>
        </form>
     </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
  $(".addTypeform").Validform({
    tiptype:function(msg,o,cssctl){
      if(!o.obj.is("form")){
        var objtip=o.obj.parents("td").next().find(".Validform_checktip");
        cssctl(objtip,o.type);
        objtip.text(msg);
      }

    }, ajaxPost:true,
	btnSubmit:".ext_btn_submit",
    callback:function(data){
    	if (1 == data) {
    		var resourceTypeName="${resourceType.name}";
    		if(resourceTypeName!=""){
    			layer.alert("修改类型成功",{icon: 1, title:'提示'},function(){
    				window.location.href="typeList.html";
    			});
    		}else{
    			layer.alert("新建类型成功",{icon: 1, title:'提示'},function(){
    				window.location.href="typeList.html";
    			});
    		}
    		
		} else {
			  if(resourceTypeName!=null){
	            	layer.alert("修改类型失败！",{icon: 2, title:'提示'});
	    		}else{
	    			layer.alert("添加类型失败！",{icon: 2, title:'提示'});
	    			}
			
		}
    }
  });

})

/* $(".ext_btn_submit").click(function(){
	 var flag=false;
	 $(".Validform_check").each(function() { 
		 flag = false;
			if($(this).html()=="通过信息验证！"){
				flag = true;
			}
		});
	 if(flag){
		 var id = $(".id").val();
			var name = $(".name").val();
			var info = $(".info").val();
			$.ajax({
				url : "${res}/resource/addResType.html",
				type : "post",
				data : {id:id,name:name,info:info},
				success : function(date) {
					if(date==1){
						location.href="typeList.html";
					}else{
						layer.alert("添加类型失败！");
					}
				}
			});
		 
	 }else{
		 layer.open({
		      time: 3000, //2s后自动关闭
		      title: '提示' , 
		      icon:2,  
		      content:'请填好信息再提交！' 
		    });
	 }
	
}) */

</script>
</body>
</html>