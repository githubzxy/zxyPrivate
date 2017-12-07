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
<link href="${res }/css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res }/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
     <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">类别列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="toAddresType.html" target="rightFrame"><span><img src="${res }/images/t01.png"/></span>新建类别</a></li>
            <li class="click" onclick="delAll()"><span><img src="${res }/images/t03.png"/></span>全部删除</li>
       </ul>
    </div>
    <ul class="prosearch">
           <li>
               <i>类别名称:</i><a><input name="name" class="input-text" placeholder="类别关键字" type="text" value="${page.code }"/></a>
                <a><input name="" class="search" value="查询" type="button"/></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>类别列表</span></div>

         <table class="tablelist">
          <thead>
              <tr>
                    <th><input name="ur_allSelect" value="" id="allSelect" type="checkbox"/></th>
                    <th>编&nbsp;&nbsp;号</th>
                    <th width="550">类别名称</th>
                    <th>创建时间</th>
                    <th>文件数量</th>
                    <th width="220" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="typeStr"> 
              <c:forEach  items="${typeList }" var="type" varStatus="status">
	            <tr>
	                <td><input name="ur_checkbox" value="${type.id}" type="checkbox"/></td>
	                <td>${status.index+1 +(page.pageNum-1) * page.pageSize}</td>
	                <td>${type.name}</td>
	                <td><fmt:formatDate value="${type.createDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                <td>${type.num}</td>
	                <td>
	                 	<span class="pl15">
		                    <a href="toAddresType.html?id=${type.id }" class="ext_btn ext_btn_submit mr20">修改</a>
		                    <input class="ext_btn ext_btn_error" value="删除" type="button" onclick="del(${type.id})"/>
	                    </span> 
	                </td>
	            </tr>
          	</c:forEach>
            </tbody>
        </table>
        <!--分页-->
    <div class="pagin" id="pageToolbar">
    </div>
    <!--分页 end-->

 
 <script type="text/javascript">
 
 var $typeStr=$("#typeStr");
 //分页方法
 function PageTmp(name,size,page){
 	var htmlStr = "";
 	$.ajax({
		  type: "POST",
		  url: "${res}/resource/typeList.html",
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
			htmlStr+="<td><input name='ur_checkbox' value='"+type.id+"' type='checkbox' id="+type.id+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+type.name+"</td>";
			var createDate = new Date(type.createDt);
			htmlStr+="<td>"+createDate.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
			htmlStr+="<td>"+type.num+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+='<a href="toAddresType.html?id='+type.id +'" class="ext_btn ext_btn_submit mr20">修改</a>';
			htmlStr+="<input class='ext_btn ext_btn_error mr20' value='删除'  onclick='del("+type.id+");' type='button'> ";
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
 var removeButtonIndexArr = [105,106,107,108,109,110,111,112,113,114]; 
 //点击单条删除按钮删除该行数据
function del(removeButtonIndex){
        layer.confirm('你确定删除选中的资源吗？',{icon: 3, title:'提示'},function(){
        	$.ajax({
        		url:"delResourceType.html",
        		type:"post",
        		data:{fileTypeId:removeButtonIndex},
        		dataType: "json",
        		success:function(data){
        			if(1 == data.flag){
  					  layer.alert(data.msg,{icon:1},function(){
  	      				  document.location.href=" ${res}/resource/typeList.html";
  	      			  });
  					
  		    		}else {
  		    			layer.alert(data.msg,{icon:2});
  		    		}
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
  //循环name值为ur_checkbox的input:checkbox,如果input:checkbox有选中,tmp++
  for (var i = 0; i < selectBoxNum.length; i++) {
    if (selectBoxNum[i].checked == true) {
      tmp++;
    };
  };
  var id_array=new Array();  
	$('input[name="ur_checkbox"]:checked').each(function(){  
	    id_array.push($(this).attr('id'));//向数组中添加元素  
	});  
	var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  

  //当tmp=0时，input:checkbox全部未被选中，弹出弹框；否则执行删除操作
  if (tmp == 0) {
    //当tmp=0时，弹出提示框
	  layer.open({
	      time: 2000, //2s后自动关闭
	      title: '提示' , 
	      icon:2,  
	      content:'请选择你要删除的资源！' 
	    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的资源吗？',{icon: 3, title:'提示'},function(){
       layer.closeAll();
          $.ajax({
        	      type: "POST",
        	      processData:true,
        		  url:"delAllResourceType.html",
        		  data:{"fileTypeIds":idstr},
        		  dataType: "json",
        		  success:function(data){
        			  if(1 == data.flag){
    					  layer.alert(data.msg,{icon:1},function(){
    	      				  document.location.href=" ${res}/resource/typeList.html";
    	      			  });
    		    		}else {
    		    			layer.alert(data.msg,{icon:2});
    		    		}
        		  	}
        		  });
      });
  };
}
 </script>
</body>
</html>