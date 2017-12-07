<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="亚卓教育、锦岸文化" />
<meta name="description" content=" “亚卓教育”是为中国基础教育和职业教育领域提供领先在线教学资源和教育技术的国有参股企业，拥有国家高新技术企业资质和国家级高新区“上规入库”企业评级，也是国内唯一在线教育机构与教育部主管和指导的《中国教育信息化》杂志社、《基础教育参考》杂志构建战略合作关系，共同研发在线课程资源产品的公司。author:亚卓教育技术部 " />
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<title>亚卓数字教学中心</title>
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/front/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/layout.css" />
<link rel="stylesheet" href="${res}/home/css/base.css" type="text/css" />
<link rel="stylesheet" href="${res}/home/css/pagestyle.css" type="text/css" />
<!--/css-->
<!--js-->
<%-- <script type="text/javascript" src="${res}/front/js/jquery.min.js"></script> --%>
<script type="text/javascript" src="${res }/home/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script src="${res}/front/js/jquery.page.js"></script><!-- 分页插件 -->
<script type="text/javascript" src="${res}/front/js/global.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/home/js/base.js"></script>
<!--/js-->
</head>
<body>
<!--top-->
<%@ include file="/WEB-INF/home/common_top.jsp" %>
<!--top-->
<!--mian-->
<div class="container_wrap w1250">
   <div class="fl category-all">
      <div class="m-sidebr" >
         <ul class="clist otherpage">
            <li class="item active" style="border-top:1px solid #ddd;">关于我们</li>
            <li class="item">意见反馈</li>
            <li class="item">法律条款</li>
           <!--  <li class="item">申请账号</li> -->
        </ul>
      </div><!--课程分类 end--> 
   </div><!--left end-->
   <div class="fr category-list">
       <div class="yborder-item">
         <div class="item-list-f_0 item-content-tabs">
           <div class="amap">关于我们</div>
            <p style="padding-top:30px;"> 
            亚卓教育是由政府投资的一家专注于为中国教育市场提供先进教学资源和教育技术的高新企业。亚卓教育营运中心位于北京中关村，研发中心位于成都环球中心，目前覆盖全国十多个省市。</p>
                        
            <p>公司拥有先进的平台技术和强大的教学资源研发实力，为高等教育、职业教育、企业培训等提供专业化的在线学习平台产品、网络教育课程、视频资源拍摄与制作、线下全方位技术支持及线下培训等产品与服务。 </p>
            <p >  公司以“技术平台+课程资源+全托管式服务”为运营模式，辅之线上线下（O2O）相结合的先进教育理念，为政府、学校、企业和个人在互联网条件下，提供全新的教学和学习方式。</p>
            <p> 公司提供以下产品及服务： </p>      
            <p>职业教育、高等教育课程分层分类开发</p>
            <p>高等院校“数字学习中心”建设</p>
            <p>中职学校“数字教学中心”建设</p>
            <p>国家职业核心能力师资培训与学生认证</p>
            <p>大数据专业人才培训认证</p>
            <p>职业学校、高等院校课程拍摄制作：微课、慕课、精品课、宣传片 </p> 
            <p class="pt15"><img src="${res}/home/images/beijing.png" alt=""> </p>
            <p>北京亚卓教育科技有限公司</p>
            <p>北京营运中心 : 北京市海淀区中关村东路1号院清华科技
             园区创业大厦504室</p>
             <p>  电话：400-086-7229</p>
            <p class="pt15"><img src="${res}/home/images/hqzx.png" alt=""> </p>
            <p>成都研发中心 :四川省成都市高新区天府大道北段1700号
            新世纪环球中心N1区 1709号 </p>
            <p>电话：028-68730625 &nbsp;&nbsp; 传真：028-68731974</p> 
            <p style="padding-top:50px!important;color:#999!important;">责任编辑：【亚卓教育】</p>
         </div><!--关于我们 end-->
         <div class="item-list-f_1 item-content-tabs hidden">
           <h2>意见反馈</h2>
           <p class="notic-p"><a href="#" target="_blank">*&nbsp;看看常见问题中是否有你想要的答案！</a></p>
           <form id="feedBack">
               <p class="ptitle pt15"><span class="red">*</span>问题分类</p>
               <p class="label-p"><input type="radio" name="typeId" value="1"/><label class="typelabel">登录问题</label></p>
               <p class="label-p"><input type="radio" name="typeId" value="2"/><label class="typelabel">课程学习</label></p>
               <p class="label-p"><input type="radio" name="typeId" value="3"/><label class="typelabel">资源下载</label></p>
               <p class="label-p"><input type="radio" name="typeId" value="4"/><label class="typelabel">其他问题或者建议</label></p>
               <div class="clearfix"></div>
              <p class="ptitle pt15"><span class="red">*</span>标题</p>
              <input type="text" name="title" class="input-text1" style="padding-left:10px;width:98.5%;" placeholder="请输入问题描述标题">
              <p class="ptitle pt15"><span class="red">*</span>内容</p>
              <textarea name="content" class="yjtextarea" ></textarea>
              <p class="ptitle pt15"><span class="red">*</span>联系方式</p>
              <input type="text" name="phone" class="input-text1" style="padding-left:10px;width:98.5%;" placeholder="请输入你的联系方式">
              <p class="notic-p"><input type="button" id="addFeedBack"  class="btn btn-l" style="width:100px;" value="提交"></p>
           </form>
         </div><!--意见反馈 end-->
          <div class="item-list-f_2 item-content-tabs hidden">
            <div class="contentfl">
              <h2>亚卓数字教学中心平台协议</h2>
              <br>
              <p>
                尊重用户个人隐私是中国大学MOOC平台的一项基本政策。所以，中国大学MOOC平台不会公开或透露您的注册资料及保存在中国大学MOOC平台服务中的非公开内容，除非中国大学MOOC平台在诚信的基础上认为透露这些信息在以下几种情况是必要的
              </p>
              <p>如果您对本协议内容有任何疑问，请发送邮件至我们的客服邮箱</p>
              <br>
               <p>
                尊重用户个人隐私是中国大学MOOC平台的一项基本政策。所以，中国大学MOOC平台不会公开或透露您的注册资料及保存在中国大学MOOC平台服务中的非公开内容，除非中国大学MOOC平台在诚信的基础上认为透露这些信息在以下几种情况是必要的
              </p>
              <p>如果您对本协议内容有任何疑问，请发送邮件至我们的客服邮箱</p>
               <p>
                尊重用户个人隐私是中国大学MOOC平台的一项基本政策。所以，中国大学MOOC平台不会公开或透露您的注册资料及保存在中国大学MOOC平台服务中的非公开内容，除非中国大学MOOC平台在诚信的基础上认为透露这些信息在以下几种情况是必要的
              </p>
              <p>如果您对本协议内容有任何疑问，请发送邮件至我们的客服邮箱</p>
               <p>
                尊重用户个人隐私是中国大学MOOC平台的一项基本政策。所以，中国大学MOOC平台不会公开或透露您的注册资料及保存在中国大学MOOC平台服务中的非公开内容，除非中国大学MOOC平台在诚信的基础上认为透露这些信息在以下几种情况是必要的
              </p>
              <p>如果您对本协议内容有任何疑问，请发送邮件至我们的客服邮箱</p>
               <p>
                尊重用户个人隐私是中国大学MOOC平台的一项基本政策。所以，中国大学MOOC平台不会公开或透露您的注册资料及保存在中国大学MOOC平台服务中的非公开内容，除非中国大学MOOC平台在诚信的基础上认为透露这些信息在以下几种情况是必要的
              </p>
              <p>如果您对本协议内容有任何疑问，请发送邮件至我们的客服邮箱</p>

            </div>
          </div><!--法律条款end-->
          <div class="item-list-f_3 item-content-tabs hidden">
              <h2>申请帐号</h2> 
               <p class="notic-p">*&nbsp;请认真填写，以便于公司技术部门分发帐号！在申请过程中有任何问题，请及时反馈技术部！(联系QQ：2485123177 余老师)</p>
                <p class="ptitle pt15" style="font-size:16px;"><span class="red">*</span>您是<span class="red ml15">(请仔细选择！)</span></p>
                <ul class="select_ul">
                       <li class="cur">公司销售</li>
                       <li>学校领导</li>
                       <li>其他用户</li>
                </ul>
                <div class="clearfix"></div>
                 <div class="form-div_wrap">
                        <div class="form-div form-div_0">
                         <form action="" id="mainForm1">
                         	<input type="hidden" name="roleCode" value="公司销售"/>
                            <p class="ptitle pt15"><span class="red">*</span>姓名</p>
                             <input type="text" name="name" class="input-text1" style="padding-left:10px;width:98.5%;" placeholder="请输入姓名，格式:四川区域+张X">
                             <p class="ptitle pt15"><span class="red">*</span>帐号用途</p>
                            <textarea name="info" class="yjtextarea" ></textarea>
                            <p class="ptitle pt15"><span class="red">*</span>联系方式</p>
                            <input type="text" name="number" class="input-text1" style="padding-left:10px;width:98.5%;" placeholder="请输入你的联系方式">
                        </form>
                            <p class="notic-p"><input type="button" id="add"  class="btn btn-l" style="width:100px;" value="马上申请"></p>
                        </div><!--公司销售 end-->
                         <div class="form-div form-div_1 hidden">
                         <form action="" id="mainForm2">
                         <input type="hidden" name="roleCode" value="学校领导"/>
                           <p class="ptitle pt15"><span class="red">*</span>学校名称</p>
                             <input type="text" name="name" class="input-text1" style="padding-left:10px;width:98.5%;" placeholder="请输入学校名称">
                             <p class="ptitle pt15"><span class="red">*</span>所在省份</p>
                             <input type="text" name="info" class="input-text1" style="padding-left:10px;width:98.5%;" placeholder="请输入学校所在省份">
                             <p class="ptitle pt15"><span class="red">*</span>负责人联系方式</p>
                             <input type="text" name="number" class="input-text1" style="padding-left:10px;width:98.5%;" placeholder="请输入负责人联系方式">
                             <p class="notic-p"><input type="button" id="add2"  class="btn btn-l" style="width:100px;" value="马上申请"></p>
                          </form>
                         </div><!--学校领导 end-->
                         <div class="form-div form-div_2 hidden">
                         <form action="" id="mainForm3">
                         <input type="hidden" name="roleCode" value="其他用户"/>
                          <p class="ptitle pt15"><span class="red">*</span>姓名</p>
                             <input type="text" name="name" class="input-text1" style="padding-left:10px;width:98.5%;" placeholder="请输入姓名">
                             <p class="ptitle pt15"><span class="red">*</span>申请原因</p>
                             <textarea name="info" class="yjtextarea" ></textarea>
                            <p class="ptitle pt15"><span class="red">*</span>联系方式</p>
                            <input type="text" name="number" class="input-text1" style="padding-left:10px;width:98.5%;" placeholder="请输入你的联系方式">
                            <p class="notic-p"><input type="button" id="add3"  class="btn btn-l" style="width:100px;" value="马上申请"></p>
                         </div><!--其他用户 end-->
                         </form>
                  </div>
          </div><!--申请帐号end-->
       </div>
   </div><!--right end-->
