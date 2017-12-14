<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.yz.center.util.BaseUtil" %>
<%String url = BaseUtil.getValueFormProperties("uploadPath"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发布通知</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${res}/umeditor/themes/default/css/umeditor.css">
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">发布通知</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>发布通知</span></div>
     <div class="padding5">
      <form class="fbafficheform" action="#">
        <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">通知标题：</td>
                <td class=""> <input name="name" id ="title" class="input-text" size="50" type="text"  datatype="*"></td>
                 <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                </tr>
             
                 <tr>
                  <td class="td_right">通知内容：</td>
                  <td class="">
                   <script type="text/plain"  name="content" id="myEditor" style="width:600px;height:240px;">
                <p></p>
               </script>
                  </td>
                   <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                 </tr>
                 <tr>
                  <td class="td_right">被通知人类型：</td>
                  <td><input type="radio" value="教师" name="status"  id="" datatype="*" errormsg="请选择被通知人！"><label>教师</label> &nbsp;&nbsp;&nbsp;
                  <input type="radio" value="学生" name="status" id=""><label>学生</label></td>
                  <td width="500"><span class="Validform_checktip" style="color:#f00;">*必填项</span></td>
                 </tr>
                  <tr class="courseAll">
                    <td class="td_right" valign="top" >被通知人名称：</td>
                    <td>
                      <a style="padding-left:20px;color:#f00;" id="clear" >清空</a>
                      <div class="ycourse" ></div>
                    </td>
                   </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" id="addAdvice" class="ext_btn ext_btn_submit"  value="确认发布" type="button">
                   </td>
                    <td width="500"></td>
                 </tr>
               </tbody>
          </table>
        </form>
     </div>
  </div>
</div>
<!--教师选择-->
<div class="chooseTip" id="courseList" style="overflow-y: scroll; overflow-x: hidden;">
      <div class="chooseTiptop"><span>选择被通知人</span><a></a></div>
      <ul class="prosearch" style="padding: 0 20px;">
         <li>
         	  <i>所属班级:</i>
         	  <select id="classId" name="" class="select" id="subjectType" style="display:block;float:left;margin-right:12px;width:120px;"> 
              <option value="">请选择</option> 
                <c:forEach items = "${requestScope.classPos}" var = "list" varStatus="status">
                   <option value="${list.classId}">${list.gradePo.name}${list.major}${list.name}</option> 
                </c:forEach>
              </select>
              <i>关键字查询:</i><a><input name="keywords" class="input-text" placeholder="名字" type="text"></a>
              <a ><input  class="search" value="查询" type="button" ></a>
         </li>
      </ul> 
      <div class="chooseinfo chooseteacherinfo">
        <table class="tablelist lecturerTable" style="border-left:none;border-right:none;"  >
          <thead>
              <tr>
                    <th width="4%"><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th>选择</th> 
                    <th width="15%">职位</th>
                    <th>姓名</th>
                </tr>
            </thead>
            <tbody id="teacherList"> 

            </tbody> 
         </table> 
          <!--分页-->
        <div class="pagin" id="pageToolbar">
        </div>
        <!--分页 end-->
         
      </div>
      <div class="chooseTiptopbtn" style="text-align:center;margin: 35px; 0 0 0;">
            <input name="" type="button"  class="sure" value="确定" id="fbnotice_sure" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="" type="button"  class="sure" value="选择所有" id="fbnotice_all" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="" type="button"  class="cancel" value="取消" id="ur_cancel" />
      </div>
</div>   
<!--教师选择 end-->
<!--遮罩层-->
<div class="mask"></div>
<script> var imageUrlOfReal="<%=url%>";</script>
<!--遮罩层 end-->
 <script type="text/javascript" src="${res}/umeditor/third-party/template.min.js"></script>
 <script type="text/javascript" charset="utf-8" src="${res}/umeditor/umeditor.config.js"></script>
 <script type="text/javascript" charset="utf-8" src="${res}/umeditor/umeditor.min.js"></script>
 <script type="text/javascript" src="${res}/umeditor/lang/zh-cn/zh-cn.js"></script>
 <script type="text/javascript">

//实例化编辑器
 var um = UM.getEditor('myEditor'); 
  $(function(){  
	 var toUsers = [];
	 var classIds ;
    $(".fbafficheform").Validform({
      tiptype:2
    });

    //选择学生或老师
    $("input[name=status]").click(function (){
      $(".mask").show();
      $("#courseList").fadeIn(200);
      PageTmp();
    });

    /**实现确定按钮**/
    $("#fbnotice_sure").click(function(){
     $("#courseList").hide();
      //取得checkbox的集合
      
      var selectBoxNum = $("[name='ur_checkbox']");
		
      var tmp1 = 0;
      
      for (var i = 0; i < selectBoxNum.length; i++) {
        if (selectBoxNum[i].checked == true) {
      	toUsers.push($("[name='ur_checkbox']").eq(i).val()); 
          if (tmp1 == 0) {
            $(".ycourse").html("<span>" + $(".ur_tdValue").eq(i).html() + "<span/>");
            tmp1++;
          } else {
            $(".ycourse").html($(".ycourse").html() + "<span>" + $(".ur_tdValue").eq(i).html() + "<span/>");
          };
        };
      };
    });

    //选择所有老师或学生
    $("#fbnotice_all").click(function(){
      $("#courseList").hide();
      var tmp = $("input[name='status']:checked").val();
      var className =$("#classId option:selected").html();
      if($("#classId option:selected").val()!=""){
       $(".ycourse").html("<span>" +className+ "所有" + tmp + "<span/>");
      }
      if($("#classId option:selected").val()==""){
    	  $(".ycourse").html("<span>"+ "我校所有" + tmp + "<span/>");
      }
       /*
       var selectBoxNum = $("[name='ur_checkbox']");
      for (var i = 0; i < selectBoxNum.length; i++) {
      toUsers.push($("[name='ur_checkbox']").eq(i).val());
      } */ 
      if($("#classId option:selected").val()!=""){
    	  classIds = $("#classId option:selected").val();
      }else{
    	  classIds = -1; 
      }
    });

    //清空所选课程
    $("#clear").click(function(){
        $(".ycourse").find('span').remove();
        toUsers = [];
     });
    
  //分页方法
    function PageTmp(name,size,page){
	 
    	var htmlStr = "";
    	 var classId=$("#classId option:selected").val();  
		 var tmp = $("input[name='status']:checked").val();
		 var name =  $("input[name='keywords']").val();
		 if(tmp=="教师"){
	    	$.ajax({
	    		  type: "POST",
	    		  url: "${res}/admin/teacher/getTeacherByclassId.html",
	    		  processData:true,
	    		  data:{"pageSize":size,"pageNum":page,"keyWords":name,"classId":classId},
	    		  dataType: "json",
	    		  contentType : "application/x-www-form-urlencoded",
	    		  success: function(data){
	    			  if((typeof(size) == "undefined")){
	    				  var htmlStr = "";
	    				  $("#teacherList").empty();
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
		 if(tmp=="学生"){
			 $.ajax({
	    		  type: "POST",
	    		  url: "${res}/admin/student/getStudentByclassId.html",
	    		  processData:true,
	    		  data:{"pageSize":size,"pageNum":page,"keyWords":name,"classId":classId},
	    		  dataType: "json",
	    		  contentType : "application/x-www-form-urlencoded",
	    		  success: function(data){
	    			  if((typeof(size) == "undefined")){
	    				  var htmlStr = "";
	    				  $("#teacherList").empty();
	    				  $("#pageToolbar").empty();
	    				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
	    					console.log(arguments); 
	    					PageTmp(name,size,page);
	    				  }}); 
	    			  }
	    			HtmlTmp2(data.page.list,htmlStr,data.page.startIndex);
	    		  },
	    		  error:function(e){
	    			  alert("错误");
	    		  }
	    		 });
			 
			 
		 };
		 
    };
    
    
  //列表拼接方法
    function HtmlTmp(datas,htmlStr,startIndex){
    	$("#teacherList").empty();
          		$.each(datas,function(key,val){
          			htmlStr+='<tr >';
          			htmlStr+='<td><input name="ur_checkbox"  class="ur_checkbox" value='+val.userId+' type="checkbox"></td>';
          			htmlStr+='<td></td>';
          			htmlStr+='<td>教师</td>';
          			htmlStr+='<td class="ur_tdValue">'+val.name+'</td>';
          			htmlStr+='</tr>';
          		});  
    	  $("#teacherList").append(htmlStr);
    }
    
    //列表拼接方法
    function HtmlTmp2(datas,htmlStr,startIndex){
    	$("#teacherList").empty();
          		$.each(datas,function(key,val){
          			htmlStr+='<tr >';
          			htmlStr+='<td><input name="ur_checkbox"  class="ur_checkbox" value='+val.user.id+' type="checkbox"></td>';
          			htmlStr+='<td></td>';
          			htmlStr+='<td>学生</td>';
          			htmlStr+='<td class="ur_tdValue">'+val.name+'</td>';
          			htmlStr+='</tr>';
          		});  
    	  $("#teacherList").append(htmlStr);
    }
    
    
    
    

	 
	 
	 $("#addAdvice").click(function(){
		 var title = $("#title").val();
		 var content = $("#myEditor").html();
		 var tmp = $("input[name='status']:checked").val();
		 if(title==""||content==""){
			 layer.confirm('亲,请输入。。。',{icon: 3, title:'提示'},function(){ 
	    			layer.closeAll();
	    		}); 
		 }else{
		 
		 
			 $.ajax({
				 url:'${res}/admin/message/add.html', 
	     		 type:'post',
	           	 dataType:'json',
	         	 contentType : "application/x-www-form-urlencoded",
	         	 data:{
	         		title:title,
	         		content:content,
	         		classId:classIds,
	         		toUsers:toUsers,
	         		role:tmp
	            	
	            },
	           success : function(data){
	        	   if(data.flag == 1){
		        	    layer.alert(data.msg,{icon:1},function(){
	       	   				document.location.href="${res}/admin/message/list.html";
	       	   			});
	        	   }else{
	        		   layer.alert(data.msg,{icon:2});
	        	   }
	           }
	            
			 })
		 }
		 
		 
	 })

	  $(".search").click(function(){
		  PageTmp();
	  })
	 
  });
</script>
</body>
</html>
