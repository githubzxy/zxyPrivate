<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学校信息列表</title>
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
       <li><a href="#">学校信息列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="${res}/admin/school/add.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>新加学校</a></li>
            <li onclick="delAll();"><span><img src="${res}/images/t03.png"></span>全部删除</li>
       </ul>
    </div>
    <ul class="prosearch">
    	<li>
     	<i>学校名称:</i><a><input name="schoolName" id="sName" class="input-text" placeholder="学校名称" type="text"></a>
               <a><input name="" class="search" value="查询" type="button"></a>
       </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>学校信息列表</span></div>
         <table class="tablelist">
          <thead>
              <tr>
                    <th width=""><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th width="">序&nbsp;&nbsp;号</th>
                    <th width="">学校名称</th>
                    <th width="">联系人</th>
                    <th width="">手机号码</th>
                    <th width="">官网地址</th>
                    <th width="">平台访问地址</th>
                    <th width="">账号状态</th>
                    <th width="" class="text-center">操&nbsp;&nbsp;作</th>
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
 var $name= $("#sName");
 //分页方法
 function PageTmp(name,size,page){
 	var htmlStr = "";
 	$.ajax({
		  type: "POST",
		  url: "${res}/admin/school/list.html",
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
 	$.each(datas, function (index, school) {
			htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='' type='checkbox' id="+school.schoolId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+school.schoolName+"</td>";
			htmlStr+="<td>"+school.contacts+"</td>";
			htmlStr+="<td>"+school.tel+"</td>";
			htmlStr+="<td>"+school.website+"</td>";
			htmlStr+="<td>"+school.url+"</td>";
			if (school.isUsed ==1) {
					htmlStr+='<td class="green stauts">已启用</td>';
	            } else {
	            	htmlStr+='<td class="f00 stauts">已注销</td>';
	            }
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+="<a href='${res}/admin/school/update/"+school.schoolId+".html' class='ext_btn ext_btn_submit mr10'>修改</a> ";
			if (school.isUsed ==1) {
				htmlStr+='<input class="ext_btn ext_btn_error  mr10 " value="注销" type="button" onclick="logout(this,'+school.schoolId+')" data-type="1">';
            } else {
            	htmlStr+='<input class="ext_btn ext_btn_success mr10" value="启用" type="button" onclick="logout(this,'+school.schoolId+')" data-type="0">';
            }
			htmlStr+="<input class='ext_btn ext_btn_error mr10' value='删除'  onclick='del("+school.schoolId+");' type='button'> ";
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

 
 
function logout(obj,pid){
	
	var state= $(obj).attr("data-type");
    if(state=="0"){
        var hint="确认注销该学生账户?";
    }else{
        var hint="确认启用该学生账户?";
    }
    layer.confirm(hint,{icon: 3, title:'提示'},function(){ 
    layer.closeAll();
    if(state=="1"){
        if(doLogout(pid,0)){//0注销
           $(obj).attr("data-type","0");
           $(obj).val("启用").addClass("ext_btn_success").removeClass("ext_btn_error");
            $(obj).parent().parent().siblings(".stauts").text("已注销").addClass("f00").removeClass("green");
        }else{
           layer.msg('注销失败！');
        }     
    }else if(state=="0"){
        if(doLogout(pid,1)){//1表示启用
           $(obj).val("注销").addClass("ext_btn_error").removeClass("ext_btn_success");
           $(obj).attr("data-type","1"); 
           $(obj).parent().parent().siblings(".stauts").text("已启用").addClass("green").removeClass("f00");
        }else{
            layer.msg('启用失败！');
        }      
     }  
    });
    
}

//请求数据接口-启用或注销
function doLogout(pid,type){
    //把id,和type传给服务器端，服务器端修改成功返回true,修改失败返回false;
    var returnVal = false;
   	 $.ajax({
      	  type: "POST",
      	  url: "${res}/admin/school/logout.html",
      	  processData:true,
      	  async:false,
      	  data:{"schoolId":pid,"isUsed":type},
      	  dataType: "json",
      	  success: function(data){
            if(1 == data.flag){
            	returnVal = true;
            }	         		
      	  }
      	 });
   return returnVal;
}



//ajax加载的每条数据的id号的数组  
 var removeButtonIndexArr = [103,104,105]; 
 //点击单条删除按钮删除该行数据
function del(schoolId){
        layer.confirm('你确定删除学校吗？',{icon: 3, title:'提示'},function(){
          layer.closeAll();
          $.ajax({
        	  type: "POST",
        	  url: "${res}/admin/school/delete.html",
        	  processData:true,
        	  data:{"ids":schoolId},
        	  dataType: "json",
        	  success: function(data){
           		if(1 == data.flag){
           			layer.msg(data.msg);
           			window.location.reload();
           		}else{
           			layer.msg(data.msg);
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
      content:'请选择你要删除的学校！' 
    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的学校吗？',{icon: 3, title:'提示'},function(){
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
    		  url: "${res}/admin/school/delete.html",
    		  processData:true,
    		  data:{"ids":idstr},
    		  dataType: "json",
    		  success: function(data){
    			
    	    		if(1 == data.flag){
    	    			layer.msg(data.msg);
    	    			window.location.reload();
    	    		}else{
    	    			layer.msg(data.msg);
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
