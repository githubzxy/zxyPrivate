<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>试题列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<!-- <link href="plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" /> -->
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">试题列表</a></li>
    </ul>
</div>
<div class="rightinfo"> 
  <div class="tools">
        <ul class="toolbar">
            <li><a href="${res}/test/toAdd.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>新建试题</a></li>
            <li><a href="toInsertTest.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>批量导入试题</a></li> 
            <li onclick="delAll();"><span><img src="${res}/images/t03.png"></span>全部删除</li>
       </ul>
    </div>
    <ul class="prosearch">
           <li>
               <i>试题题目:</i><a><input name="name" value="" class="input-text" placeholder="题目关键字" type="text"></a>
               <i>课程名称:</i>
                <a>
                   <select name="" class="select" id = "course"> 
                      <option value="">-----请选择课程-----</option> 
                      <c:forEach items="${requestScope.courseNamePos}" var = "list">
                      	<option value="${list.courseId}" <c:if test="${courseId==list.courseId}">selected = "selected"</c:if>
                      	>${list.courseName}</option>
                      </c:forEach> 
                    </select>
                </a>
                <i>视频:</i>
                <a>
                   <select name="" class="select" id = "video"> 
                      <option value="${requestScope.videoId}">
	                      <c:if test="${videoId==null}">-----请选择课程视频-----</c:if>
	                      <c:if test="${videoId!=null}">${requestScope.testPos[0].video.name}</c:if>
                      </option>
                    </select>
                </a>
                <a><input name="" class="search" value="查询" type="button"></a>
           </li>
    </ul>  
  <div class="formbody">
     <div class="formtitle"><span>试题列表</span></div>
     <div class="padding5">
       <table class="tablelist">
          <thead>
              <tr>
                    <th><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>题&nbsp;&nbsp;目</th>
                    <th>类&nbsp;&nbsp;型</th>
                    <th>所属课程</th>
                    <th>所属视频</th>
                    <th>创建者</th>
                    <th>创建日期</th>
                    <th width="226" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="subjectStr"> 
          <%--   <c:forEach items ="${requestScope.testPos}" var = "list"   varStatus="status">
            	<tr>
                    <td><input name="ur_checkbox" value="${list.subjectId}" type="checkbox" ></td>
                    <td>${status.index+1+(page.pageNum-1)*page.pageSize}</td>
                    <td>${list.title}</td>
                    <td>${list.subjectTypePo.typeName}</td>
                    <td>${list.coursePo.courseName}</td>
                    <td>${list.video.name}</td>
                    <td>${list.userPo.name}</td>
                    <td><fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${list.createDate}" /></td>
                    
                    <td>
                       <span class="pl25 ml15">
                           <a href="${res}/test/toUpdate.html?subjectId=${list.subjectId}" class="ext_btn ext_btn_submit mr20">编辑</a>
                           <input class="ext_btn ext_btn_error mr20" value="删除" type="button" onclick="del(${list.subjectId})">
                           <input type="hidden" value="${list.subjectId}"></input> 
                       </span> 
                    </td>
                </tr>
            </c:forEach> --%>

      
              
            </tbody>
        </table>
        <!--分页-->
        <div class="pagin" id = "pageToolbar">
        </div>
        <!--分页 end-->

     </div>
  </div>
</div>

</body>