</div>
<!--main end-->
<div class="clearfix"></div>
<!--footer-->
<div class="bottom1 clearfix">
  <div class="w1250 marginauto">
           <div class="friendShip fl">
              <h3>友情链接</h3>
              <div class="clearfix">
                <a target="_blank" href="http://www.yazhuokj.com">亚卓教育</a>
                <a target="_blank" href="http://zz.yazhuokj.com">亚卓数字教学中心</a> 
              </div>
            </div>
          <div class="friendShip fl shipImg">
               <h3>亚卓教育</h3>
         <a href="#" target="_blank" class="QQ" title="QQ"></a>
                   <a href="#" target="_blank" class="xinlang" title="关注新浪微博"></a>
                   <a href="#" target="_blank" class="weixin" title="扫一扫关注亚卓教育微信公众号">
                          <div class="gwxLi">
          <div class="gwxli_img"></div>
                </div>
                   </a>
          </div>
       <div class="aboutus fl">
       <h3>关于我们</h3>
       <ul>
       <li class="server" >客服服务热线<b>Service hotline</b></li>
       <li class="down_app" >400-0867-229</li>
       </ul>
       </div>                         
    </div>
</div>
<div class="footer" >
<div class="w1250 marginauto">
    <p class="copyr">四川亚卓教育科技股份有限公司 Copyright &copy;2017 亚卓教育 All RIGHTS RESERVED. 蜀ICP备13026910号-1 </p>
      <div class="link">
       <a href="javascript:alert('北京亚卓教育科技有限公司（400-0867-229、成都研发中心 028-68730625）');">联系我们</a>
       <a href="${res }/admin/login/toApply.html" target="true">联系我们</a>
       <a href="${res }/admin/login/toApply.html" target="true">法律条款</a>
       <a href="${res }/admin/login/toApply.html" target="true" class="b_r">意见反馈</a>
      </div>  
