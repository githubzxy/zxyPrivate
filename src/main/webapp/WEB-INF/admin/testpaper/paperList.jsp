<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>试卷信息列表</title>
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/global.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
<script type="text/javascript">
</script>
</head>
 
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">试卷信息列表</a></li>
    </ul>
</div>
<div class="rightinfo">
 <div class="tools">
            <ul class="toolbar">
            <li><a href="topaper.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>新建试卷</a></li>
            <li onclick="delAll();"><span><img src="${res}/images/t03.png"></span>批量删除</li>
       </ul>
    </div>
    <form id="conditions">
    <ul class="prosearch">
           <li>
               <i>试卷用途:</i>
               <a>
                     <select name="functionId" class="select" id="subjectType"> 
                        <option value="" selected="selected">请选择</option>
                         <option value="1" <c:if test="${page.functionId==1}">selected</c:if>>用于作业</option>
                        <option value="2" <c:if test="${page.functionId==2}">selected</c:if>>用于考试</option>
                        <option value="3" <c:if test="${page.functionId==3}">selected</c:if>>作业、考试均可</option>
                      </select>
                </a>
            <i>课程类型:</i>
                <a>
                  <select name="courseTypeId" class="select" id="courseType" onchange="getCourse()"> 
                        <option value="" selected="selected">请选择</option>
                        <c:forEach items="${types}" var="type">
                        <option value="${type.courseTypeId}" <c:if test="${type.courseTypeId==page.courseTypeId}">selected</c:if>>${type.typeName}</option>
                        </c:forEach>
                      </select>
                </a>
            <i>所属课程:</i>
                <a>
                   <select name="openId" class="select" id="course" onchange="getVideo(1,'')"> 
                        <option value="" selected="selected">请选择</option>
                         <c:forEach items="${courses}" var="course">
                        <option value="${course.openId}" <c:if test="${course.openId==page.openId}">selected</c:if>>${course.courseName}</option>
                        </c:forEach>
                      </select>
                </a>
               <i id="idOfSelectedVideo"><i>选择视频:</i>
               <a><select name="videoId" class="select" id="video"> 
                        <option value="" selected="selected">请选择</option>
                         <c:forEach items="${videos}" var="video">
                        <option value="${video.videoId}" <c:if test="${video.videoId==page.videoId}">selected</c:if>>${video.name}</option>
                        </c:forEach>
                      </select>
               </a>
               </i>
                <i>试卷名称:</i>
                <a><input name="paperTitle" class="input-text" placeholder="试卷名称" type="text" value="${page.paperTitle}"/></a>
                <a><input name="" class="search" value="查询" type="button"/></a>
           </li>
    </ul>
    </form>
    <div class="formbody">
        <div class="formtitle"><span>试卷信息列表</span></div>
     <%-- <c:if test="${empty papers}">
         <p>暂无试卷信息</p>
       </c:if> 
      <c:if test="${!empty papers}"> --%>
      
         <table class="tablelist">
          <thead>
              <tr>
                    <th width=""><input name="ur_allSelect" value="" type="checkbox" id="allSelect"/></th>
                    <th width="">序&nbsp;&nbsp;号</th>
                    <th width="">试卷名称</th>
                    <th width="">所属课程</th>
                    <th width="">所属视频</th>
                    <th width="">试卷题数</th>
                    <th width="">总分</th>
                    <th width="">创建用户</th>
                    <th width="158" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="paperStr"> 
            <c:forEach items="${papers}" var="paper" varStatus="status">
            
                <tr>
                    <td><input name="ur_checkbox" value="${paper.paperId}" type="checkbox"/></td>
                    <td>${status.index+1+(page.pageNum-1)*page.pageSize}</td>
                    <td>${paper.title}</td>
                    <td>${paper.courseName}</td>
                    <td>${paper.videoName}</td>
                    <td>${paper.subjectNum}</td>
                    <td>${paper.totalScore}</td>
                    <td>${paper.teacherName}</td>
                    <td>
                       <span class="pl25 ml15"> 
                           <input class="ext_btn ext_btn_error" value="删除"  onclick="del(${paper.paperId});" type="button"/>
                       </span> 
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
       
        <!--分页-->
        <%-- </c:if> --%>
        <div id="pageToolbar">
     </div>
     </div>
    
<script type="text/javascript">

