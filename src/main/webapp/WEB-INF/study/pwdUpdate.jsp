<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}"/>
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
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<!--/js-->
</head>
<body>
<!--个人中心栏目-->
<%@ include file="/WEB-INF/study/comm.jsp" %>
<!--/个人中心栏目-->
    
   <!-- 主体右边 -->
   <div class="mian_right minHeight500">
    <h2 class="main_right_h2">修改密码</h2>
    <div class="mian_right_basic">
      <form id="basicForm"  action="${res}/study/PwdUpdate.html">
        <ul>
          <li>
              <label for="">原来的密码</label>
              <div class="inputbox">
               <input type="hidden" class="truename" name="oldPwd1" value="${sessionScope.baseUser.loginPo.loginPwd}" >
                  <input type="password" class="truename" name="oldPwd" value="" datatype="*6-15"  recheck="oldPwd1" errormsg="与原密码不一致！" class="input-text" size="30" nullmsg="请输入密码！">
                    <a><span class="Validform_check"  style="color:#f00;"></span></a>
              </div>
          </li>
          <li>
              <label for="">新的密码</label>
              <div class="inputbox">
                  <input type="password" class="truename" name="newPwd" value="" datatype="*6-15" errormsg="密码范围在6~15位之间！" class="input-text" size="30" nullmsg="请输入密码！">
                    <a><span class="Validform_check"  style="color:#f00;"></span></a>
              </div>
          </li>
          <li>
              <label for="">确认新密码</label>
              <div class="inputbox">
                  <input type="password" class="truename" name="newPwd2" value="" datatype="*" recheck="newPwd" errormsg="您两次输入的账号密码不一致！"  class="input-text" size="25" nullmsg="请确认密码！">
                   <a><span class="Validform_check"  style="color:#f00;"></span></a>
              </div>
          </li>
        </ul>
        <button type="button" class="green-btn" id="update">保存设置</button>
      </form>
    </div>
     


   </div>
   <!-- 主体右边 end -->
    
</div>
<!--main-->

<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->
</body>
<script type="text/javascript">
	
$(function(){
  $("#basicForm").Validform({
    tiptype:function(msg,o,cssctl){
      if(!o.obj.is("form")){
        var objtip=o.obj.parents("div ul li  div").find(".Validform_check");
        cssctl(objtip,o.type);
        objtip.text(msg);
      }

    },
    showAllError:true,
    ajaxPost:true,
	btnSubmit:"#update",
    callback:function(data){
    	if (1 == data.flag) {
			layer.alert("修改密码成功,去登录！",{icon:1},function(){
				window.location.href="${res}/main/index.html";
			});
		}else{
			layer.alert("修改失败！",{icon:2});
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
</script>
</html>

   



























