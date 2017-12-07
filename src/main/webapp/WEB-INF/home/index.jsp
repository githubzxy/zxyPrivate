<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亚卓数字教学中心</title>
<meta name="keywords" content="亚卓教育、锦岸文化" />
<meta name="description" content=" “亚卓教育”是为中国基础教育和职业教育领域提供领先在线教学资源和教育技术的国有参股企业，拥有国家高新技术企业资质和国家级高新区“上规入库”企业评级，也是国内唯一在线教育机构与教育部主管和指导的《中国教育信息化》杂志社、《基础教育参考》杂志构建战略合作关系，共同研发在线课程资源产品的公司。author:亚卓教育技术部 " />
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/front/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/layout.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/front/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${res}/front/js/global.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<!--/js-->
</head>
<body>
<!--top-->
<input type="hidden" class="time" value="${msg}" />
<div class="div100 top index_top">
  <div class="w1200 header">
     <h1 class="logo fl"><a href="#"><img src="<%=url %>/${sessionScope.schoolSession.logo}" alt="亚卓教育" /></a></h1>
     <div class="navwrap fr">
       <ul class="nav fl">
          <li class="on"><a href="${res}" title="首页">首页</a></li>
          <li><a href="${res}/main/category.html" title="在线学习">在线学习</a></li>
          <c:choose>
          	<c:when test="${sessionScope.baseUser == null}">
          		<li><a onClick="javascript:$('#tclogin').click();" title="课程建设">课程建设</a></li>
	          <li><a onClick="javascript:$('#tclogin').click();" title="教学资源">教学资源</a></li>
	          <li><a onClick="javascript:$('#tclogin').click();" title="教学管理">教学管理</a></li>
          </c:when>
          	<c:when test="${sessionScope.baseUser.roleCode == 'student'}">
          	 <!--  <li><a href="javascript:layer.alert('没有权限');" title="课程建设">课程建设</a></li>
	          <li><a href="javascript:layer.alert('没有权限');" title="教学资源">教学资源</a></li>
	          <li><a href="javascript:layer.alert('没有权限');" title="教务管理">教务管理</a></li> -->
	           <li><a href="${res}/study/personal.html" title="个人中心">个人中心</a></li>
          	</c:when>
          	<c:otherwise>
          	<%-- <li><a href="${res}/admin/index.html?rels=course" title="课程建设">课程建设</a></li> --%>
	          <li><a href="${res}/admin/index.html?rels=course" title="课程建设">课程建设</a></li>
	          <li><a href="${res}/admin/index.html?rels=resource" title="教学资源">教学资源</a></li>
	          <li><a href="${res}/admin/index.html?rels=teacher" title="教学管理">教学管理</a></li>
          	</c:otherwise>
          </c:choose>
       </ul>
       
       <div class="fr search">
       <form action="${res}/course/open/findIndexOpencourse.html">
       	 <input type="hidden" name="pageSize" value="6"  class="input-text"/>
         <input type="text" name="keywords" placeholder="请输入关键字"  class="input-text"/>
         <input type="submit" class="s submit" value="" />
         </form>
       </div>
     </div>
  </div>
</div>
<!--top-->
<!--首页banner-->
<div class="full_banner">
    <div class="w1200 mask_wrap">
      <div class="mask">
       <div class="maskwrap">
         <div class="appdwon">
            <!-- <a href="#" class="ios">iOS 版本&nbsp;&nbsp;&nbsp;下载</a>
            <a href="#" class="android">Android版&nbsp;下载</a> -->
            <img alt="" src="${res}/front/images/QRcode.png">
            <p>扫描二维码关注亚卓微信公众号</p>
         </div>
         <div class="login_a">
         <c:choose>
            	<c:when test="${sessionScope.baseUser!=null}">
		            	<h2>${sessionScope.baseUser.name}</h2>
		            	<c:choose>
		            		<c:when test="${sessionScope.baseUser.roleCode == 'student'}">
		            			<a href="${res}/study/personal.html"  class="btn" >个人中心</a>
		            		</c:when>
			            	<c:otherwise>
			            		<a href="${res}/admin/index.html?rels=set"  class="btn" >后台管理</a>
			            	</c:otherwise>
		            	</c:choose>
		            	<a href="${res}/admin/login/logout.html">退出</a>
            	</c:when>
            	<c:otherwise>
            		<h2>账号登录</h2>
          			<a href="javascript:void();" id="tclogin" class="btn centerBtn" >用户登录</a>
           			<%-- <a href="${res}/admin/login/toApply.html">申请账号</a> --%>
          		</c:otherwise>
          </c:choose>
         </div>
       </div>
     </div>
    </div>
   <div class="bd">
      <ul>
       <c:forEach items = "${requestScope.bannerPos}" var = "bannerPo" varStatus="status">
      	<li style="width:100%;"><a href="javascript:void(0)">
      	<img style="width:100%;" src="<%=url %>/${bannerPo.bannerUrl}" alt="" />
      	</a></li>
      </c:forEach> 
        <%-- <li style="background:#0e3c56"><a href="javascript:void(0)"><img src="${res}/front/images/test/banner1.png" alt="" /></a></li>
        <li style="background:#f7e8ba"><a href="javascript:void(0)"><img src="${res}/front/images/test/banner3.png" alt="" /></a></li> 
         --%>
      </ul>
    </div>
