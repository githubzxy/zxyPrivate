<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>班级列表</title>
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
       <li><a href="#">班级列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="add.html" target="rightFrame"><span><img src="${res}/images/t01.png"/></span>新增班级</a></li>
             <li><a href="import.html" target="rightFrame"><span><img src="${res}/images/t01.png"/></span>批量导入班级</a></li>
            <li onclick="delAll();"><span><img src="${res}/images/t03.png"/></span>全部删除</li>
       </ul>
    </div>
    <ul class="prosearch">
           <li>
               <i>班级名称:</i><a><input name="className" class="input-text className" placeholder="班级关键字" type="text" value="${page.className}"/></a>
               <a><input name="" class="search" value="查询" type="button"/></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>班级列表</span></div>
         <table class="tablelist">
          <thead>
              <tr>
                    <th width=""><input name="ur_allSelect" value="" type="checkbox" id="allSelect"/></th>
                    <th width="5%">序&nbsp;&nbsp;号</th>
                    <th width="">班级名称</th>
                    <th width="">班级简介</th>
                    <th>创建人</th>
                    <th>创建时间</th>
                    <th width="228" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="schoolStr">
             
            </tbody>
        </table>
        
        <!--分页-->
       <div id="pageToolbar"></div>
        <!--分页 end-->
     </div>
 </div>
 <script type="text/javascript">
 var  $schoolStr=$("#schoolStr");
 var $name= $(".className");
 //分页方法
 function PageTmp(name,size,page){
 	var htmlStr = "";
 	$.ajax({
		  type: "POST",
		  url: "${res}/admin/class/list.html",
		  processData:true,
		  data:{"keyWords":name,'pageSize':size,'pageNum':page},
		  dataType: "json",
		  success: function(data){
			  if(typeof(size) == "undefined"){
				  var htmlStr = "";
				  $schoolStr.empty();
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
 	 $schoolStr.empty();
 	$.each(datas, function (index, classPo) {
			htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='' type='checkbox' id="+classPo.classId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+classPo.name+"</td>";
			htmlStr+="<td>"+classPo.info+"</td>";
			htmlStr+="<td>"+""+"</td>";
			var createDate = new Date(classPo.createDate);
			htmlStr+="<td>"+createDate.pattern("yyyy-MM-dd HH:mm");+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+="<a href='${res}/admin/class/update/"+classPo.classId+".html' class='ext_btn ext_btn_submit mr10'>修改</a> ";
			htmlStr+="<input class='ext_btn ext_btn_error mr10' value='删除'  onclick='del("+classPo.classId+");' type='button'> ";
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
      });
		  $schoolStr.append(htmlStr);
 }
 
//搜索条件查询列表
 $(".search").click(function(){
		var name= $name.val();
		PageTmp(name);
})

 //初始化时就调用
 jQuery(function ($) {
	 PageTmp(); 
 });


//ajax加载的每条数据的id号的数组  
 /* var removeButtonIndexArr = [103,104,105,106,107,108];  */
 //点击单条删除按钮删除该行数据
function del(removeButtonIndex){
  //取得所有name值为ur_checkbox的input:checkbox存入数组
 /*  var selectBoxNum = $("[name='ur_checkbox']");  
  //循环name值为ur_checkbox的input:checkbox进行删除操作    
  for (var i = 0; i < selectBoxNum.length; i++) {
    //设置一个中间变量值
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
      if (tmp == i) { */
        layer.confirm('你确定删除选中的班级吗？',{icon: 3, title:'提示'},function(){
          layer.closeAll();
          $.ajax({
        	    type:'POST',
        		  url:"${res}/admin/class/delete.html",
        		  data:{ids:removeButtonIndex},
        		  dataType: "json",
        		  success:function(data){
			  		  if(data.flag==1){
			  			  layer.alert(data.msg,function(){
			  				  document.location.href="list.html";
			  			  });
			  		  }else{
			  			  layer.alert(data.msg);
			  		  }
        		  }
        		  });
          $("[name='ur_checkbox']").eq(tmp).parent("td").parent("tr").remove();
          removeButtonIndexArr.splice(tmp,1);
        });
        
      };  
 /*  }  else {
    //没选中时，弹出提示框
    layer.open({
      time: 2000, //2s后自动关闭
      title: '提示' , 
      icon:2,  
      content:'请选择你要删除的公告信息！' 
    });
   };

 };   
}  */



//删除全部选中的行数
function delAll(){
	//取得所有选中checkbox的id，拼接成字符串
	var id_array=new Array();  
	$('input[name="ur_checkbox"]:checked').each(function(){  
	    id_array.push($(this).attr('id'));//向数组中添加元素  
	});  
	var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
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

  //当tmp=0时，input:checkbox全部未被选中，弹出弹框；否则执行删除操作
  if (tmp == 0) {
    //当tmp=0时，弹出提示框
    layer.open({
      time: 2000, //2s后自动关闭
      title: '提示' , 
      icon:2,  
      content:'请选择你要删除的班级！' 
    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的班级吗？',{icon: 3, title:'提示'},function(){
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
    		  url:"${res}/admin/class/delete.html",
    		  data:{ids:idstr},
    		  dataType: "json",
    		  success:function(data){
				  if(data.flag==1){
					  layer.alert(data.msg,function(){
						  document.location.href="list.html";
					  });
				  }else{  layer.alert(data.msg);
				  }
    		  }
    		  });
        //循环nullArr执行逆序删除，删除每行样式和删除removeButtonIndexArr中的值
        for (var i = nullArr.length-1; i >= 0  ; i--) {
          removeButtonIndexArr.splice(nullArr[i],1);
          $("[name='ur_checkbox']").eq(nullArr[i]).parent("td").parent("tr").remove();
        };
      });
  };
}


</script>    
</body>
</html>