<script type="text/javascript">

   var courseId;
   var videoId;
   var keywords;
   $("#video").change(function(){
       videoId=$("#video option:selected").val();
   })
   $("#course").change(function(){
      courseId=$("#course option:selected").val();
      $.ajax({
		url:'${res}/video/findVideo.html',
	 	type:'post',
		dataType:'json',
		contentType : "application/x-www-form-urlencoded",
		data:{courseId:courseId},
		success : function(data){
			if(data.flag=="1"){
				$("#video").find("option").remove();
					$("#video").append('<option value=""> -----请选择课程视频-----</option>'); 
				    $.each(data.videoPos,function(key,val){
				         $("#video").append('<option value="' + val.videoId + '">' + val.name + '</option>');
				    })
								
			}
		}
	}) 
  });
                 
 var  $subjectStr=$("#subjectStr");
 //分页方法
 function PageTmp(name,courseId,videoId,size,page){
 	var htmlStr = "";
 	$.ajax({
 		  type: "POST",
 		  url: "${res}/test/list.html",
 		  processData:true,
 		  data:{"keyWords":name,'pageSize':size,'pageNum':page,'courseId':courseId,'videoId':videoId},
 		  dataType: "json",
 		  success: function(data){
 			  if((typeof(size) == "undefined")){
 				  var htmlStr = "";
 				  $subjectStr.empty();
 				  $("#pageToolbar").empty();
 				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
 					console.log(arguments); 
 					PageTmp(name,courseId,videoId,size,page);
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
 	 $subjectStr.empty();
 	$.each(datas, function (index, subject) {
 		//var date = subject.createDate;
 		//alert(subject.createDate/1000);
 			htmlStr+="<tr>";
 			htmlStr+="<td><input name='ur_checkbox' value='"+subject.subjectId+"' type='checkbox' id="+subject.subjectId+"></td>";
 			htmlStr+="<td>"+(++startIndex)+"</td>";
 			htmlStr+="<td>"+subject.title+"</td>";
 			htmlStr+="<td>"+subject.subjectTypePo.typeName+"</td>";
 			htmlStr+="<td>"+subject.coursePo.courseName+"</td>";
 			htmlStr+="<td>"+subject.video.name+"</td>";
 			htmlStr+="<td>"+subject.userPo.name+"</td>";
 			var createDate = new Date(subject.createDate);
 			htmlStr+="<td>"+createDate.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
 			htmlStr+="<td>";
 			htmlStr+="<span class='pl25 ml15'>";
 			htmlStr+="<a href='${res}/test/toUpdate.html?subjectId="+subject.subjectId+"' class='ext_btn ext_btn_submit mr10'>编辑</a> ";
 			htmlStr+="<input class='ext_btn ext_btn_error mr10' value='删除'  onclick='del("+subject.subjectId+");' type='button'> ";
 			htmlStr+="</span> ";
 			htmlStr+="</td> ";
 			htmlStr+="</tr>";
      });
 		  $subjectStr.append(htmlStr);
 }

 //搜索条件查询列表
 $(".search").click(function(){
 		var name=$("input[name='name']").val();
 		var videoId=$("#video option:selected").val();
 		var courseId=$("#course option:selected").val();
 		PageTmp(name,courseId,videoId);
 })

 //初始化时就调用
 jQuery(function ($) {
 	 PageTmp(); 
 });  
 
//删除全部选中的行数
function delAll(){
	var testIds = [];
  //设置一个空数组，存储被删除的行数
  var nullArr = [];
  //取得所有name值为ur_checkbox的input:checkbox存入数组
  var selectBoxNum = $("[name='ur_checkbox']");
  //设置一个中间变量判断input:checkbox全部没有选中，如果tmp=0则都未选中  
  var tmp = 0;

  //循环name值为ur_checkbox的input:checkbox,如果input:checkbox有选中,tmp++
  for (var i = 0; i < selectBoxNum.length; i++) {
    if (selectBoxNum[i].checked == true) {
    	testIds.push( $("[name='ur_checkbox']").eq(i).val());
			
      tmp++;
    };
  
  };
 
  
  

  //当tmp=0时，input:checkbox全部未被选中，弹出弹框；否则执行删除操作
  if (tmp == 0) {
    //当tmp=0时，弹出提示框
    layer.open({
      time: 2000, //2s后自动关闭
      title: '提示' , 
      icon:2,  
      content:'请选择你要删除的教师！' 
    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的试题吗？',{icon: 3, title:'提示'},function(){
     	
       layer.closeAll();
       //点击确认按钮。执行操作
       for (var i = 0; i < selectBoxNum.length; i++) {
          if(selectBoxNum[i].checked == true){
            //将被选中的行数，加入空数组
            nullArr.splice(nullArr.length,0,i);
           
          };
          
        };

        //循环nullArr执行逆序删除，删除每行样式和删除removeButtonIndexArr中的值
        for (var i = nullArr.length-1; i >= 0  ; i--) {
          /* removeButtonIndexArr.splice(nullArr[i],1);
 */      
          $("[name='ur_checkbox']").eq(nullArr[i]).parent("td").parent("tr").remove();
        };
        
      
        $.ajax({
			 url:'${res}/test/deleteTestByIds.html',
            type:'post',
            contentType : "application/x-www-form-urlencoded",
            data:{
            	testIds : testIds
            	
            },
  		success : function(data){
  			
  			if(data.flag="1"){
  				window.location.href="${res}/test/list.html"
  			}
  		}
		});
   
      });
    
    
  };
}
	         	    	/*  单条记录删除*/
	         	    	function del(subjectId){
	         	    	var subjectId = subjectId;	
	         	    	/* $(".ext_btn_error").click(function(){ */
	         	    		layer.confirm('你确定删除试题吗？',{icon: 3, title:'提示'},function(){
	         	    	       layer.closeAll();
	          			  	
	          			  	$.ajax({
	          			  		 url:'${res}/test/deleteTestById.html',
	         	 	            type:'post',
	         	 	           	dataType:'json',
	         	 	         	contentType : "application/x-www-form-urlencoded",
	         	 	         	 data:{
	         	 	        	 testId:subjectId	
	         	 	            },
	         	 	           success : function(data){
	         	 	        	   
	         						
	         					
	         						if(data.flag=="1"){
	         							layer.confirm('删除成功',{con: 3, title:'提示'},function(){ 
	    							 		layer.closeAll();
	         						window.location.href="${res}/test/list.html";
	         							})
	         						}
	         					}
	          			  		})
	          	
	         	    		})
	         	    	}
	         	    
					$(".paginList .paginItem").click(function(){
    			 		var pageNum =  $(this).find("a").text();

						 courseId = $("#course option:selected").val();
						 videoId=$("#video option:selected").val();

    					window.location.href="${res}/test/list.html?courseId="+courseId+"&keywords="+$('.input-text').val()+"&videoId="+videoId+"&pageNum="+pageNum;
		    		})
	                 
                 </script>
</html>