<div class="hd"><ul></ul></div>
</div>
<!--首页banner end-->
<!-- 2017 1 .12 公告 -->
<div class="w1200 yazhuo_index_scroll" >
 <ul id="roll1">
  <c:forEach items = "${requestScope.indexNotices}" var = "list" varStatus="status">
   <li>
     <a href="${res}/admin/notice/detail.html?noticeId=${list.noticeId}" target="_blank" title="${list.title}">${list.title}
      <span class="time"><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${list.createDate}" /></span>
      </a>
   </li>
   </c:forEach>
 </ul>
</div>
<!-- 2017 1 .12 公告 end -->
<!--精品课程-->
<div class="w1200 excellent w1220">
   <h2 class="h2">精品课程</h2>
  <c:forEach items="${parentTypes}" var="parentType" varStatus="status">
   <div class="course_wrap">
      <div class="big_img">
      <c:if test="${((status.index+1)%2)>0}"><img src="${res}/front/images/big_red.png" alt="" /></c:if>
      <c:if test="${((status.index+1)%2)==0}"><img src="${res}/front/images/big_blue.png" alt="" /></c:if>
        <div class="cousre_more_info">
          <p class="course_name">${parentType.typeName}</p>
       </div>
        <a href="${res}/main/category.html?courseTypeId=${parentType.courseTypeId}" target="_blank" class="more">更多课程>></a>
      </div><!--大图-->
      <div class="course_list">
      <c:forEach items="${courseTypes}" var="courseType">
       <c:if test="${courseType.parentId==parentType.courseTypeId}">
         <a href="${res}/main/category.html?courseTypeId=${courseType.courseTypeId}" class="course_item">
           <c:if test="${courseType.url != null}">
           	<img src="<%=url %>/${courseType.url}" alt="" />
           </c:if>
           <c:if test="${courseType.url == null}">
           	<img src="/front/images/defult.png" alt="" />
           </c:if>
           <div class="shadow">
             <div class="kcifon">
               <span class="kctitle">${courseType.typeName}</span>
              </div>
             <div class="kcifon">

              <span class="kctime">${courseType.classhour}学时</span>
            <!--   <span class="kcview">345次观看</span> -->
             </div>
           </div>
         </a><!--单条数据-->
         </c:if>
         </c:forEach>
      </div>
   </div>
   </c:forEach>
  
</div>
<!--精品课程 end-->
<div class="index_bg">
<!--每周一测-->
<%-- <div class="w1200 weektest">
   <h2 class="h2">每周一测</h2>
   <a href="#" title="心理健康每周一测" class="testpic">
      <img src="${res}/front/images/test/part_2_1p.png">
      <div class="shadow1">
          <div class="kcifon1">
           <span class="kcname1">心理健康每周一测</span>
           <span class="starttest">开始测试>></span>
          </div>
      </div>
    </a>
   <a href="#" title="职业生涯规划每周一测" class="testpic">
      <img src="${res}/front/images/test/part_2_2p.png">
      <div class="shadow1">
          <div class="kcifon1">
           <span class="kcname1">职业生涯规划每周一测</span>
           <span class="starttest">开始测试>></span>
          </div>
      </div>
   </a>
