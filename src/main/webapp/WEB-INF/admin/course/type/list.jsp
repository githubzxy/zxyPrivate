<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>类别列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
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
       <li><a href="#">课程类别</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="${res}/admin/course/type/add.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>新建类别</a></li>
            <%-- <li><a href="${res}/course/type/tomodify.html" target="rightFrame"><span><img src="${res}/images/t02.png"></span>修改</a></li> --%>
            <li onclick="delAll();"><span><img src="${res}/images/t03.png"></span>删除</li>
       </ul>
    </div>
    <ul class="prosearch">
           <li>
               <i>课程类别:</i><a><input name="name" class="input-text" placeholder="类别信息关键字" type="text" value=""></a>
                <a><input name="" class="search" value="查询" type="button"></a>
           </li>
           
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>类别列表</span></div>
         <table class="tablelist">
          <thead>
              <tr>
                   	<th><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th>编&nbsp;&nbsp;号<i class="sort"><img src="${res}/images/px.gif"></i></th>
                    <th>类别名称</th>
                   <!--  <th>类别信息</th> -->
                    <th>创建者</th>
                    <th>创建时间</th>
                    <th width="226" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="typeStr"> 
            <%-- <c:forEach items = "${requestScope.courseTypeList}" var = "list" varStatus="status">
                <tr>
               		<td><input name="ur_checkbox" value="${list.courseTypeId}" type="checkbox" ></td>
               		<td>${list}</td>
             	 	 <td>${status.index+1+(page.pageNum-1)*page.pageSize}</td> 
               		  <td>${list.typeName}</td>
               		   <td>${list.typeInfo}</td>
               		   <td>${list.user.name}</td>
               		    
               		   <td> <fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${list.createDate}" /></td>
               		<td>
                       <span class="pl15">
                           <input value="编辑" class="ext_btn ext_btn_submit mr20" type="submit" onclick="modify(${list.courseTypeId});">
                           <input class="ext_btn ext_btn_error" value="删除" type="button" >
                           <input type="hidden" value="${list.courseTypeId}"></input>
                       </span> 
                    </td>
               	</tr>
               </c:forEach> --%>
            </tbody>
        </table>
        <!--分页-->
        <div class="pagin" id="pageToolbar">
        </div>
        <!--分页 end-->
   </div>
</div>
<script type="text/javascript">

var $typeStr=$("#typeStr");
//分页方法
function PageTmp(name,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/course/type/list.html",
		  processData:true,
		  data:{"keyWords":name,'pageSize':size,'pageNum':page},
		  dataType: "json",
		  success: function(data){
			  if(typeof(size) == "undefined"){
				  var htmlStr = "";
				  $typeStr.empty();
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
	 $typeStr.empty();
	$.each(datas, function (index, type) {
			htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='"+type.courseTypeId+"' type='checkbox' id="+type.courseTypeId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+type.typeName+"</td>";
			/* htmlStr+="<td>"+type.typeInfo+"</td>"; */
			if(type.user==null){
				htmlStr+="<td>无</td>";
			}else{
				htmlStr+="<td>"+type.user.name+"</td>";
			}
			var createDt = new Date(type.createDate);
			htmlStr+="<td>"+createDt.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+='<input value="编辑" class="ext_btn ext_btn_submit mr20" type="submit" onclick="modify('+type.courseTypeId+');">';
			htmlStr+="<input class='ext_btn ext_btn_error mr20' value='删除'  onclick='del("+type.courseTypeId+");' type='button'> ";
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
     });
		  $typeStr.append(htmlStr);
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

//ajax加载的每条数据的id号的数组  
 var removeButtonIndexArr = [104,105,106];
 //点击单条删除按钮删除该行数据
function del(removeButtonIndex){
  //取得所有name值为ur_checkbox的input:checkbox存入数组
  var selectBoxNum = $("[name='ur_checkbox']");  
  //循环name值为ur_checkbox的input:checkbox进行删除操作    
  for (var i = 0; i < selectBoxNum.length; i++) {
    //设置一个中间变量值
    /* removeButtonIndexArr.push( $("[name='ur_checkbox']").eq(i).val()); */
    var tmp = 1000;
    //循环删除按钮数组取得删除按钮的行数，存入中间变量值
    for (var j = 0; j < removeButtonIndexArr.length; j++) {
      //根据删除按钮的值判断该值在删除数组中是第几个元素
      if(removeButtonIndexArr[j] == removeButtonIndex) {
        //取得删除按钮的行数，存入中间变量值
        tmp = j;
      };
    };

  //根据input:checkbox是否选中进行操作，选中时，判断其行数是否和删除按钮行数相同；没选中时，弹出提示框
   if(selectBoxNum[tmp].checked == true){
    //当删除按钮的行数等于input:checkbox的行数时，进行删除操作
	    if (tmp == i) {
        layer.confirm('你确定删除选中的教师吗？',{icon: 3, title:'提示'},function(){
          layer.closeAll();
          $("[name='ur_checkbox']").eq(tmp).parent("td").parent("tr").remove();
          removeButtonIndexArr.splice(tmp,1);
        });
        
	    };  
   } else {
    //没选中时，弹出提示框
    layer.open({
      time: 2000, //2s后自动关闭
      title: '提示' , 
      icon:2,  
      content:'请选择你要删除的教师！' 
    });
   };

 };   
}
//删除全部选中的行数
function delAll(){
	var typeIds = [];
  //设置一个空数组，存储被删除的行数
  var nullArr = [];
  //取得所有name值为ur_checkbox的input:checkbox存入数组
  var selectBoxNum = $("[name='ur_checkbox']");
  //设置一个中间变量判断input:checkbox全部没有选中，如果tmp=0则都未选中  
  var tmp = 0;

  //循环name值为ur_checkbox的input:checkbox,如果input:checkbox有选中,tmp++
  for (var i = 0; i < selectBoxNum.length; i++) {
    if (selectBoxNum[i].checked == true) {
        typeIds.push( $("[name='ur_checkbox']").eq(i).val());
			
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
      content:'请选择你要删除的课程类别！' 
    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的课程类别吗？',{icon: 3, title:'提示'},function(){
     	
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
			 url:'${res}/admin/course/type/delMany.html',
            type:'post',
            contentType : "application/x-www-form-urlencoded",
            data:{
            	typeIds : typeIds
            },
  		success : function(data){
  			if(data.flag="1"){
  				window.location.href="${res}/admin/course/type/list.html"
  			}
  		}
		});
      });
  };
}

  	
	    	/*  单条记录删除*/
	    	function del(courseTypeId){
	    	 	layer.confirm('你确定删出该课程类别吗？',{icon: 3, title:'提示'},function(){ 
	    		layer.closeAll();
 			  	$.ajax({
 			  		url:'${res}/admin/course/type/delete.html',
	 	            type:'post',
	 	           	dataType:'json',
	 	         	contentType : "application/x-www-form-urlencoded",
	 	          data:{
	 	        	 courseTypeId:courseTypeId
	 	            },
	 	           success : function(data){
						if(data.flag=="1"){
		            
						window.location.href="${res}/admin/course/type/list.html"/* ?pageNum="+pageNum+"&keyWords="+$('.input-text').val() */;
						}
					}
 			  	})
 	
	    	
	    	});
	    	}
		/* 修改 */
		function modify(courseTypeId){
			window.location.href="${res}/admin/course/type/update.html?courseTypeId="+courseTypeId;
	}
	    </script>
       
</body>
</html>
