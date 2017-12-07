<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>考试信息列表</title>
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
       <li><a href="#">考试信息</a></li>
    </ul>
</div>
<div class="rightinfo">
    <ul class="prosearch">
           <li> 
                <i>考试标题:</i><a><input name="title" id="title" class="input-text" placeholder="标题关键字" type="text"></a>
                <i>课程名称:</i>
                 <a> <select name="courseName" class="select"  id = "course"> 
                      <option value = "">------选择课程名称------</option> 
                   		<c:forEach items ="${courseNameList}" var = "test" >
					  <option value="${test.courseName}">${test.courseName}</option> 
					    </c:forEach>
                     </select>
                  </a>
                <a><input name="" class="search" value="查询" type="button"></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>考试信息列表</span></div>
         <table class="tablelist">
          <thead>
              <tr>
                    <th>选择</th>
                    <th>编&nbsp;&nbsp;号</th>
                    <th>标题</th>
                    <th>所属课程</th>
                    <th>创建人</th>
                    <th>时间</th>
                    <th>试卷套数</th>
                    <!-- <th>排&nbsp;&nbsp;序</th> -->
                    <th width="238" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody class="testStr"> 
             <%--   <c:forEach items ="${requestScope.openCourseVos}" var = "list"   varStatus="status"> --%>
              <%--  <tr>
                    <td><input name="ur_checkbox" value="" type="checkbox"></td>
                    <td>1</td>
                    <td>2</td>
                    <td><fmt:formatDate type="both" 
            						dateStyle="short" timeStyle="short" 
           					 		value="${list.createDate}" />3</td>
                   
                    
                    <td>4</td>
                    <td>5</td>
                    <td>5</td>
                     <td>
                       <span class="pl25 ml15">
                            <input class='ext_btn ext_btn_error mr10' value='删除'  onclick='del();' type='button'>
                            <a href="${res }/test/delete.html?openId=${list.openId}" class="ext_btn ext_btn_success">查看</a>
                       </span> 
                    </td>
                </tr> --%>
               <%--  </c:forEach> --%>
            </tbody>
        </table>
       <%--  <!--分页-->
        <div class="pagin">
            <div class="message">共<i class="blue">${requestScope.page.totalCount}</i>条记录，当前显示第&nbsp;<i class="blue">${requestScope.page.pageNum}&nbsp;</i>页</div>
            <ul class="paginList">
                <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
                <c:forEach var = "i" begin="1" end="${requestScope.page.pageCount}" step="1">
            		<li class="paginItem"><a href="javascript:;">${i}</a></li>
            	</c:forEach>
                <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
            </ul> 
        </div>
        <!--分页 end--> --%>
        
         <!--分页-->
       <div id="pageToolbar"></div>
        <!--分页 end-->
        
     </div>
</div>
<script type="text/javascript">
var  $testStr=$(".testStr");
var $title= $("#title");
function PageTmp(title,courseName,size,page){
	$.ajax({
		  type: "POST",
		  url: "${res}/test/testInfo.html",
		  processData:true,
		  data:{"pageSize":size,"pageNum":page,"title":title,"courseName":courseName},
		  dataType: "json",
		  success: function(data){
			  $testStr.empty();
			  if(data.page.totalPage>0){
			  if((typeof(size) == "undefined")){
				  $testStr.empty();
				  $("#pageToolbar").empty();
					  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
							console.log(arguments); 
							PageTmp(title,courseName,size,page);
						  }}); 
			  }
			HtmlTmp(data.page.list,data.page.startIndex);
			  }else{
				  $testStr.html("<tr><td colspan='9' style='text-align:center;color:red;'>暂无|･ω･｀)</td></tr>");
			  }
		  },
		  error:function(e){
			  alert("错误");
		  }
		 });
};

//抽取公共部分2
function HtmlTmp(datas,startIndex){
	 $testStr.empty();
	  $.each(datas, function (index, test) {
		var htmlStr="<tr>";
		htmlStr+='<td><input name="ur_checkbox" value="" type="checkbox"></td>';
		htmlStr+='<td>'+(++startIndex)+'</td>';
		htmlStr+='<td>'+test.title+'</td>';
		htmlStr+='<td>'+test.courseName+'</td>';
		htmlStr+='<td>'+test.name+'</td>';
		var createDate = new Date(test.createDate);
		htmlStr+='<td>'+createDate.pattern("yyyy-MM-dd hh:mm:ss")+'</td>'
		if(test.paperNum==null|test.num==0){
			htmlStr+='<td>无</td>';
		}else{
			htmlStr+='<td>'+test.paperNum+'</td>';
		}
		htmlStr+='<input  type="hidden" id="'+test.id+'" value="'+test.paperIds+'">'; 
		htmlStr+='<td>';
		htmlStr+='<span class="pl25 ml15">';
		htmlStr+="<a class='ext_btn ext_btn_error mr10'  onclick='del("+test.id+","+test.openId+");'>删除</a>";
		htmlStr+='<a href="${res }/test/toGetPaperByPaperIdsOfTest.html?paperIds='+test.paperIds+'" class="ext_btn ext_btn_success">查看</a>';
		htmlStr+='</span> '; 
		htmlStr+='</td> '; 
		htmlStr+='</tr>';
		$testStr.append(htmlStr);
    });
}

//初始化时就调用
jQuery(function ($) {
	PageTmp();
});

$(".search").click(function(){
	var title= $title.val();
	 var courseName=$('.select option:selected') .val();//选中的值
	 PageTmp(title,courseName);
 })
 function del(Id,openId){
	 layer.confirm('你确定删除选中的考试吗？',{icon: 3, title:'提示'},function(){
		  $.ajax({
			  type: "POST",
			  url: "${res}/test/testDelete.html",
			  processData:true,
			  data:{"Id":Id,"openId":openId},
			  dataType: "json",
			  success: function(data){
				  if(1 == data.flag){
					  layer.alert(data.msg,{icon: 1, title:'提示'},function(){
	      				  document.location.href=" ${res}/test/toTestInfo.html";
	      			  });
					
		    		}else if(3 == data.flag){
		    			layer.alert(data.msg,{icon: 2, title:'提示'});
		    				 
		    		}else{
		    			layer.alert(data.msg,{icon: 2, title:'提示'});
		    		}
			  }
			 });
	 })
 
}
</script>    
</body>

</html>