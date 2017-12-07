<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改课程类别</title>
<link href="${res }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res }/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res }/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
      $(".click").click(function(){
        $(".mask").show();
      $(".tip").fadeIn(200);
      });
      
      $(".tiptop a").click(function(){
          $(".mask").hide();
      $(".tip").fadeOut(200);
    });

  $(".sure").click(function(){
     $(".mask").hide();
  $(".tip").fadeOut(100);
  });

  $(".cancel").click(function(){
     $(".mask").hide();
  $(".tip").fadeOut(100);
  });
//表格单双格颜色渐变
$('.tablelist tbody tr:odd').addClass('odd');
  });
</script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">修改课程类别</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>修改课程类别</span></div>
     <div class="padding5">
     <form id="courseType" action="">
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">类别名称：</td>
                <td class=""> <input name="name" class="input-text" size="40" type="text" value="中职德育部颁5门课程"></td>
                <td class="td_right"></td><td></td>
                </tr>
             
                 <tr>
                  <td class="td_right">类别信息：</td>
                  <td class="">
                    <textarea name="" id="" cols="80" rows="10" class="textarea">这是亚卓教育向中职市场进军开发的第一期课程产品！</textarea>
                  </td>
                 </tr>
                <tr>
                  <td class="td_right">类别封面图：</td>
                  <td class=""><input name="file"  size="10" type="file"></td>
                 </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" class="ext_btn ext_btn_submit" value="保存" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                     <input name="button" class="ext_btn ext_btn_error"  value="重置" type="button"> 
                   </td>
                 </tr>
               </tbody>
          </table>
          </form>
     </div>
  </div>
</div>
</body>
</html>
