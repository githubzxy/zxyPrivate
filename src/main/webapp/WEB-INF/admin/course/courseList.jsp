<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css">
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript">
    $(document).ready(function(){
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
       <li><a href="#">课程建设</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="add.html" target="rightFrame"><span><img src="${res }/images/t01.png"/></span>新建课程</a></li>
            <li class="click1" onclick="delAll()"><span><img src="${res }/images/t03.png"/></span>批量删除</li>
       </ul>
    </div>
    <ul class="prosearch">
           <li>
               <i>课程名称:</i><a><input name="name" class="input-text code" placeholder="课程名关键字" type="text" value=""/></a>
                <a><input name="" class="search" value="查询" type="button"/></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>课程列表</span></div>

         <table class="tablelist">
          <thead>
              <tr>
                    <th><input name="ur_allSelect" type="checkbox" value="" id="allSelect"/></th>
                    <th>编&nbsp;&nbsp;号<i class="sort"><img src="${res }/images/px.gif"/></i></th>
                    <th>课程名称</th>
                    <th>课&nbsp;&nbsp;时</th>
                    <th>创建者</th>
                    <th>更新时间</th>
                    <th width="226" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody  id="courseStr"> 
            <c:forEach  items="${courseList }" var="course" varStatus="status">
                <tr>
                    <td><input name="ur_checkbox" value="${course.courseId }" type="checkbox"/></td>
                    <td>${status.index+1 +(page.pageNum-1) * page.pageSize}</td>
                    <td>${course.courseName }</td>
                    <td>${course.classhour }</td>
                    <td>${course.createUser.name }</td>
                    <td><fmt:formatDate value="${course.updateDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                       <span class="pl15">
                           <a href="toEditCourse.html?courseId=${course.courseId }"><input value="编辑" class="ext_btn ext_btn_submit mr20" type="button"/></a>
                           <input class="ext_btn ext_btn_error" value="删除" type="button" onclick="delCourse(${course.courseId })"/>
                       </span> 
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <!--分页-->
    <div id="pageToolbar">
    </div>
    <!--分页 end-->
    <input name="totalpage" type="hidden" class="totalpage" value="${page.totalPage}"/>
     </div>
         <!--修改信息的弹窗 其他弹窗提示也类似-->
    <div class="tip">
       <div class="tiptop"><span>提示信息</span><a></a></div> 
       <div class="tipinfo">
            <span><img src="${res }/images/ticon.png" /></span>
            <div class="tipright">
              <p>是否确认删除该条记录 ？</p>
              <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>
         <div class="tipbtn">
            <input name="" type="button"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
        </div>   
    </div>
     <!--修改信息的弹窗 其他弹窗提示也类似 我只写一个-->
    </div>
  <!--遮罩层-->
 <div class="mask"></div>
 <!--遮罩层 end-->
</body>
<script type="text/javascript">

var  $courseStr=$("#courseStr");
//分页方法
function PageTmp(name,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/course/list.html",
		  processData:true,
		  data:{"keyWords":name,'pageSize':size,'pageNum':page},
		  dataType: "json",
		  success: function(data){
			  if(typeof(size) == "undefined"){
				  var htmlStr = "";
				  $courseStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(name,size,page);
				  }}); 
			  }
			HtmlTmp(data.page.list,htmlStr,data.page.startIndex);
		  },
		  error:function(e){
			  alert("错误");
		  }
		 });
};

//列表拼接方法
function HtmlTmp(datas,htmlStr,startIndex){
	 $courseStr.empty();
	$.each(datas, function (index, course) {
			htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='"+course.courseId+"' type='checkbox' id="+course.courseId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+course.courseName+"</td>";
			htmlStr+="<td>"+course.classhour+"</td>";
			htmlStr+="<td>"+course.createUser.name+"</td>";
			var updateDt = new Date(course.updateDt);
			htmlStr+="<td>"+updateDt.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+="<a href='${res}/admin/course/toEditCourse.html?courseId="+course.courseId+"' class='ext_btn ext_btn_submit mr10'>编辑</a> ";
			htmlStr+="<input class='ext_btn ext_btn_error mr10' value='删除'  onclick='delCourse("+course.courseId+");' type='button'> ";
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
     });
		  $courseStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
		var name= $("input[name='name']").val();
		PageTmp(name);
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});
 
 function delCourse(courseId){
	  layer.confirm('你确定删除选中的课程吗？',{icon: 3, title:'提示'},function(){
	  $.ajax({
			url : '${res}/admin/course/delCourse.html',
			type: "POST",
			data : {courseId:courseId},
			success:function(data){
				location.reload();
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
		});
	  });
 }
 
//删除全部选中的行数
 function delAll(){
   //设置一个空数组，存储被删除的行数
   var nullArr = [];
   //取得所有name值为ur_checkbox的input:checkbox存入数组
   var selectBoxNum = $("[name='ur_checkbox']");
   //设置一个中间变量判断input:checkbox全部没有选中，如果tmp=0则都未选中  
   var tmp = 0;
   var courseIds= [];

   //循环name值为ur_checkbox的input:checkbox,如果input:checkbox有选中,tmp++
   for (var i = 0; i < selectBoxNum.length; i++) {
     if (selectBoxNum[i].checked == true) {
       tmp++;
       courseIds.push(selectBoxNum.eq(i).val());  
     };
   };

   //当tmp=0时，input:checkbox全部未被选中，弹出弹框；否则执行删除操作
   if (tmp == 0) {
     //当tmp=0时，弹出提示框
     layer.open({
       time: 2000, //2s后自动关闭
       title: '提示' , 
       icon:2,  
       content:'请选择你要删除的课程！' 
     });
   } else {
     //弹出确认框
      layer.confirm('你确定删除全部选中的资源吗？',{icon: 3, title:'提示'},function(){
        layer.closeAll();
    
        //点击确认按钮。执行操作
        for (var i = 0; i < selectBoxNum.length; i++) {
           if(selectBoxNum[i].checked == true){
         	//将被选中的行数，加入空数组
               nullArr.splice(nullArr.length,0,i);
           };
         };
           $.ajax({
         	    type:'POST',
         		  url:"delAllCourse.html",
         		  data:{courseIds:courseIds},
         		  success:function(data){
 					  if(data==1){
 						  location.reload();
 					  }else{
 						  layer.alert("删除失败",{icon: 2, title:'提示'});
 					  }
         		  	}
         		  });
       });
   };
 }
 </script>
</html>
