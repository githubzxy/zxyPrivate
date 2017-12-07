<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>查看学生信息</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
</head>
<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
     <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">查看学生信息</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>查看学生信息</span></div>
     <div class="padding5">
         
         <table class="formlist" width="100%" align="center">
              <tr>
                <td width="123"><span>姓名：</span></td>
                <td><span>${stuDetail.studentForm.name}</span></td>
                <td><span>学号：</span></td>
                <td colSpan="2"><span>${stuDetail.studentForm.number}</span></td>
                <td  width="153"><span>性别：</span></td>
                <td width="165"><span><c:if test="${stuDetail.studentForm.gender==1}">男</c:if><c:if test="${stuDetail.studentForm.gender==2}">女</c:if></span></td>
                <td rowSpan="6" width="200" align="middle"><img src="${res}/images/test/header.jpg" alt="照片" align="AbsMiddle" border="0" height="184" width="172" /><br>
                  <span><b><font color="Red">建议照片大小不超过60k<br>照片像素（宽×高）为：184×172<br>照片格式为BMP/JPG/JPEG</font></b></span></td>
              </tr>
              <tr>
                <TD><span>民族：</span></TD>
                <TD><span>汉</span></TD>
                <TD><span>籍贯：</span></TD>
                <TD colSpan="2"><span>四川.自贡</span></TD>
                <td width="183"><span>手机号码：</span></td>
                <td width="165"><span>${stuDetail.studentForm.phone}</span></td>
              </tr>
              <tr>
                <TD><span>出生日期：</span></TD>
                <TD>
                  <P></P>
                  <P><span>${stuDetail.studentForm.birthday}</span></P>
                </TD>
                <TD><span>电子邮箱：</span></TD>
                <TD colSpan="2"><span>${stuDetail.studentForm.email}</span></TD>
                <td width="183"><span>政治面貌：</span></td>
                <td width="165"><span>中共党员</span></td>
              </tr>
              <tr>
                <TD><span>身份证号：</span></TD>
                <TD><span>${stuDetail.studentForm.idCard}</span></TD>
                <TD><span>入学日期：</span></TD>
                <TD colSpan="2"><span>2009-09-05</span></TD>
                <td width="183"><span>家庭电话：</span></td>
                <td width="165"><span>13437097345765</span></td>
              </tr>
              <tr>
                <TD><span>母亲姓名：</span></TD>
                <TD><span></span></TD>
                <TD><span>父亲姓名：</span></TD>
                <TD colSpan="2"><span></span></TD>
                <td  width="183"><span>父母电话：</span></td>
                <td width="165"><span></span></td>
              </tr>
              <tr>
                <TD><span>学院：</span></TD>
                <TD><span>计算机学院</span></TD>
                <TD><span>专业：</span></TD>
                <TD colSpan="2"><span>计算机科学与技术</span></TD>
                <TD width="183"><span>学制：</span></TD>
                <TD width="165"><span>4</span></TD>
              </tr>
            
              <tr>
                <TD><span>学籍状态：</span></TD>
                <TD><span>毕业</span></TD>
                <TD><span>年级：</span></TD>
                <td colSpan="2"><span>${stuDetail.classForm.gradeName}</span></td>
                <TD><span>班级：</span></TD>
                <TD><span>${stuDetail.classForm.name}</span></TD>
                <TD><span><input name="File1" id="File1" class="text_nor" onclick="return check();" size="8" type="file"></span></TD>
              </tr>
              <tr>
                <TD><span>毕业中学：</span></TD>
                <TD><span>四川省自贡中学</span></TD>
                <TD><span>家庭住址：</span></TD>
                <TD colSpan="7"><span>四川省自贡市xx街道 xx号</span></TD>
              </tr>
              <tr>
                <td><span>备注：</span></td>
                <td colspan="9" height="60"><span>这个娃儿在校期间不认真读书，竟然跑到隔壁那个卫生学校泡护士妹妹！真担心这个娃儿毕不到业！这个娃儿在校期间不认真读书，竟然跑到隔壁那个卫生学校泡护士妹妹！真担心这个娃儿毕不到业！这个娃儿在校期间不认真读书，竟然跑到隔壁那个卫生学校泡护士妹妹！真担心这个娃儿毕不到业！</span></td>
              </tr>            
        </table>
        <div class="buttomclose"><input name="" class="scbtn" value="关闭" type="button"></div>

      
     </div>
  </div>
</div>
</body>
</html>
