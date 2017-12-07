<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知信息列表</title>
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
       <li><a href="#">通知信息列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="${res}/admin/message/toAdd.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>发布通知</a></li>
            <li onclick="delAll();"><span><img src="${res}/images/t03.png"></span>全部删除</li>
       </ul>
    </div>
    <ul class="prosearch">
           <li>
               <i>通知标题:</i><a><input name="name" class="input-text" placeholder="通知关键字" type="text" value="${page.keywords}"></a>
               <a><input name="" class="search" value="查询" type="button"></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>通知信息列表</span></div>

         <table class="tablelist">
          <thead>
              <tr>
                    <th width=""><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th width="5%">序&nbsp;&nbsp;号</th>
                    <th width="">标&nbsp;&nbsp;题</th>
                    <th width="10%">发布人</th>
                 	<th width="10%">接收人</th>
                    <th width="12%">发布时间</th>
                    <th width="300" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="messageStr"> 
               
            </tbody>
        </table>
        <!--分页-->
        <div class="pagin" id="pageToolbar">
        </div>
        <!--分页 end-->
     </div>
</div>
 <script type="text/javascript">
 var  $messageStr=$("#messageStr");
//分页方法
function PageTmp(name,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/message/list.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"keyWords":name,},
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $messageStr.empty();
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
	$messageStr.empty();
	  $.each(datas, function (index, message) {
		    htmlStr+="<tr>";
			//htmlStr+=" <input name='loginId' value="+user.loginPo.loginId+" type='hidden' id="+user.loginPo.loginId+">";
			htmlStr+="<td><input name='ur_checkbox' value='"+message.messageId+"' type='checkbox' id="+message.messageId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+message.title+"</td>";
			htmlStr+="<td>"+message.fromUser.name+"</td>";
			htmlStr+="<td>"+message.toUser.name+"</td>";
			var fromDate = new Date(message.fromDate);
			htmlStr+="<td>"+fromDate.pattern("yyyy-MM-dd hh:mm:ss")+"</td>";
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+='<a href="${res}/admin/message/toEdit.html?messageId='+message.messageId+'" class="ext_btn ext_btn_submit mr10">修改</a>';
			htmlStr+='<a href="${res}/admin/message/detail.html?messageId='+message.messageId+'" class="ext_btn ext_btn_success mr10">查看</a>';
			htmlStr+="<input class='ext_btn ext_btn_error' value='删除'  onclick='del("+message.messageId+")' type='button'> ";
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
 });
	  $messageStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
	var name=$("input[name='name']").val();
	PageTmp(name);
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});

//删除全部选中的行数
function delAll(){
	var messageIds = [];
  //设置一个空数组，存储被删除的行数
  var nullArr = [];
  //取得所有name值为ur_checkbox的input:checkbox存入数组
  var selectBoxNum = $("[name='ur_checkbox']");
  //设置一个中间变量判断input:checkbox全部没有选中，如果tmp=0则都未选中  
  var tmp = 0;

  //循环name值为ur_checkbox的input:checkbox,如果input:checkbox有选中,tmp++
  for (var i = 0; i < selectBoxNum.length; i++) {
    if (selectBoxNum[i].checked == true) {
    	messageIds.push( $("[name='ur_checkbox']").eq(i).val());
			
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
      content:'请选择你要删除的通知！' 
    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的通知吗？',{icon: 3, title:'提示'},function(){
     	
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
          $("[name='ur_checkbox']").eq(nullArr[i]).parent("td").parent("tr").remove();
        };
        
        $.ajax({
		 	url:'${res}/admin/message/delAll.html',
           type:'post',
           contentType : "application/x-www-form-urlencoded",
           data:{
           	messageIds:messageIds
           	
           },
 		success : function(data){
 			if(data.flag=="1"){
 				window.location.href="${res}/admin/message/list.html"
 			}
 		}
		});
   
      });
    
   };
} 


/*  单条记录删除*/
function del(messageId){
	var messageId = messageId;
 	layer.confirm('你确定删除选中的通知吗？',{icon: 3, title:'提示'},function(){ 
	layer.closeAll();
	  	$.ajax({
	  		url:'${res}/admin/message/del.html',
         	type:'post',
        	dataType:'json',
      		contentType : "application/x-www-form-urlencoded",
       	data:{
       		messageId:messageId
         	
         },
        success : function(data){
     	   
			
		
			if(data.flag=="1"){
				layer.confirm(data.msg,{icon: 3, title:'提示'},function(){ 
					layer.closeAll();	
        
			window.location.href="${res}/admin/message/list.html"/* ?pageNum="+pageNum+"&keyWords="+$('.input-text').val() */;
				})
			}
		}
	  	})


});
}

$(".paginList .paginItem").click(function(){
    			 var pageNum =  $(this).find("a").text();

    		
    			window.location.href="{res}/message/list.html?pageNum="+pageNum+"&keywords="+$('.input-text').val();
    		})

</script>    
</body>
</html>