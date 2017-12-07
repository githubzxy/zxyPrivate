<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程资源列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res }/css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res }/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript">
$(function(){
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
      <li><a href="#" target="_parent">我的资源</a></li>
      <li>课程资源列表</li>
    </ul>
    </div>
    
    <div class="rightinfo">
       <div class="tools">
        <ul class="toolbar">
            <li><a href="toUploadRes.html" target="rightFrame"><span><img src="${res }/images/t01.png"/></span>新建资源</a></li>
            <li onclick="delAll();"><span><img src="${res }/images/t03.png"/></span>全部删除</li>
            <li onclick="downAll();"><span><img src="${res }/images/down.png"/></span>批量下载</li>
        </ul>
       </div>
       <ul class="prosearch">
           <li>
               <i>资源名称:</i><a><input name="name" type="text" class="input-text" placeholder="资源关键字" value="${page.code }"/></a>
               <i>课程名称:</i>
                 <a>
                   <select name="" class="select"> 
	                  <option value="">--选择课程--</option> 
	                    <c:forEach  items="${courseList }" var="course" varStatus="status">
	                   	<option value="${course.courseId }">${course.courseName }</option> 
                      </c:forEach>
                    </select>
                </a>
               <input name="" type="button" class="search" value="查询"/>
           </li>
       </ul>
    <div class="formbody">
    <div class="formtitle1"><span>课程资源列表</span></div>
     <table class="tablelist">
        <thead>
            <tr>
                <th width="15"><input name="ur_allSelect" type="checkbox" value="" id="allSelect"/></th>
                <th>序号</th>
                <th>资源名称</th>
                <th>创建/修改时间</th>
                <th>资源类别</th>
                <th>分享状态</th>
                <th width="330" class="text-center">操&nbsp;&nbsp;作</th>
            </tr>
        </thead>
        <tbody id="courseResStr">
            <c:forEach  items="${resourceList }" var="resource" varStatus="status">
            <tr>
                <td><input name="ur_checkbox" value="${resource.id}" type="checkbox"/></td>
                <td>${status.index+1 +(page.pageNum-1) * page.pageSize}</td>
                <td>${resource.name}</td>
                <td><fmt:formatDate value="${resource.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${resource.fileTypePo.name}</td>
                <c:if test="${resource.state != 2 && resource.state != 3}">
                	<td class="f00 stauts" >未分享</td>
                </c:if>
                <c:if test="${resource.state == 2 || resource.state == 3}">
                	<td class="green stauts">已分享</td>
                </c:if>
                <td>
                    <span class="pl15">
                        <a href="${res }/upload/downFile.html?fn=${resource.url}" class="ext_btn ext_btn_success mr20">下载</a>
                        <input class="ext_btn ext_btn_error mr20" value="删除" type="button"  onclick="del(${resource.id})" /><!--如果不是管理员登录就不显示删除按钮-->
                         <c:if test="${resource.state != 2 && resource.state != 3}">
                       	  	<input class="ext_btn ext_btn_success" value="分享资源"  onclick="share(this,${resource.id})" data-type="-1"  type="button"/>
                       	  </c:if>
                         <c:if test="${resource.state == 2 || resource.state == 3}">
                       	  <input class="ext_btn ext_btn_error" value="取消分享" type="button" onclick="share(this,${resource.id})" data-type="1"/>
                         </c:if>
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
   </div>
</div>
 <script type="text/javascript">
 
 var $courseResStr=$("#courseResStr");
 //分页方法
 function PageTmp(name,courseId,size,page){
 	var htmlStr = "";
 	$.ajax({
		  type: "POST",
		  url: "${res}/resource/myCourseResList.html",
		  processData:true,
		  data:{"keyWords":name,'courseId':courseId,'pageSize':size,'pageNum':page},
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $courseResStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(name,courseId,size,page);
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
 	 $courseResStr.empty();
 	$.each(datas, function (index, resource) {
			htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='"+resource.id+"' type='checkbox' id="+resource.id+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+resource.name+"</td>";
			var createDate = new Date(resource.createDate);
			htmlStr+="<td>"+createDate.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
			htmlStr+="<td>"+resource.fileTypePo.name+"</td>";
			if (resource.state != 2 && resource.state != 3) {
					htmlStr+='<td class="f00 stauts">未分享</td>';
	            } 
			if(resource.state == 2 || resource.state == 3){
	            	htmlStr+='<td class="green stauts">已分享</td>';
	            }
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+='<a href="${res }/upload/downFile.html?fn='+resource.url+'&fName='+resource.name+'" class="ext_btn ext_btn_success mr20">下载</a>';
			htmlStr+="<input class='ext_btn ext_btn_error mr20' value='删除'  onclick='del("+resource.id+");' type='button'> ";
			if (resource.state != 2 && resource.state != 3) {
				htmlStr+='<input class="ext_btn ext_btn_success" value="分享资源" type="button" onclick="share(this,'+resource.id+')" data-type="-1">';
            } 
			if(resource.state == 2 || resource.state == 3){
            	htmlStr+='<input class="ext_btn ext_btn_error" value="取消分享" type="button" onclick="share(this,'+resource.id+')" data-type="1">';
            }
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
      });
		  $courseResStr.append(htmlStr);
 }

//搜索条件查询列表
 $(".search").click(function(){
		var name= $("input[name='name']").val();
		var courseId = $(".select").val();
		PageTmp(name,courseId);
})

 //初始化时就调用
 jQuery(function ($) {
	 PageTmp(); 
 });
 
function share(obj,id){
    var state= $(obj).attr("data-type");
    if(state=="-1"){
        var hint="确认分享资源?";
    }else{
        var hint="确认取消分享资源?";
    }
    layer.confirm(hint,{icon: 3, title:'提示'},function(){ 
    layer.closeAll();
    if(state=="-1"){
        if(doShare(id,1)){//1表示分享
        	$(obj).attr("data-type","1");
            $(obj).val("取消分享").addClass("ext_btn_error").removeClass("ext_btn_success");
            $(obj).parent().parent().siblings(".stauts").text("已分享").addClass("green").removeClass("f00");
        }else{
           //alert("数据请求失败！");
           layer.msg('数据请求失败！',{icon:2});
        }     
    }else if(state=="1"){
        if(doShare(id,-1)){//-1表示取消
        	$(obj).val("分享资源").addClass("ext_btn_success").removeClass("ext_btn_error");
            $(obj).attr("data-type","-1"); 
            $(obj).parent().parent().siblings(".stauts").text("未分享").addClass("f00").removeClass("green");
        }else{
           //alert("数据请求失败！");
            layer.msg('数据请求失败！',{icon:2});
        }      
     }  
    });
    
}

//请求数据接口-开启或者取消分享
function doShare(id,type){
    //把id,和type传给服务器端，服务器端修改成功返回true,修改失败返回false;
	 var status = false;
		$.ajax({
			url:"shareRes.html",
			type:"post",
			async: false,
			data:{fileId:id,type:type,fileType:1},
			success:function(date){
				if(date==1){
					status = true;
				}
			}
		}); 
		return status;
}

//ajax加载的每条数据的id号的数组  
var removeButtonIndexArr = [105,106,107,108,109,110,111,112,113,114]; 
//点击单条删除按钮删除该行数据
function del(removeButtonIndex){
       layer.confirm('你确定删除选中的资源吗？',{icon: 3, title:'提示'},function(){
       	$.ajax({
       		url:"delResource.html",
       		type:"post",
       		dataType: "json",
       		data:{fileId:removeButtonIndex,fileType:1},
       		success:function(data){
       			if(1 == data.flag){
					  layer.alert(data.msg,{icon:1},function(){
	      				  document.location.href=" ${res}/resource/myCourseResList.html";
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
        		  data:{fileIds:fileIds,fileType:1},
        		  dataType: "json",
        		  success:function(data){
        			  if(1 == data){
    					  layer.alert("批量删除成功！",{icon:1},function(){
    	      				  document.location.href=" ${res}/resource/myCourseResList.html";
    	      			  });
    					
    		    		}else {
    		    			layer.alert("批量删除失败！",{icon:2});
    		    		}
        		  	}
        		  });
      });
  };
}
function downAll(){
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
	
	  if(fileIds.length==0){
		  layer.alert("请选择资源",{icon:2});
		  }else{
	  document.location.href=" ${res}/upload/2/downFiles.html?fileIds="+fileIds;
		  }
}

</script>
</body>
</html>
