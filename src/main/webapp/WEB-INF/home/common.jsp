<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yz.center.util.BaseUtil" %>
<!--footer-->
<div class="div100 footer">
   <div class="flogo">
   	  <div class="ftlogo_div">
   	  	<img src="${res}/front/images/newlogo1.png" class="ftlogo"/>
   	  </div>
      <div class="servicetel">
         <div class="telnum">
           400-0867-229&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <span class="time">(工作日：9:00-17:30)</span>
         </div>
   	  </div>
   	  <div class="friendshiplink">
            <em class="bt">友情链接:</em>
           <a href="http://www.yazhuojy.com">&nbsp;&nbsp;&nbsp;&nbsp;亚卓官网</a>
        </div>
   </div>
   <div class="copyright">
     <div class="w1200">
        
        <p class="copyr">北京亚卓教育科技有限公司 Copyright &copy;2017 亚卓教育 All RIGHTS RESERVED. 蜀ICP备13026910号-1 </p>
        <div class="link">
         <!--   <a href="javascript:layer.alert('北京亚卓教育科技有限公司（400-0867-229、成都研发中心 028-68730625）');">联系我们</a> -->
          <%--  <a href="${res }/admin/login/toApply.html" target="true">联系我们</a>
           <a href="${res }/admin/login/toApply.html" target="true">法律条款</a>
           <a href="${res }/admin/login/toApply.html" target="true" class="b_r">意见反馈</a> --%>
       </div>
     </div>
   </div>
</div>

<!--弹窗登陆-->
<div class="mask_wrap_login"></div>
<div class="tc_login_wrap">
  <a href="#" class="closex">点击我关闭</a>
  <div class="login_main">
      <h2 class="text-center">用户登录</h2>
     <form method="post" action="" >
       <div class="login-item">
         <i class="icon-user"></i><input type="text"  class="input-text"  placeholder="学号/工号"  id="userName">
       </div> 
        <div class="login-item">
           <i class="icon-password"></i><input type="password"  class="input-text" placeholder="密码" id="passWord">
       </div>  
        <div class="login-item pt15">
           <input type="button"  class="btn-tt btn-l" id = "submit" onclick="userLogin()" value="登录">
           <div id="error_box"></div>  
       </div>    
     </form>
  </div>
</div>
<!--弹窗登陆 end-->