var  $paperStr=$("#paperStr");
//分页方法
function PageTmp(keyWords,openId,videoId,functionId,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/paper/list.html",
		  processData:true,
		  data:{"keyWords":keyWords,'pageSize':size,'pageNum':page,'openId':openId,'videoId':videoId,'functionId':functionId},
		  dataType: "json",
		  success: function(data){
			  if(data.page.list.length>0){
				
			  if((typeof(size) == "undefined")){
				
				  var htmlStr = "";
				  $paperStr.empty();
				  $("#pageToolbar").empty();
				 
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(keyWords,openId,videoId,functionId,size,page);
				  }}); 
			  }
			HtmlTmp(data.page.list,htmlStr,data.page.startIndex);
			  }else{
				 
				  $("#pageToolbar").empty();
				  $paperStr.html("暂无试卷信息");
			  }
		  },
		  
		  error:function(e){
			  alert("获取试卷信息出错");
		  }
		 });
};
//列表拼接方法
function HtmlTmp(datas,htmlStr,startIndex){
	 $paperStr.empty();
	$.each(datas, function (index, paper) {
			htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='"+paper.paperId+"' type='checkbox' id="+paper.paperId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+paper.title+"</td>";
			htmlStr+="<td>"+paper.courseName+"</td>";
			if(paper.videoName!=null){
			htmlStr+="<td>"+paper.videoName+"</td>";
			}else{
				htmlStr+="<td>无</td>";
			}
			htmlStr+="<td>"+paper.subjectNum+"</td>";
			htmlStr+="<td>"+paper.totalScore+"</td>";
			htmlStr+="<td>"+paper.teacherName+"</td>";
			
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+="<input class='ext_btn ext_btn_error ' value='删除'  onclick='del("+paper.paperId+");' type='button'> ";
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
     });
		  $paperStr.append(htmlStr);
}
var functionId;
var keyWords;
var openId;
var videoId;
//搜索条件查询列表
$(".search").click(function(){
	
		 functionId=$("#subjectType").val();
		 keyWords=$("input[name='paperTitle']").val();
		 openId=$("#course").val();
		if($("#subjectType").val()!=2){
		 videoId=$("#video").val();
		}
	
		
		 // document.location.href="list.html?functionId=${page.functionId}&&courseTypeId=${page.courseTypeId}&&openId=${page.openId}&&videoId=${page.videoId}&&paperTitle=${page.paperTitle}";
		PageTmp(keyWords,openId,videoId,functionId);
		
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});

  //根据试卷用途显示或隐藏 选择视频 的筛选条件
$("#subjectType").change(function(){
    if ($(this).get(0).selectedIndex!=2) {
      $("#idOfSelectedVideo").show();
    } else {
      $("#idOfSelectedVideo").hide();
   
      $("#video").val("");
    
    };
  });
//根据课程类型获取已开课程
function getCourse(){
	var courseTypeId=$("#courseType").val();
	    if(courseTypeId!=null&&courseTypeId!=""){
		$.ajax({
			type:"post",
			url:"getCourseByType.html",
			data:{courseTypeId:courseTypeId},
			dataType: "json",
			success:function(result){
				var courses= result.courses;
				var courseSelect=document.getElementById('course');
			 if(courses==null||courses.length<1){
				 courseSelect.options.length=0;
				 var op=document.createElement("option");
				 op.setAttribute("value","");          // 设置OPTION的 VALUE 
				 op.appendChild(document.createTextNode("暂无课程")); // 设置OPTION的 TEXT
				 courseSelect.appendChild(op);
				 getVideo(1,"");
			}else{
				courseSelect.options.length=0;
				for(var i=0;i<courses.length;i++){
				var op=document.createElement("option");      // 新建OPTION (op) 
				op.setAttribute("value",courses[i].openId);          // 设置OPTION的 VALUE 
				op.appendChild(document.createTextNode(courses[i].courseName)); // 设置OPTION的 TEXT
				courseSelect.appendChild(op);           // 为SELECT 新建一 OPTION(op)
               
				}
				
				getVideo(0,courses[0].openId);
				
			}  
			
		},
		
		});
	    }
			
		
	}
