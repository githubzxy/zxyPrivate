<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教师列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css">
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
       <li><a href="#">教师信息列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="${res}/admin/teacher/add.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>新加教师</a></li>
            <li><a href="${res}/admin/teacher/import.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>批量导入教师</a></li>
            <li onclick="delAll();"><span><img src="${res}/images/t03.png"></span>全部删除</li>
       </ul>
    </div>
    <ul class="prosearch">
           <li>
               <i>教师姓名:</i><a><input name="name" id="tname" class="input-text" placeholder="姓名" type="text"></a>
               <i>教师工号:</i><a><input name="number" id="tnumber" class="input-text" placeholder="工号" type="text"></a>
                <a><input name="" class="search" value="查询" type="button"></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>教师信息列表</span></div>

         <table class="tablelist">
          <thead>
              <tr>
                    <th><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>姓&nbsp;&nbsp;名</th>
                    <th>联系方式</th>
                    <th class="text-center">邮&nbsp;&nbsp;箱</th>
                    <th>密&nbsp;&nbsp;码</th>
                    <th>职&nbsp;&nbsp;称</th>
                    <th>部&nbsp;&nbsp;门</th>
                    <th>工&nbsp;&nbsp;号</th>
                    <th  class="text-center">身份证号码</th>
                    <th width="260" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="teacherStr"> 
            </tbody>
        </table>
        <!--分页-->
       <div id="pageToolbar"></div>
        <!--分页 end-->
     </div>
</div>
<script type="text/javascript">
var  $teacherStr=$("#teacherStr");
//分页方法
function PageTmp(name,number,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/teacher/list.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"name":name,"number":number},
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $teacherStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(name,number,size,page);
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
	$teacherStr.empty();
	  $.each(datas, function (index, user) {
		    htmlStr+="<tr>";
			htmlStr+=" <input name='loginId' value="+user.loginPo.loginId+" type='hidden' id="+user.loginPo.loginId+">";
			htmlStr+="<td><input name='ur_checkbox' value='' type='checkbox' id="+user.userId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+user.name+"</td>";
			htmlStr+="<td>"+user.mobile+"</td>";
			htmlStr+="<td>"+user.email+"</td>";
			htmlStr+="<td class='passworded'>"+user.loginPo.loginPwd+"</td>";
			htmlStr+="<td>"+user.teacherPo.position+"</td>";
			htmlStr+="<td>"+user.teacherPo.department+"</td>";
			htmlStr+="<td>"+user.number+"</td>";
			htmlStr+="<td>"+user.idCard+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl5'>";
			htmlStr+="<a href='${res}/admin/teacher/update/"+user.userId+".html' class='ext_btn ext_btn_submit mr10'>修改</a> ";
			htmlStr+="<input class='ext_btn ext_btn_error mr10' value='删除'  onclick='del("+user.userId+");' type='button'> ";
			htmlStr+="<input class='ext_btn ext_btn_success mr10' value='随机密码' onclick='random("+user.loginPo.loginId+");' type='button'> ";
		/* 	htmlStr+=" <a href='${res}/admin/teacher/detail/"+user.userId+".html' class='ext_btn ext_btn_success'>查看</a> "; */
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
   });
	  $teacherStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
	var name=$("input[name='name']").val();
	var number=$("input[name='number']").val();
	PageTmp(name,number);
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});

//取得所有选中checkbox的id，拼接成字符串
var id_arrays=new Array();  
$('input[name="ur_checkbox"]').each(function(){  
    id_arrays.push($(this).attr('id'));//向数组中添加元素  
});  
//random 随机密码
function random(loginId){

	     layer.confirm('确定要给该教师生成随机密码吗？',{icon: 3, title:'询问提示'},function(){
	        layer.closeAll();
	        var setPassword = "";
            for (var j = 0; j < 6; j++) {
              var chars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
              var randomNum = Math.floor(Math.random()*chars.length);
               setPassword = setPassword + chars[randomNum];
            }; 
	          $.ajax({
	      		  type: "POST",
	      		  url: "${res}/admin/teacher/updatePwd.html",
	      		  processData:true,
	      		  data:{"loginPwd":setPassword,"loginId":loginId},
	      		  dataType: "json",
	      		  success: function(data){
	      	    		if(1 == data.flag){
	      	    			layer.alert(data.msg,{icon:1},function(){
	          				  document.location.href="list.html";
	          			  });;
	      	    		}else{
	      	    			layer.alert(data.msg,{icon:2});
	      	    		}
	      		  }
	      		 });
	         
	        });   
	    };
 //点击单条删除按钮删除该行数据
function del(userId){
	
   //取得所有name值为ur_checkbox的input:checkbox存入数组
  var selectBoxNum = $("[name='ur_checkbox']");  
  //循环name值为ur_checkbox的input:checkbox进行删除操作    
  for (var i = 0; i < selectBoxNum.length; i++) {
    //设置一个中间变量值
    var tmp = 1000;
    //循环删除按钮数组取得删除按钮的行数，存入中间变量值
    for (var j = 0; j < id_arrays.length; j++) {
      //根据删除按钮的值判断该值在删除数组中是第几个元素
      if(id_arrays[j] == userId) {
        //取得删除按钮的行数，存入中间变量值
        tmp = j;
      };
    };

          $.ajax({
        	  type: "POST",
        	  url: "${res}/admin/teacher/delete.html",
        	  processData:true,
        	  data:{"ids":userId},
        	  dataType: "json",
        	  success: function(data){
        		  if(data.flag==1){
        			  layer.alert(data.msg,{icon:1},function(){
        				  document.location.href="list.html";
        			  });
        		  }else{
        			  layer.alert(data.msg,{icon:2});
        		  }
        	  }
        	  
        	 });
          if (tmp == i) { 
             
             $("[name='ur_checkbox']").eq(tmp).parent("td").parent("tr").remove();
               
              }
     
       
	    }
       
   }

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
      content:'请选择你要删除的教师！' 
    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的教师吗？',{icon: 3, title:'提示'},function(){
       layer.closeAll();
       //点击确认按钮。执行操作
       for (var i = 0; i < selectBoxNum.length; i++) {
          if(selectBoxNum[i].checked == true){
            //将被选中的行数，加入空数组
            nullArr.splice(nullArr.length,0,i);
          };
        };
        $.ajax({
  		  type: "POST",
  		  url: "${res}/admin/teacher/delete.html",
  		  processData:true,
  		  data:{"ids":idstr},
  		  dataType: "json",
  		  success: function(data){
  	    		if(1 == data.flag){
  	    			layer.alert(data.msg,{icon:1},function(){
        				  document.location.href="list.html";
        			  });;
  	    		}else{
  	    			layer.alert(data.msg,{icon:2});
  	    		}
  		  },
  		  error:function(){
  			  altert("错了");
  		  }
  		 });
        //循环nullArr执行逆序删除，删除每行样式和删除removeButtonIndexArr中的值
        for (var i = nullArr.length-1; i >= 0  ; i--) {
        	id_array.splice(nullArr[i],1);
          $("[name='ur_checkbox']").eq(nullArr[i]).parent("td").parent("tr").remove();
        };
      });
   
  };
}

</script>

</body>
</html>
