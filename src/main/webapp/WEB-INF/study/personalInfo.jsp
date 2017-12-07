﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
<title>个人中心-亚卓数字教学中心</title>
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/student/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/student/css/vip.css" />
<link href="${res}/front/css/fileUploadLogo.css" rel="stylesheet" type="text/css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="${res}/student/js/layer/laydate/laydate.js"></script><!--日历插件-->
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/uploadPreview.js"></script><!--图片上传预览 -->
<script type="text/javascript" src="${res}/js/ajaxfileupload.js"></script>

<!--/js-->
</head>
<body>
<!--个人中心栏目-->
<%@ include file="/WEB-INF/study/comm.jsp" %>
<!--/个人中心栏目-->
    
   <!-- 主体右边 -->
   <div class="mian_right minHeight500">
     
    <h2 class="main_right_h2">个人资料</h2>
    <div class="mian_right_basic">
        <h3>基本信息</h3>
        <form id="basicForm" >
        <input type="hidden" name="loginId"  value="${studentForm.loginId}">
         <input type="hidden" name="studentId"  value="${studentForm.studentId}">
            <ul>
                <li>
                    <label for="">头像</label>
                    <div class="inputbox">
                        <div class="portrait-box"><img id="ImgPr" class="headpic" src="<%=url %>/${studentForm.avatar}">
                            <p class="change" id="setPhoto"><span>修改</span></p>
                                <input type="hidden" name="avatar" class="hiddenAvatar" value="${studentForm.avatar}">
                            	<input type="hidden"  class="updateBeforeImg" value="">
                              <input name="file" type="file" id="up" class="filePrew" onclick="updateBeforeImg();"  >
                        </div>
                    </div>
                </li>
                <li>
                    <label for="uname">用户名</label>
                    <div class="inputbox">
                        <span class="username" name="name" id="uname">${studentForm.name}</span>
                    </div>
                </li>
                <li>
                    <label for="">学号</label>
                    <div class="inputbox">
                     <span class="username" name="number" id="uname">${studentForm.number}</span>
                    </div>
                </li>
                <li>
                    <label for="usex">性别</label>
                    <div class="inputbox">
                        <span class="select-box-sex"><select id="usex" name="gender">
                        <c:if test="${studentForm.gender==3}">
                            <option value="3" selected>保密</option> 
                             <option value="1" >男</option>
                             <option value="2" >女</option>
                        </c:if>
                         <c:if test="${studentForm.gender==1}">
                            <option value="1" selected>男</option>
                            <option value="2" >女</option>
                            <option value="3" >保密</option> 
                            
                         </c:if>
                         <c:if test="${studentForm.gender==2}">
                            <option value="2" selected>女</option>
                            <option value="1">男</option>
                             <option value="3">保密</option>
                         </c:if>
                        </select></span>
                    </div>
                </li>
                <li>
                    <label for="calendar">生日</label>
                    <div class="inputbox">
                        <input id="calendar" class="laydate-icon" type="text" name="birthday" value="<fmt:formatDate value="${studentForm.birthday2}" type="date" dateStyle="medium"/>">
                      <%--   	<fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${studentForm.birthday}" /> --%>
                        </input>
                    </div>
                </li>
                 <li>
                    <label for="">电话</label>
                    <div class="inputbox">
                        <input type="text" class="truename" name="phone" value="${studentForm.phone}" maxlength="30">
                    </div>
                </li>
                <li>
                    <label for="">邮箱</label>
                    <div class="inputbox">
                        <input type="text" class="truename" name="email" value="${studentForm.email}" maxlength="30">
                    </div>
                </li>
                <li>
                    <label for="">专业/班级</label>
                    <div class="inputbox">
                     <span class="username" name="major" id="uname">${studentForm.className}</span>
                       <%--  <input type="text" readonly="readonly" class="truename" name="major" value="${studentForm.major}-${studentForm.className}" maxlength="30"> --%>
                        
                    </div>
                </li>
                <li>
                    <label for="">个人简介</label>
                    <div class="inputbox">
                        <textarea id="basArea"  maxlength="200" name="info">${studentForm.info}</textarea>
                        <p class="extra-tips">可以输入 <span id="tipsNum">200</span> 字</p>
                    </div>
                </li>
            </ul>
            <button type="button" class="green-btn" id="update">保存</button>
        </form>
    </div>

   </div>
   <!-- 主体右边 end -->
    
</div>
<!--main-->

<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->


<script type="text/javascript">
  $(function(){
   //laydate插件引入
   laydate.skin('molv');
   laydate({elem: '#calendar'});
   $("#up").uploadPreview({ img: "ImgPr",width: 120, height: 120, imgType: ["gif", "jpeg", "jpg", "bmp", "png"]});
  })
  
 //选择图片是设个值用于ftp图片上传判断
function updateBeforeImg(){
	$(".updateBeforeImg").val(1);
	$(".hiddenAvatar").val("");
} 
  
  $("#update").click(function(){
	  
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
			    	 update();
			    	 
			     },
				 error:function(){
					  alert("错了");
				  }
			 });
		}else{
			update();
		}
	  
	  
  })
  function update(){
	  $.ajax({
			
		    url: '${res}/user/updateInfo.html',
		    type: 'post',
		    dataType:'json',
		    contentType : "application/x-www-form-urlencoded",  
		    data: $("#basicForm").serialize(),
		    success: function(data) {
		    	if(data.flag=="1"){
		    		 layer.alert(data.msg,{icon:1},function(){
						  window.location.href="${res}/study/toPersonalInfo.html";
					  });
		    	}
		    },
/* 		    error:function(e){
		    	alert("error");
		    } */

		})	
  }
</script>
</body>
</html>

   


























