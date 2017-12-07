<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="nowDate" class="java.util.Date"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.nicescroll.js"></script>
<!--/js-->
</head>
<body>
<%@ include file="/WEB-INF/study/comm.jsp" %>
   <!--/vip_left-->
    
   <!-- 主体右边 -->
   <div class="mian_right minHeight500">
      <h2 class="main_right_h2">通知详情</h2>
      <div class="exam_ul_list">
         
         <div class="news">
              <h2 class="text-center">${requestScope.messageVo.title}</h2>
              <div class="other-xx">
                  <span>责任编辑：${requestScope.messageVo.fromUser.name}&nbsp;&nbsp;&nbsp;&nbsp;
                   发布时间：<fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${requestScope.messageVo.fromDate}" />&nbsp;&nbsp;&nbsp;&nbsp;
                   【字号：
                 <a href="javascript:on_font(17);">大</a>&nbsp;
                 <a href="javascript:on_font(15)">中</a>&nbsp;
                 <a href="javascript:on_font(13)">小</a>】</span>
                 <script>
                   function on_font(v) {
                      document.getElementById("coc").style.fontSize = v+"px";
                     }
                  </script>
              </div>
              <div class="news-content" id="coc">
                 <p style="line-hight:25px;">
             ${requestScope.messageVo.content}</p>
               
            <!--分享插件-->
            <div class="fl mt25" style="vertical-align:bottom;font-size:14px;padding-top:5px;">分享：</div>
            <div class="fl mt25" style="vertical-align:top;">
              <div class="bdsharebuttonbox"  >
              <a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a>
              <a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a>
              <a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a>
              <a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a>
              <a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a>
              <a href="#" class="bds_more" data-cmd="more"></a>
              </div>
            	<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"22"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
             </div>
             <!--分享插件 end-->
             <div class="clearfix"></div>
                 <!--上一条 下一条-->
                   <div class="nepr">
                   	<c:if test="${requestScope.messageVo.preMessage!=null}">
                    <a href="${res}/message/studentMessageDetails.html?messageId=${requestScope.messageVo.preMessage.messageId}">上一条：${requestScope.messageVo.preMessage.title}</a>
                   </c:if>
                   <c:if test="${requestScope.messageVo.nextMessage!=null}">
                    <a href="${res}/message/studentMessageDetails.html?messageId=${requestScope.messageVo.nextMessage.messageId}">下一条：${requestScope.messageVo.nextMessage.title}</a>
                    </c:if>
                  </div>
                 <!--上一条 下一条 end-->
              </div>
        </div>      
     
          
      </div>
   </div>
   <!-- 主体右边 end -->
    
</div>
<!--main-->

<!--footer-->
<!--footer-->
<%@ include file="/WEB-INF/study/comm_footer.jsp" %>
<!--footer-->
</body>
</html>

   
