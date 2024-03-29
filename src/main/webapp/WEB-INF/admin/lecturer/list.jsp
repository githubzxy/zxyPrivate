<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>专家团队列表</title>
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
       <li><a href="#">专家团队列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="${res}/admin/lecturer/add.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>新增专家</a></li>
          <%--   <li><a href="${res}/lecturer/import.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>批量导入讲师</a></li> --%>
            <li onclick="delAll();"><span><img src="${res}/images/t03.png"></span>全部删除</li>
       </ul>
    </div>
    <ul class="prosearch">
           <li>
               <i>专家姓名:</i><a><input name="name" id="tname" class="input-text" placeholder="姓名关键字" type="text"></a>
               <i>专家职称:</i><a><input name="position" id="tposition" class="input-text" placeholder="职称关键字" type="text"></a>
                <a><input name="" class="search" value="查询" type="button"></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>专家团队列表</span></div>

         <table class="tablelist">
          <thead>
              <tr>
                    <th><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>姓&nbsp;&nbsp;名</th>
                    <th>职&nbsp;&nbsp;称</th>
                    <th>联系方式</th>
                    <th class="text-center">邮&nbsp;&nbsp;箱</th>
                    <th width="148" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="lecturerStr"> 
            </tbody>
        </table>
        <!--分页-->
       <div id="pageToolbar"></div>
        <!--分页 end-->
     </div>
</div>
<script type="text/javascript">
var  $lecturerStr=$("#lecturerStr");
//分页方法
function PageTmp(name,position,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/lecturer/list.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"name":name,"position":position},
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $lecturerStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(name,position,size,page);
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
	$lecturerStr.empty();
	  $.each(datas, function (index, lecturer) {
		    htmlStr+="<tr>";
			htmlStr+=" <input name='loginId' value="+lecturer.lecturerId+" type='hidden' id="+lecturer.lecturerId+">";
			htmlStr+="<td><input name='ur_checkbox' value='' type='checkbox' id="+lecturer.lecturerId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+lecturer.name+"</td>";
			htmlStr+="<td>"+lecturer.position+"</td>";
			htmlStr+="<td>"+lecturer.phone+"</td>";
			htmlStr+="<td>"+lecturer.email+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl5'>";
			htmlStr+="<a href='${res}/admin/lecturer/add.html?lecturerId="+lecturer.lecturerId+"' class='ext_btn ext_btn_submit mr10'>修改</a> ";
			htmlStr+="<input class='ext_btn ext_btn_error mr10' value='删除'  onclick='del("+lecturer.lecturerId+");' type='button'> ";
		/* 	htmlStr+=" <a href='${res}/admin/lecturer/detail/"+lecturer.lecturerId+".html' class='ext_btn ext_btn_success'>查看</a> "; */
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
   });
	  $lecturerStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
	var name=$("input[name='name']").val();
	var position=$("input[name='position']").val();
	PageTmp(name,position);
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

 //点击单条删除按钮删除该行数据
function del(lecturerId){
	 layer.confirm('你确定删除选中的讲师吗？',{icon: 3, title:'提示'},function(){

          $.ajax({
        	  type: "POST",
        	  url: "${res}/admin/lecturer/lecturerDel.html",
        	  processData:true,
        	  data:{"lecturerId":lecturerId},
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
	 });
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
      content:'请选择你要删除的讲师！' 
    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的讲师吗？',{icon: 3, title:'提示'},function(){
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
  		  url: "${res}/admin/lecturer/lecturersDel.html",
  		  processData:true,
  		  data:{"lecturerIds":idstr},
  		  dataType: "json",
  		  success: function(data){
  			 if(data.flag==1){
   			  layer.alert(data.msg,{icon:1},function(){
   				  document.location.href="list.html";
   			  });
   		  }else{
   			  layer.alert(data.msg,{icon:2});
   		  }
  		  },
  		  error:function(){
  			  altert("错了");
  		  }
  		 });
       
      });
   
  };
}
function DrawImage(ImgD,iwidth,iheight){      
    //参数(图片,允许的宽度,允许的高度)      
    var image=new Image();      
    image.src=ImgD.src;      
    if(image.width>0 && image.height>0){      
      if(image.width/image.height>= iwidth/iheight){      
          if(image.width>iwidth){        
              ImgD.width=iwidth;      
              ImgD.height=(image.height*iwidth)/image.width;      
          }else{      
              ImgD.width=image.width;        
              ImgD.height=image.height;      
          }      
      }else{      
          if(image.height>iheight){        
              ImgD.height=iheight;      
              ImgD.width=(image.width*iheight)/image.height;              
          }else{      
              ImgD.width=image.width;        
              ImgD.height=image.height;      
          }      
      }      
    }      
}
</script>

</body>
</html>
