<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看教师信息</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/uploadify/jquery.uploadify.min.js"></script>
<script src="${res}/plugin/layer/laydate/laydate.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/admin/default.html">首页</a></li>
       <li><a href="#">查看教师信息</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>查看教师信息</span></div>
     <div class="padding5">
       
         <table class="formlist" width="100%" align="center">
              <tr>
                <td width="123"><span>教师姓名：</span></td>
                <td><span>${users.name}</span></td>
                <td><span>工号：</span></td>
                <td colSpan="2"><span>${users.number}</span></td>
                <td  width="153"><span>性别：</span></td>
                <td width="165"><span><c:if test="${users.gender==2}">女</c:if>
                <c:if test="${users.gender==1}">男</c:if>
                </span></td>
                <td rowSpan="6" width="200" align="middle"><img src="${res}/images/test/header.jpg" alt="照片" align="AbsMiddle" border="0" height="184" width="172" /><br>
                  <span><b><font color="Red">建议照片大小不超过60k<br>照片像素（宽×高）为：184×172<br>照片格式为BMP/JPG/JPEG</font></b></span></td>
              </tr>
              <tr>
                <TD><span>职称：</span></TD>
                <TD><span>${users.teacherPo.position}</span></TD>
                <TD><span>籍贯：</span></TD>
                <TD colSpan="2"><span>四川.自贡</span></TD>
                <td width="183"><span>QQ号码：</span></td>
                <td width="165"><span>312010483</span></td>
              </tr>
              <tr>
                <TD><span>出生日期：</span></TD>
                <TD>
                  <P></P>
                  <P><span>${users.birthday}</span></P>
                </TD>
                <TD><span>电子邮箱：</span></TD>
                <TD colSpan="2"><span>${users.email}</span></TD>
                <td width="183"><span>政治面貌：</span></td>
                <td width="165"><span>中共党员</span></td>
              </tr>
              <tr>
                <TD><span>身份证号：</span></TD>
                <TD><span>${users.idCard}</span></TD>
                <TD><span>登陆账号：</span></TD>
                <TD colSpan="2"><span>teacher06@163.com</span></TD>
                <td width="183"><span>状态：</span></td>
                <td width="165"><span>在职</span></td>
              </tr>
              <tr>
                <TD><span>入职时间：</span></TD>
                <TD><span>2016年9月5日</span></TD>
                <TD><span>登陆密码：</span></TD>
                <TD colSpan="2"><span>${users.loginPo.loginPwd}</span></TD>
                <td  width="183"><span>移动电话：</span></td>
                <td width="165"><span>${users.mobile}</span></td>
              </tr>
              <tr>
                <TD><span>学院：</span></TD>
                <TD><span>计算机学院</span></TD>
                <TD><span>部门：</span></TD>
                <TD colSpan="2"><span>${users.teacherPo.department}</span></TD>
                <TD width="183"><span>是否有编制：</span></TD>
                <TD width="165"><span>是</span></TD>
              </tr>
              <tr>
                <TD><span>家庭电话：</span></TD>
                <TD><span>13436797233</span></TD>
                <TD><span>家庭住址：</span></TD>
                <TD colSpan="7"><span>四川省自贡市xx街道 xx号</span></TD>
              </tr>
              <tr>
                <td><span>备注：</span></td>
                <td colspan="9" height="60"><span>余教授上班期间勤勤恳恳！偶尔走下神，从来都不按时上下课，同学们非常喜欢他，主要是他长得帅！</span></td>
              </tr>            
        </table>
        <div class="buttomclose"><input name="" class="scbtn" value="关闭" type="button"></div>

      
     </div>
  </div>
</div>
<script type="text/javascript">

$(".scbtn").click(function(){
	window.location.href="${res}/admin/teacher/list.html";
})

</script>
</body>
</html>