</div>
</div>
<!--footer end-->
<%@ include file="/WEB-INF/home/common.jsp" %>  
<!--footer end-->
<script>

//提交表单
$("#add").click(function(){

		 $.ajax({
			type: 'post',
		    url: '${res}/admin/login/apply.html',
		    dataType:'json',
		    contentType : "application/x-www-form-urlencoded",
		    data: $("#mainForm1").serialize(),

		    success: function(data) {
		    	if(data.flag=="1"){
		    		layer.confirm('成功',{icon: 1, title:'提示'},function(){ 
			    		layer.closeAll();
			    		window.location.href="${res}/admin/login/toApply.html";
		    		})
		    		
		    	}
		    	
		    }
		    	

		})
		
});
$("#add2").click(function(){

	 $.ajax({
		type: 'post',
	    url: '${res}/admin/login/apply.html',
	    dataType:'json',
	    contentType : "application/x-www-form-urlencoded",
	    data: $("#mainForm2").serialize(),

	    success: function(data) {
	    	if(data.flag=="1"){
	    		layer.confirm('成功',{icon: 1, title:'提示'},function(){ 
		    		layer.closeAll();
		    		window.location.href="${res}/admin/login/toApply.html";
	    		})
	    		
	    	}
	    	
	    }
	    	

	})
	
});