//根据已开课程获取视频（flag=1：表示改变所属课程列表；flag=0：三级联动）
function getVideo(flag,openId){
	if(flag==1){
	 openId=$("#course").val();
	}

	var videoSelect=document.getElementById('video');
	    if(openId!=null&&openId!=""){
		$.ajax({
			type:"post",
			url:"getVideoByOpenCourse.html",
			data:{openId:openId},
			dataType: "json",
			success:function(result){
				var videos= result.videos;
			 if(videos==null||videos.length<1){
				 videoSelect.options.length=0;
				 var op=document.createElement("option");
				 op.setAttribute("value","");          // 设置OPTION的 VALUE 
				 op.appendChild(document.createTextNode("暂无视频")); // 设置OPTION的 TEXT
				 videoSelect.appendChild(op);
			}else{
				videoSelect.options.length=0;
				for(var i=0;i<videos.length;i++){
				var op=document.createElement("option");      // 新建OPTION (op) 
				op.setAttribute("value",videos[i].videoId);          // 设置OPTION的 VALUE 
				op.appendChild(document.createTextNode(videos[i].name)); // 设置OPTION的 TEXT
				videoSelect.appendChild(op);           // 为SELECT 新建一 OPTION(op)
				}
			}  
			
		},
		
		});
	    }else{
	    	 videoSelect.options.length=0;
			 var op=document.createElement("option");
			 op.setAttribute("value","");          // 设置OPTION的 VALUE 
			 op.appendChild(document.createTextNode("暂无视频")); // 设置OPTION的 TEXT
			 videoSelect.appendChild(op);
	    }
	}	
		
	
//请求数据接口-开启或者取消分享
function doLogout(pid,type){
    //把id,和type传给服务器端，服务器端修改成功返回true,修改失败返回false;
   return true;
}
 //点击单条删除按钮删除该行数据
function del(removeButtonIndex){
	
        layer.confirm('你确定删除选中的试卷吗？',{icon: 3, title:'提示'},function(){
        	layer.closeAll();
          $.ajax({
      	    type:'POST',
      		  url:"delete.html",
      		  data:{paperId:removeButtonIndex},
      		  dataType: "json",
      		  success:function(data){
		  if(data.flag==1){
			  layer.alert("删除成功",{icon:1},function(){
				  layer.closeAll();
				  PageTmp(keyWords,openId,videoId,functionId);
				  $("[name='ur_checkbox']").eq(tmp).parent("td").parent("tr").remove();
			  }); 
			  
				 
				
				  
				 
			  
		  }else{
			  layer.alert("删除失败",{icon:2},function(){
				  layer.closeAll();
			  });
		  }
      		  }
      		  });
        });
        
      };  
//删除全部选中的行数
function delAll(){
  //设置一个空数组，存储被删除的行数
  var nullArr = [];
  //取得所有name值为ur_checkbox的input:checkbox存入数组
  var selectBoxNum = $("[name='ur_checkbox']");
  //设置一个中间变量判断input:checkbox全部没有选中，如果tmp=0则都未选中  
  var tmp = 0;
  var paperIds= [];

  //循环name值为ur_checkbox的input:checkbox,如果input:checkbox有选中,tmp++
  for (var i = 0; i < selectBoxNum.length; i++) {
    if (selectBoxNum[i].checked == true) {
      tmp++;
      paperIds.push(selectBoxNum.eq(i).val());  
    
    };
  };

  //当tmp=0时，input:checkbox全部未被选中，弹出弹框；否则执行删除操作
  if (tmp == 0) {
    //当tmp=0时，弹出提示框
    layer.open({
      time: 2000, //2s后自动关闭
      title: '提示' , 
      icon:2,  
      content:'请选择你要删除的试卷！' 
    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的试卷吗？',{icon: 3, title:'提示'},function(){
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
        		  url:"deleteAll.html",
        		  data:{paperIds:paperIds},
        		  dataType: "json",
        		  success:function(data){
		  if(data.flag==1){
			  layer.alert("删除成功",{icon:1},function(){
				layer.closeAll();
			PageTmp(keyWords,openId,videoId,functionId);
				  
			  });
			   //循环nullArr执行逆序删除，删除每行样式和删除removeButtonIndexArr中的值
			  for (var i = nullArr.length-1; i >= 0  ; i--) {
		          $("[name='ur_checkbox']").eq(nullArr[i]).parent("td").parent("tr").remove();
		        };
		  }else{  layer.alert("删除失败",{icon:2},function(){
			  layer.closeAll();
		  });
		  }
        		  }
        		  });
      
     
      });
  };
}
var oneArr = ['1班','2班','3班','4班'];
var twoArr = ['2班','3班','4班','5班'];
var threeArr = ['3班','4班','5班','6班'];
var changeArr = [oneArr,twoArr,threeArr];

function changeMethod(obj) {
  var tmpArr = changeArr[$(obj).get(0).selectedIndex];
  $(".changeClass").html("");
  for (var i = 0; i < tmpArr.length; i++) {
    $(".changeClass").html($(".changeClass").html() + '<option>'+ tmpArr[i] +'</option>' );
  };
  
}


</script>    
</body>
</html>
