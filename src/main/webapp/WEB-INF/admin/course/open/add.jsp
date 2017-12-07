<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑开课信息</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/plugin/layer/laydate/laydate.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">编辑开课信息</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="formbody">
      <div class="formtitle"><span>编辑开课信息</span></div>
      <div class="padding5">
       <form class="jqtransform"  id="mainForm" >
       <input type="hidden" name="baseCourseIds" value="${requestScope.baseCourseIds}"/>
       <input type="hidden" name="baseName" value="${requestSope.baseName}"/>
          <table class="form_table"  cellspacing="0" cellpadding="0" border="0">
            <tbody>
             <tr>
                <td class="td_right">开课方式：</td>
                <td>指定开课</td>
                <td width="400"></td>
              </tr>
              <tr>
                <td class="td_right">课程名称前缀：</td>
                <td><input type="text" name="courseName" class="input-text" size="40" datatype="*"  ><span class="pl15 gray">(批量开课时自动使用前缀＋原课程名称，可不填写)</span></td>
                <td width="400"></td>
              </tr>
               <tr>
                <td class="td_right">学校课程编号：</td>
                <td><input type="text" name="courseCode" class="input-text" size="40" datatype="*"  ><span class="pl15 gray">(可不填写)</span></td>
                <td width="400"></td>
              </tr>
               <tr>
                <td class="td_right">课程学分：</td>
                <td><input type="text" name="studyScore" class="input-text" size="10" datatype="*"  ><span class="pl15 f00">*</span></td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;"></span></td>
              </tr>
               <tr>
                <td class="td_right">通过分数：</td>
                <td><input type="text" name="passScore" class="input-text" size="10" datatype="*"  ><span class="pl15 f00">*</span></td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;"></span></td>
              </tr>
               <tr>
                <td class="td_right">视频观看比率：</td>
                <td><input type="text" name="videoSeePercent" class="input-text" size="10" >&nbsp;&nbsp;%<span class="pl15 f00">*(参加考试前，需要完成的视频观看百分比)</span></td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;"></span></td>
              </tr>
               <tr>
                <td class="td_right">考核比例：视频</td>
                <td><input type="checkbox" value="1" name="containVideo">视频比例&nbsp;&nbsp;<input type="text" name="videoPercent" class="input-text" size="5" >&nbsp;&nbsp;%</td>
                <td width="400"></td>
              </tr>
              <tr>
                <td class="td_right">考核比例：作业</td>
                <td><input type="checkbox" value="1" name="containTask">作业比例&nbsp;&nbsp;<input type="text" name="taskPercent" class="input-text" size="5" >&nbsp;&nbsp;%</td>
                <td width="400"></td>
              </tr>
                <tr>
                <td class="td_right">考核比例：考试</td>
                <td><input type="checkbox" value="1" name = "containExamine">考试比例&nbsp;&nbsp;<input type="text" name="examinPercent" class="input-text" size="5" >&nbsp;&nbsp;%</td>
                <td width="400"></td>
              </tr>
              <tr>
                <td class="td_right">考核比例：讨论</td>
                <td><input type="checkbox" value="1" name = "containDiscuss">讨论比例&nbsp;&nbsp;<input type="text" name="discussPercent" class="input-text" size="5" >&nbsp;&nbsp;%&nbsp;&nbsp;&nbsp;发布讨论次数&nbsp;&nbsp;<input type="text" name="discussCount" class="input-text" size="5" ></td>
                <td width="400"></td>
              </tr>
              <tr>
                <td class="td_right">是否允许选课：</td>
                <td>
                    <select name="isAllowSelect" class="select" > 
                      <option>----是否允许选课----</option> 
                      <option value="1">允许选课</option>
                      <option value = "0">不允许选课</option>
                    </select>   <span class="pl15 f00">*</span>                               
                </td>
                <td width="400"></td><span class="Validform_checktip" style="color:#f00;"></span></td>
              </tr>
               <tr>
                <td class="td_right">学生选课时间：</td>
                <td><input type="text" name="selectStartDate" class="input-text laydate-icon" size="20" datatype="*" id="stuSelectStartDate"  >--<input type="text" name="selectEndDate" class="input-text laydate-icon" size="20" datatype="*"  id="stuSelectEndDate" onchange="alert(1)"><span class="pl15 f00">*</span></td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;"></span></td>
              </tr>
               <tr>
                <td class="td_right">课程开放时间：</td>
                <td><input type="text" name="studyStartDate" class="input-text laydate-icon" size="20" datatype="*" id="studyStartDate" >--<input type="text" name="studyEndDate" class="input-text laydate-icon" size="20" datatype="*"  id="studyEndDate"><span class="pl15 f00">*</span></td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;"></span></td>
              </tr>
               <tr>
                <td class="td_right">考试开放时间：</td>
                <td><input type="text" name="examineStartDate" id="examineStartDate"  class="input-text laydate-icon" size="20" datatype="*"  >--<input type="text" name="examineEndDate" id="examineEndDate" class="input-text laydate-icon" size="20" datatype="*"  ><span class="pl15 f00">*</span></td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;"></span></td>
              </tr>
              <tr>
                <td class="td_right">预定结课日期：</td>
                <td><input type="text" name="finishDate" id="finishDate" class="input-text laydate-icon" size="20" datatype="*"  ><span class="pl15 f00">*</span></td>
                <td width="400"><span class="Validform_checktip" style="color:#f00;"></span></td>
              </tr>
              <tr>
               <td class="td_right">&nbsp;</td>
               <td>
                <input name="button" id ="add" class="ext_btn ext_btn_submit" value="确认开课" type="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <!-- <a href="default.html" class="ext_btn ext_btn_success">取消开课</a> -->
                <input class="ext_btn ext_btn_submit" value="取消开课" type="button" onclick="window.location.reload()">
                 
                </td>   
                <td width="400"></td>
              </tr> 
            </tbody>
          </table>
          </form>
      </div> 
     </div>
