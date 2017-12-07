<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>试题列表</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<!-- <link href="plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" /> -->
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/global.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">新建试题</a></li>
    </ul>
</div>
<div class="rightinfo">
  <div class="formbody">
     <div class="formtitle"><span>新建试题</span></div>
     <div class="padding5">
        <form class="jqtransform"  id="mainForm" action="#">
         <table class="form_table"  cellspacing="0" cellpadding="0" border="0">
            <tbody>
             <tr>
                <td class="td_right">所属课程：</td>
                <td> 
                    <select name="courseId" class="select" id = "course" style="width:270px;" datatype="*"> 
                      <c:set var ="courseId" value ="${requestScope.testPo.coursePo.courseId}"></c:set>
                      <c:forEach items="${requestScope.courseNamePos}" var = "list">
                      	<option value="${list.courseId }" 
                      	<c:if test="${list.courseId==courseId}">selected = "selected"</c:if>
                      	 >${list.courseName}</option>
                      </c:forEach> 
                    </select>
                </td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
              </tr>
            <tr>
                <td class="td_right">所属视频：</td>
                <td> 
                    <select name="videoId" id="video"   class="select" style="width:270px;" datatype="*" nullmsg="-----------------请选择课程视频-----------------------"> 
                     <c:set var ="videoId" value ="${requestScope.testPo.video.videoId}"></c:set>
                      <c:forEach items="${requestScope.videoPos}" var = "list">
                      	<option value="${list.videoId }" 
                      	<c:if test="${list.videoId==videoId}">selected = "selected"</c:if>
                      	 >${list.name}</option>
                      </c:forEach> 

                    </select>
                </td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
              </tr>
              <tr>
              	<input type="hidden" name ="subjectId" value="${requestScope.testPo.subjectId}"></input>
                <td class="td_right">试题标题：</td>
                <td><input type="text" name="title" class="input-text" size="30" datatype="*" id="title" value="${requestScope.testPo.title }"></td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
              </tr>
               <tr>
                <td class="td_right">试题类型：</td>
                <td> 
                    <select name="subjectTypeId" class="select"  datatype="*"  id="subjectType">
                    	<c:set var ="subjectTypeId" value ="${requestScope.testPo.subjectTypePo.subjectTypeId}"></c:set>
             			<c:forEach items="${requestScope.subjectTypePos}" var = "list">
                      		<option value=${list.subjectTypeId }
                      		<c:if test="${list.subjectTypeId==subjectTypeId}">selected = "selected"</c:if>
                      		>${list.typeName}</option>
                      	</c:forEach> 

                    </select>
                </td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
              </tr>
              <tr>
                <td class="td_right" id="dis_title">单选题：</td>
                <td id = "subject"> 
                </td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
              </tr>
              <tr>
                <td class="td_right">试题用途：</td>
                <td>
                   <div class="trueAnwser">
                   <c:set var ="functionId" value ="${requestScope.testPo.functionPo.functionId}"></c:set>
                   <c:forEach items="${requestScope.functionPos}" var="list">
                   			<span><input type="radio" value="${list.functionId}" name="functionId" datatype="*" errormsg="请选择试题用途！" 
                   			
                   			<c:if test="${list.functionId==functionId}">checked="true"</c:if>
                   			>${list.name}</span>
                   </c:forEach>
                        
                     </div>
                </td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
              </tr>
             <tr>
              <td class="td_right">&nbsp;</td>
               <td>
                <input name="name" class="ext_btn ext_btn_submit" value="保存提交" type="button" id="update">
                </td>   
              </tr> 
            </tbody>
          </table> 
        </form>
		
     </div>
  </div>
</div>