</div> --%>
<!--每周一测 end-->
<div class="clear"></div>
<!--亚卓名师-->
<div class="w1200 mteacher">
  <h2 class="h2">专家团队</h2>
  <ul class="teacherlist">
  <c:forEach items = "${requestScope.indexLecturers}" var = "list" varStatus="status">
  	<li>
       <a href="#">
       <c:choose>
       		<c:when test="${list.avatar != null&&list.avatar != ''}">
	       		<img src="<%=url %>/${list.avatar}" alt="" class="a-img" />
       		</c:when>
       		<c:otherwise>
	       		<img src="${res}/front/images/teacherAvatar.png" alt="" class="a-img"/>
       		</c:otherwise>
       </c:choose>
       </a>
       <div class="tname na">
  				${list.name }
          <span>${list.position}</span>
       </div>
       <div class="teacher-nfo">
          <p>${list.info}</p>
       </div>
    </li><!--单条数据-->
  </c:forEach>

  </ul>
   <div class="btn_all clearfix"><a href="${res}/admin/lecturer/findMoreLecturerInfo.html" target="_blank">全部专家</a></div>
</div>
<!--亚卓名师 end-->
</div>
<!--footer-->
<%@ include file="/WEB-INF/home/common.jsp" %>  
<!--footer-->

<script type="text/javascript">
  $(function(){
    //登录弹窗
    var tc_left = ($(window).width()-$(".tc_login_wrap").width())/2;
    var tc_top = ($(window).height()-$(".tc_login_wrap").height())/2;
    $("#tclogin").click(function(){
       $(".mask_wrap_login").show();
       $(".tc_login_wrap").show();
       $(".tc_login_wrap").css("left",tc_left+'px').css("top",(tc_top+80) + 'px');
       function keyLogin(){
    		  if (event.keyCode==13)   //回车键的键值为13
    			  userLogin();  //调用登录按钮的登录事件
    		}
    });
    $(".closex").click(function(){
       $(".mask_wrap_login").hide();
       $(".tc_login_wrap").hide();
    });
    
  });
  
  function checkNum(num) {
	  var numrel="";
	  if((num&1)===0){
	   numrel="这是一个偶数";
	  }else{
	   numrel="这是一个奇数";
	  }
	  return numrel;
	 }

  function userLogin(){
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

	    		    		window.location.href="${res}/main/index.html";
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
  }
 
  
</script>
<script type="text/javascript">
(function(A){
   function _ROLL(obj){
      this.ele = document.getElementById(obj);
   this.interval = false;
   this.currentNode = 0;
   this.passNode = 0;
   this.speed = 100;
   this.childs = _childs(this.ele);
   this.childHeight = parseInt(_style(this.childs[0])['height']);
       addEvent(this.ele,'mouseover',function(){
                                   window._loveYR.pause();
           });
    addEvent(this.ele,'mouseout',function(){
                                   window._loveYR.start(_loveYR.speed);
           });
   }
   function _style(obj){
     return obj.currentStyle || document.defaultView.getComputedStyle(obj,null);
   }
   function _childs(obj){
   var childs = [];
   for(var i=0;i<obj.childNodes.length;i++){
   var _this = obj.childNodes[i];
   if(_this.nodeType===1){
   childs.push(_this);
   }
   }   
   return childs;
   }
 function addEvent(elem,evt,func){
    if(-[1,]){
     elem.addEventListener(evt,func,false);   
    }else{
     elem.attachEvent('on'+evt,func);
    };
 }
 function innerest(elem){
      var c = elem;
   while(c.childNodes.item(0).nodeType==1){
       c = c.childNodes.item(0);
   }
   return c;
 }
   _ROLL.prototype = {
      start:function(s){
           var _this = this;
     _this.speed = s || 100;
        _this.interval = setInterval(function(){
          _this.ele.scrollTop += 1;
       _this.passNode++;
       if(_this.passNode%_this.childHeight==0){
          var o = _this.childs[_this.currentNode] || _this.childs[0];
          _this.currentNode<(_this.childs.length-1)?_this.currentNode++:_this.currentNode=0;
          _this.passNode = 0;
          _this.ele.scrollTop = 0;
          _this.ele.appendChild(o);
       }
        },_this.speed);
   },
   pause:function(){
   var _this = this;
      clearInterval(_this.interval);
   }
   }
    A.marqueen = function(obj){A._loveYR = new _ROLL(obj); return A._loveYR;}
})(window);
marqueen('roll1').start(100/*速度默认100*/);

</script>
<!--footer end-->
</body>
</html>

 