<script type="text/javascript">


  $(function(){
     //layer日历插件
      laydate.skin('molv');
      laydate({
      elem: '#stuSelectStartDate', 
      format: 'YYYY/MM/DD'
      });
      laydate({
          elem: '#stuSelectEndDate', 
          format: 'YYYY/MM/DD'
          }); 
      laydate({
          elem: '#studyStartDate', 
          format: 'YYYY/MM/DD'
          }); 
      laydate({
          elem: '#studyEndDate', 
          format: 'YYYY/MM/DD'
          }); 
      laydate({
          elem: '#examineStartDate', 
          format: 'YYYY/MM/DD'
          }); 
      laydate({
          elem: '#examineEndDate', 
          format: 'YYYY/MM/DD'
          });
      laydate({
              elem: '#finishDate', 
              format: 'YYYY/MM/DD'
              });

      
      
       
		//提交表单
		  $("#add").click(function(){ 			
			 var stuSelectStartDate=$("#stuSelectStartDate").val();//1
			 var stuSelectEndDate=$("#stuSelectEndDate").val();//2
			 var studyStartDate=$("#studyStartDate").val();//3
			 var studyEndDate=$("#studyEndDate").val();//4
			 var examineStartDate=$("#examineStartDate").val();//5
			 var examineEndDate=$("#examineEndDate").val();//6
			 var finishDate=$("#finishDate").val();//7
			 if(stuSelectEndDate<stuSelectStartDate ){
				 alert("学生选课结束时间不能早于学生选课开始时间")
			 }else if(studyEndDate<studyStartDate ){
				 alert("课程开放结束时间不能早于课程开放开始时间")
			 }else if(examineEndDate<examineStartDate ){
				 alert("考试开放结束时间不能早于考试开放开始时间")
			 }else if(studyStartDate<stuSelectEndDate ){
				 alert("课程开放开始时间不能早于学生选课结束时间")
			 }else if(examineStartDate<studyStartDate ){
				 alert("考试开放开始时间不能早于课程开放开始时间")
			 }else if(finishDate<examineEndDate ){
				 alert("预定结课日期不能早于考试开放结束时间")
			 }else{
				 $.ajax({						
					    url: '${res}/course/open/add.html',
					    type: 'post',
					    dataType:'json',
					    contentType : "application/x-www-form-urlencoded", 
					    data: $("#mainForm").serialize(),
					    success: function(data) {
					    	if(data.flag=="1"){
					    		window.location.href = "${res}/course/open/list.html";					    		
					    	}
					    },
					    error:function(e){
					    	//alert("error");
					    	alert("请完善信息")
					    }
					})	
			 }
			 
			 
			
                   
		}); 
		
		
		
		
		       

  })
  
  
  
  
</script>
</body>
</html>