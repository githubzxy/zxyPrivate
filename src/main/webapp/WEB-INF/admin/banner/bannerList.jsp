<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>轮播图列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css">
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
     <li><a href="${res}/" target=＂_blank＂>首页</a></li>
    <li>轮播图列表</li>
    </ul>
    </div>
    
    <div class="rightinfo">
		<div class="tools">
       		 <ul class="toolbar">
          		 <li><a href="add.html" target="rightFrame"><span><img src="${res }/images/t01.png"/></span>上传轮播图</a></li>
           		 <li onclick="delAll();"><span><img src="${res }/images/t03.png"/></span>全部删除</li>
        	</ul>
       </div>
       <ul class="prosearch">
           <li>
               <i>轮播图名称:</i><a><input type="text" name="name" class="input-text" placeholder="关键字" value=""/></a>
               <input name="" type="button" class="search" value="查询"/>
           </li>
       </ul>
   
       <div class="formtitle1"><span>轮播图列表</span></div>
   
    <table class="tablelist">
    	<thead>
        	<tr>
                <th width="15"><input name="ur_allSelect" value="" type="checkbox" id="allSelect"/></th>
                <th>序号</th>
                <th>轮播图名称</th>
                <th width="330" class="text-center">操&nbsp;&nbsp;作</th>
            </tr>
        </thead>
        <tbody id="publicStr">
        
        </tbody>
    </table>
    
    <!--分页-->
    <div class="pagin" id="pageToolbar">
    </div>
    <!--分页 end-->
</div>
 <script type="text/javascript">
 
 var $publicStr=$("#publicStr");
 //分页方法
 function PageTmp(name,size,page){
 	var htmlStr = "";
 	$.ajax({
		  type: "POST",
		  url: "${res}/banner/list.html",
		  processData:true,
		  data:{"keyWords":name,'pageSize':size,'pageNum':page},
		  dataType: "json",
		  success: function(data){
			  if(typeof(size) == "undefined"){
				  var htmlStr = "";
				  $publicStr.empty();
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
 	 $publicStr.empty();
 	$.each(datas, function (index, resource) {
			htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='"+resource.bannerId+"' type='checkbox' id="+resource.bannerId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+resource.title+"</td>";   
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+='<a href="${res}/banner/getUrl.html?bannerId='+resource.bannerId+'" class="ext_btn ext_btn_success mr20">查看</a>';
			htmlStr+="<input class='ext_btn ext_btn_error mr20' value='删除'  onclick='del("+resource.bannerId+");' type='button'> ";
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
      });
		  $publicStr.append(htmlStr);
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
        		url:"del.html",
        		type:"post",
        		data:{bannerId:removeButtonIndex},
        		dataType: "json",
        		success:function(data){
        			if(1 == data.flag){
  					  layer.alert(data.msg,function(){
  	      				  document.location.href=" ${res}/banner/list.html";
  	      			  });
  					
  		    		}else {
  		    			layer.alert(data.msg);
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
  var fileIds= [];

  //循环name值为ur_checkbox的input:checkbox,如果input:checkbox有选中,tmp++
  for (var i = 0; i < selectBoxNum.length; i++) {
    if (selectBoxNum[i].checked == true) {
      tmp++;
      fileIds.push(selectBoxNum.eq(i).val());  
    };
  };

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
   
       //点击确认按钮。执行操作
       for (var i = 0; i < selectBoxNum.length; i++) {
          if(selectBoxNum[i].checked == true){
        	//将被选中的行数，加入空数组
              nullArr.splice(nullArr.length,0,i);
        	 
            
          };
        };
          $.ajax({
        	    type:'POST',
        		  url:"delAll.html",
        		  data:{bannerIds:fileIds},
        		  dataType: "json",
        		  success:function(data){
        			  if(1 == data.flag){
      					  layer.alert(data.msg,function(){
      	      				  document.location.href=" ${res}/banner/list.html";
      	      			  });
      					
      		    		}else {
      		    			layer.alert(data.msg);
      		    		}
        		  	}
        		  });
      });
  };
}

</script>    

</body>
</html>