</body>
<script type="text/javascript">
		
				var courseId;
				var videoId;
				
				$("#video").change(function(){
					 if($('option:selected', '#video').index()==1){
						 videoId=null;
					 } 
					  videoId=$("#video option:selected").val();
				})
						
				
				$("#course").change(function(){
		            		
/* 		            		  if($('option:selected', '#course').index()==1){
		            			 courseId=null;
		            		 } */
		            		 
		            		  courseId=$("#course option:selected").val();
		            		  
		            		 
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
										/* $("#video").append('<option value=""> -----请选择课程视频-----</option>'); */
					            	 	$.each(data.videoPos,function(key,val){
					            			$("#video").append(
					            					
					            					'<option value="' + val.videoId + '" >' + val.name + '</option>');
					            			 
					            		}) 
					            		
					            		
									
									};
								}
				  				}) 
		            		 
		            	 });
		
				//提交表单
				$("#update").click(function(){

						 $.ajax({
							type: 'post',
						    url: '${res}/test/updateTest.html',
						    dataType:'json',
						    contentType : "application/x-www-form-urlencoded",
						    data: $("#mainForm").serialize(),
							

						    success: function(data) {
						    	if(data.flag=="1"){
						    		window.location.href="${res}/test/list.html";
						    		
						    	}
						    	
						    }
						    	

						})
						
				});


			
		  //验证
		  $(".jqtransform").Validform({
		    tiptype:function(msg,o,cssctl){
		      if(!o.obj.is("form")){
		        var objtip=o.obj.parents("td").next().find(".Validform_checktip");
		        cssctl(objtip,o.type);
		        objtip.text(msg);
		      }
		    },
		  });
		  //试题类型改变
		  $(".dis_content").hide();
		  /* $("#subjectType option:first").prop("selected", 'selected'); */
		  var typeId=$("#subjectType option:selected").val();
		  var html = subjectDiv(typeId);
		   $("#subject").html(html);
		  $("#subjectType").change(function(){
		  var subjectType=$("#subjectType").val();
		   for (var i = 1; i <= $("#subjectType").find("option").length; i++) {
		     if (subjectType==i) {
			  html = subjectDiv(subjectType);
			   $("#subject").html(html);
		      $("#dis_title").html($("#subjectType option:selected").text()+"：");
		     };
		   };
		
		  })
		
	
		
		//type=1,单选
		//type=2,判断
		//type=3，多选
		//type=4,主观题
		function subjectDiv(type){
			var h = '';
			if(type == 1){
				h = '<div id="dis_1" class="dis_content">'+
                    '<span>选项A：<input type="text" value="${requestScope.testPo.optionsA}" name="optionA" class="input-text" size="10" datatype="*" id="optionsA" >'+
                    '<a class="f00">*</a></span>'+
                    '<span>选项B：<input type="text" value="${requestScope.testPo.optionsB}"  name="optionB" class="input-text" size="10" datatype="*" id = "optionsB">'+
                    '<a class="f00">*</a></span>'+
                    '<span>选项C：<input type="text" value="${requestScope.testPo.optionsC}" name="optionC" class="input-text" size="10" datatype="*" id="optionsC">'+
                    '<a class="f00">*</a></span>'+
                    '<span>选项D：<input type="text" value="${requestScope.testPo.optionsD}" name="optionD" class="input-text" size="10" datatype="*" id="optionsD">'+
                    '<a class="f00">*</a></span>'+
                     '<div class="trueAnwser" id="correctOption1">'+
                      '<span class="f00">正确答案：</span><span><input type="radio" value="A" name="trueOption" <c:if test="${requestScope.testPo.trueOption=='A'}">checked="true"</c:if> >选项A</span>'+
                      '<span><input type="radio" value="B" name="trueOption" <c:if test="${requestScope.testPo.trueOption=='B'}">checked="true"</c:if>>选项B</span>'+
                      '<span><input type="radio" value="C" name="trueOption" <c:if test="${requestScope.testPo.trueOption=='C'}">checked="true"</c:if>>选项C</span>'+
                      '<span><input type="radio" value="D" name="trueOption" <c:if test="${requestScope.testPo.trueOption=='D'}">checked="true"</c:if>>选项D</span>'+
                    	'</div>';
				return h;
			}else if(type == 2){
				h = '<div id="dis_2" class="dis_content">'+
                '<span>选项A：<input type="text" id="options_2_A" name="optionA" class="input-text" size="5" disabled="disabled" value="对" ></span>'+
                '<span>选项B：<input type="text"  id="options_2_B" name="optionB" class="input-text" size="5" disabled="disabled"  value="错" >'+
                '</span>'+
                '<div class="trueAnwser" id="correctOption2">'+
                  '<span class="f00">正确答案：</span>'+
                  '<span><input type="radio" value="A" name="trueOption" <c:if test="${requestScope.testPo.trueOption=='A'}">checked="true"</c:if>>选项A</span>'+
                  '<span><input type="radio" value="B" name="trueOption" <c:if test="${requestScope.testPo.trueOption=='B'}">checked="true"</c:if>>选项B</span>'+
                '</div>'+
             '</div>';
				return h;
			} else if (type == 3) {
				h = '<div id="dis_3" class="dis_content">'+
                    '<span>选项A：<input type="text" name="optionA" class="input-text" size="6" value="${requestScope.testPo.optionsA}" >'+
                    '</span>'+
                    '<span>选项B：<input type="text" name="optionB" class="input-text" size="6" value="${requestScope.testPo.optionsB}" >'+
                    '</span>'+
                    '<span>选项C：<input type="text" name="optionC" class="input-text" size="6" value="${requestScope.testPo.optionsC}" >'+
                    '</span>'+
                    '<span>选项D：<input type="text" name="optionD" class="input-text" size="6" value="${requestScope.testPo.optionsD}" >'+
                    '</span>'+                   
                    '<div class="trueAnwser" id="correctOption3">'+
                      '<span class="f00">正确答案：</span>'+
                      '<span><c:set var ="trueOption" value ="${requestScope.testPo.trueOption}"></c:set>'+
                      '<input type="checkbox" value="A" name="trueOption" <c:if test="${fn:contains(trueOption,A)}">checked="true"</c:if> >选项A</span>'+
                      '<span><input type="checkbox" value="B" name="trueOption" <c:if test="${fn:contains(trueOption,\'B\')}">checked="true"</c:if>>选项B</span>'+
                      '<span><input type="checkbox" value="C" name="trueOption" <c:if test="${fn:contains(trueOption,\'C\')}">checked="true"</c:if>>选项C</span>'+
                      '<span><input type="checkbox" value="D" name="trueOption"  <c:if test="${fn:contains(trueOption,\'D\')}">checked="true"</c:if>>选项D</span>'+
				
                    '</div>'+
                 '</div>';
				return h;
			} else {
				h = '<div id="dis_4" class="dis_content">'+
                    '<span><input name="file" size="10" type="file"></span><span class="f00">亲爱的老师，您好！建主观题您可以直接上传文件，也可以在下面的编辑器编辑哟！</span>'+
                    '<div class="gkt"><!--需要使用编辑器--><textarea name="trueOption" id="" cols="100" rows="4" class="textarea" value="${requestScope.testPo.trueOption}"></textarea></div>'+
                 '</div>';
				return h;
			}
			return h;
			
		}

		  
		  

</script>
</html>
