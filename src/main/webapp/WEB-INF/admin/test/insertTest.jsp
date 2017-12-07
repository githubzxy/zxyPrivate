<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>批量导入试题</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/bootstrap-table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform_v4.0_min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">导入试题</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>导入试题</span></div>
     <div class="padding5">
        <form class="registerform" id = "insertForm"  enctype="multipart/form-data" action="${res}/test/insertTest.html">
         <table class="form_table insertable"  cellspacing="0" cellpadding="0" border="0">
            <tbody>

            	<tr>
                <td class="td_right">所属课程：</td>
                <td> 
                   <select name="courseId" class="select" id = "course" style="width:270px;" datatype="select" errormsg="请选择课程！" > 
                      <option value="">-----请选择课程-----</option> 
                      <c:forEach items="${requestScope.courseNamePos}" var = "list">
                      	<option value="${list.courseId }" >${list.courseName}</option>
                      </c:forEach> 
                    </select>
                </td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
              </tr>
            <tr>
                <td class="td_right">所属视频：</td>
                <td> 
                   <select name="videoId" id="video"   class="select" style="width:270px;" disabled="disabled"> 
                      <option>-----------------请选择课程视频-----------------------</option> 
                    </select>
                </td>
              </tr>
              <tr>
                <td class="td_right">填写样例：</td>
                <td width="830"><img src="${res}/images/test/subject.jpg"></td>
                <td></td>
              </tr>
               <tr>
                <td class="td_right">试题导入模板：</td>
                <td width="830"><a href="${res}/excel/subjectInfo.xls" class="red">【下载】</a></td>
                <td></td>
               </tr>
               <tr>
                <td class="td_right">试题信息文件：</td>
                <td width="830"><input name="file"  id="file" size="10" type="file"  style="display:none"> <div class="input-append">
                  <input id="uploadurl" class="input-large" type="text" disabled>
                  <a class="btn btn-info" onclick="$('input[id=file]').click();">
                 <i class="icon-folder-open-alt"></i> 浏览
                 </a>
                 </div></td>
                <td></td>
               </tr>
               <tr>
              <td class="td_right">&nbsp;</td>
               <td width="830">
                 <input name="button" class="ext_btn ext_btn_submit" id = "insert" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input name="button" class="ext_btn ext_btn_error" value="清空" type="button" onclick="location.reload()"> 
                </td>
                <td></td>
              </tr>
            </tbody>
          </table> 
        </form>
     </div>
  </div>
</div>

</body>
<script type="text/javascript">
$(function(){
	//验证
	$(".registerform").Validform({		 
	tiptype:function(msg,o,cssctl){
	if(!o.obj.is("form")){
	  var objtip=o.obj.parents("td").next().find(".Validform_checktip");
	  cssctl(objtip,o.type);
	  objtip.text(msg);
	}
	}
	});
	});






				var courseId;
				var videoId;
				var str;//上传问见得绝对路劲
         	   var baseUrl;
         	   $("#file").change(function(){
         	   str=$(this).val(); 
         	   var arr=str.split('\\');//注split可以用字符或字符串分割 
         	   imageUrl=arr[arr.length-1];//这就是要取得的图片名称 
         	   }) 
				$("#video").change(function(){
					 if($('option:selected', '#video').index()==1){
						 videoId=null;
					 } 
					  videoId=$("#video option:selected").val();
				})
						
				
				$("#course").change(function(){
		            	courseId=$("#course option:selected").val();
		            	$('#video').removeAttr("disabled");
		           		  	$.ajax({
				  				 url:'${res}/video/findVideo.html',
			            		 type:'post',
				 	           	 dataType:'json',
				 	         	 contentType : "application/x-www-form-urlencoded",
				 	         	 data:{
				 	         		courseId:courseId	
				 	            },
				 	           success : function(data){
				 	        	   
									if(data.flag=="1"){
										$("#video").find("option").remove();									
					            	 	$.each(data.videoPos,function(key,val){
					            			$("#video").append('<option value="' + val.videoId + '">' + val.name + '</option>');
					            			 
					            		}) 
									};
								}
				  				}) 
		            		 
		            	 });

         	 $("#insert").click(function(){
         		var file=$("#file").val();
         		if(courseId==null&&courseId==""){
         			layer.open({
       			      time: 2000, 
       			      title: '提示', 
       			      icon:2,  
       			      content:'亲,请选择课程哦--！' 
       			    });
         			
         		}else if(file==""){
         			layer.open({
         			      time: 2000, 
         			      title: '提示', 
         			      icon:2,  
         			      content:'亲,请选择文件哦--！' 
         			    });
         		}
         		else{
         			$("#insertForm").ajaxSubmit({
      	  				 url: '${res}/test/insertTest.html',
      				     type: 'post',
      				     dataType: 'json',
      				     success: function(data){
      				    	if(data.flag==1){
      				    		 layer.alert(data.msg,{icon: 1, title:'提示'},function(){
      			      				  document.location.href=" ${res}/test/list.html";
      			      			  });
      				    	}else{
      				    		 layer.alert(data.msg,{icon: 2, title:'提示'})
      			      				 
      			      			  
      				    	}
                
      				}
      		 }); 
         		}
	  			
  })
	 $('input[id=file]').change(function() {
       var path = $(this).val();
       path = path.split('＼＼');
       path = path[path.length-1];
       $('#uploadurl').val(path);
   });				
				
</script>

</html>