$("#add3").click(function(){

	 $.ajax({
		type: 'post',
	    url: '${res}/admin/login/apply.html',
	    dataType:'json',
	    contentType : "application/x-www-form-urlencoded",
	    data: $("#mainForm3").serialize(),

	    success: function(data) {
	    	if(data.flag=="1"){
	    		layer.confirm('成功',{icon: 1, title:'提示'},function(){ 
		    		layer.closeAll();
		    		window.location.href="${res}/admin/login/toApply.html";
	    		})
	    		
	    	}
	    	
	    }
	    	

	})
	

	
});

$("#addFeedBack").click(function(){
	layer.confirm('你确定提交吗？',{icon: 3, title:'提示'},function(){ 
		layer.closeAll();
	$.ajax({
		type: 'post',
	    url: '${res}/admin/login/feedBack.html',
	    dataType:'json',
	    contentType : "application/x-www-form-urlencoded",
	    data: $("#feedBack").serialize(),

	    success: function(data) {
	    	if(data.flag=="1"){
	    		layer.confirm('成功',{icon: 1, title:'提示'},function(){ 
		    		layer.closeAll();
		    		window.location.href="${res}/admin/login/toApply.html";
	    		})
	    	}
	    	
	    }
	    	

	})
	})	
})
  
    $(function(){
        //弹窗登录
        var tc_left = ($(window).width()-$(".tc_login_wrap").width())/2;
        var tc_top = ($(window).height()-$(".tc_login_wrap").height())/2;
        $("#tclogin").click(function(){
           $(".mask_wrap_login").show();
           $(".tc_login_wrap").show();
           $(".tc_login_wrap").css("left",tc_left+'px').css("top",(tc_top+80) + 'px');
        });
        $(".closex").click(function(){
           $(".mask_wrap_login").hide();
           $(".tc_login_wrap").hide();
        });
      });
      
      $("#submit").click(function(){
    	  if($('#userName').val()!=""&&$('#passWord').val()!=""){
    	  $.ajax({
              url:'${res}/admin/login/indexLogin.html',
              type:'post',
              dataType:'json',
              contentType : "application/x-www-form-urlencoded",
             data: {
                userName: $('#userName').val(),
                passWord: $('#passWord').val(),
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
                		window.location.href="${res}/admin/login/toApply.html";
                		
                	}else{
                		layer.confirm(data.msg,{icon: 3, title:'提示'},function(){ 
        		    		layer.closeAll();
        		    		window.location.href="${res}/main/index.html";
        	    		})
                	}
                },1000);  
            }
    	  })
      }else{
		  layer.confirm('登录名或密码为空',{icon: 3, title:'提示'},function(){ 
	    		layer.closeAll();
	    		window.location.href="${res}/main/index.html";
  		})
	  }
      })
  
</script>

</body>
</html>

 