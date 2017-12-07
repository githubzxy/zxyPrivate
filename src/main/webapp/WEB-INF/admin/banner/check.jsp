<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/admin/layouts/comm.jsp" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看轮播图</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link href="${res}/front/css/fileUploadLogo.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/front/css/layout.css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script src="${res}/plugin/layer/laydate/laydate.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/uploadPreview.js"></script><!--图片上传预览 -->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
     <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">查看轮播图</a></li>
    </ul>
</div>
 <div class="full_banner">
     <div class="bd" onmouseover="">
      <ul>
      	<li style="width:100%"><a href="javascript:void(0)">
      	<img  style="width:100%" src="<%=url%>/${bannerPo.bannerUrl}"  title="${bannerPo.title}" />
      	</a></li>
      </ul>
    </div>
</div>

<script type="text/javascript" src="${res}/js/ajaxfileupload.js"></script>
<script type="text/css">

</script>
<script type="text/javascript">

</script>


</body>
</html>
