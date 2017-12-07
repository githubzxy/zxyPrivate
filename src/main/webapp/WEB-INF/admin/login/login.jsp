<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>欢迎登录后台管理系统</title>
<!--站标-->
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${res}/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${res}/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="57x57" href="${res}/images/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="${res}/images/ico/favicon.png">
<!--站标-->
<link rel="stylesheet" href="${res}/css/login.css" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script src="${res}/js/cloud.js" type="text/javascript"></script>
<script src="${res}/js/checkCode.js" type="text/javascript"></script>
<script language="javascript">
$(function() {
  $('.loginbox').css({
    'position': 'absolute',
    'left': ($(window).width() - 692) / 2
  });
  $(".systemlogo").css({'margin-top':($(window).height() - 690) / 2});
$(window).resize(function() {
   $('.loginbox').css({
    'position': 'absolute',
  'left': ($(window).width() - 692) / 2
     });
  })
   $(".systemlogo").css({'margin-top':($(window).height() - 690) / 2});
});
</script>
</head>
<body onResize="Resize();" onload="Resize();" style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;"  >
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>
    <div class="logintop">
      <span>欢迎登录亚卓教育后台管理平台</span>
      <ul>
        <li>
          <a href="${res}/main/index.html">回首页</a></li>
        <!-- <li>
          <a href="http://zz.yazhuokj.com">帮助</a></li> -->
      </ul>
    </div>
    <div class="loginbody">
      <span class="systemlogo"></span>
      <div class="loginbox loginbox3">
       <form action="" name="login" method="post" >
        <ul>
          <li>
            <input name="" type="text" class="loginuser" id="userName"  onclick="JavaScript:this.value=''" /></li>
          <li>
            <input name="" type="password" class="loginpwd"  id="passWord"  onclick="JavaScript:this.value=''" /></li>
          <li class="yzm">
            <span>
              <input name="" type="text" value="验证码" id="code" onclick="JavaScript:this.value=''" /></span>
             <cite class="code" id="checkCode" onclick="createCode();">取验证码</cite>
          </li>
          <li>
            <input name="submit" type="button" class="loginbtn" value="登录" id="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="reset"  type="reset" class="loginbtn" value="重置"/>
            <label></label> 
          </li>
        </ul>
        </form>
      </div>
    </div>
    <div class="loginbm">版权所有 2016<a href="http://zz.yazhuokj.com">亚卓教育</a></div>
  <!-- 遮罩效果-->
  <div id="shade"></div>
  <!-- 提示框效果 -->
  <div id="layer" class="layercenter1">
    <div class="layertitle"><span>登录失败</span><em class="tool-close"></em></div>
    <div class="layerbox">
      <dl>
        <dt></dt>
        <dd></dd>
      </dl>
      <div class="yalerbutton">
        <span class="tool-close">确认</span>
      </div>
    </div>
  </div>  
<!-- 加载效果 -->  
<div class="loading2 layercenter2" >正在登录中...</div>
<script type="text/javascript">

 $(function(){
  //提示框居中显示
  Resize = function(){
    $layerboxwidth1=$(".layercenter1").width()
    $layerboxheight1=$(".layercenter1").height()
    $endheight1=($(window).height()-$(".layercenter1").height())/2;
    $endwidth1=($(window).width()-$(".layercenter1").width())/2;
    $(".layercenter1").css('left',$endwidth1);
    $(".layercenter1").css('top',$endheight1);
    //加载框居中显示
    $layerboxwidth2=$(".layercenter2").width()
    $layerboxheight2=$(".layercenter2").height()
    $endheight2=($(window).height()-$(".layercenter2").height())/2;
    $endwidth2=($(window).width()-$(".layercenter2").width())/2;
    $(".layercenter2").css('left',$endwidth2);
    $(".layercenter2").css('top',$endheight2);
  }
  
  //表单验证登录
  $("#submit").click(function(){
    if($("#userName").val().length<1){
      $("#layer").show();
      $("#shade").show();
      $("#layer dd").text('管理员名称必须是1-10位！');
      $("#userName").focus();
    }else if($("#passWord").val().length<6){
      $("#layer").show();
      $("#shade").show();
      $("#layer dd").text('管理员密码必须是6-16位！');
      $("#passWord").focus();
    }else if($("#code").val().length<6){
        $("#layer").show();
        $("#shade").show();
        $("#layer dd").text('验证码必须是6位！');
        $("#code").focus();
      }else{
    	
        $.ajax({
          url:'${res}/admin/login/login.html',
          type:'post',
          dataType:'json',
          contentType : "application/x-www-form-urlencoded",
         data: {
            userName: $('#userName').val(),
            passWord: $('#passWord').val(),
            code:     $("#code").val(),
           } ,
          beforeSend : function () {
            $("#shade").show();
            $(".loading2").show();
        }, 
        success : function (data) {
        	$("#layer").show();
            $("#shade").show(); 
            $("#layer dd").text(data.msg);
            $(".loading2").hide();
            setTimeout(function(){
            	if(data.flag=="1"){
            		window.location.href="${res}/admin/index.html?rels=course";
            	}},2000
            		
            );
            } 
            
          });
        }
      });

    //关闭按钮
  $('.tool-close').mouseover(function(){
    $(this).addClass('hover');
  });
  $('.tool-close').mouseout(function(){
    $(this).removeClass('hover');
  });
  $(".tool-close").click(function(){
    $("#layer dd").empty();
    $("#layer").hide();
    $("#shade").hide();
  });
  //确认取消按钮
  $('.yalerbutton span').mouseover(function(){
    $(this).addClass('hover');
  });
  $('.yalerbutton span').mouseout(function(){
    $(this).removeClass('hover');
  });
  
  //各行变色
  $('table tr:even').css('background','#F9FCEF');
  
  //点击刷新
  $("dd.return").click(function(){
      location.reload();
  });
});
</script>
</body>
</html>