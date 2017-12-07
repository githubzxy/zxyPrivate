
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新建作业</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<!-- <link href="plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" /> -->
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/global.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="${res}/paper/toNewHomework.html">新建作业</a></li>
    </ul>
</div>

<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>新建作业</span></div>
     <div class="padding5">
     <form action="" method="post" id="homeworkForm">
      <input name="videoId"  value="" type="hidden">
      <input name="openCourseId"  value="" type="hidden">
      <input name="paperIds"  value="" type="hidden">
       <input name="paperNum"  value="" type="hidden">
      <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">作业标题</td>
                <td class=""> <input name="title" class="input-text" size="50" type="text" value=""></td>
              </tr>
              <tr>
               <td class="td_right" valign="top">所属课程</td>
               <td><input class="x-button1" id="courseListButton" value="选择课程" type="button">
               <a style="padding-left:20px;color:#f00;" id="courseOfSelected"></a>
               </td>
              </tr>
                <tr>
               <td class="td_right" valign="top">所属视频</td>
               <td><input class="x-button1" id="videoListButton" value="选择视频" type="button" >
                <a style="padding-left:20px;color:#f00;" id="clearVideoButton">清空</a>  
                <a style="padding-left:20px;color:#f00;" id="videoOfSelected"></a>
                  <div class="ycourse namesOfVideo"></div> 
               </td>
              </tr>
                <tr>
                <td class="td_right" valign="top">选择试卷</td>
                <td><input class="x-button1" id="paperListButton" value="选择试卷" type="button">
                <a style="padding-left:20px;color:#f00;" id="clearPaperButton">清空</a>
                <a style="padding-left:20px;color:#f00;" id="paperOfSelected"></a>
                  <div class="ycourse namesOfPaper"></div>
                </td>
               </tr>
               <tr>
                 <td class="td_right">作业弹出时间</td>
                 <td>
                   <input name="showTime" class="input-text"  type="text"><a style="padding-left:20px;color:#f00;">（单位：秒，视频播放后多少秒后弹出作业）</a>
                 </td>
               </tr>              
               <tr>
                 <td class="td_right">&nbsp;</td>
                 <td class="">
                   <input name="button" class="ext_btn ext_btn_submit" value="保存提交" type="button">
                 </td>
               </tr>
             </tbody>
             <tfoot>
               <tr>
                 <td class="td_right">功能说明</td>
                 <td>
                   1,作业标题：学生参加本课程作业是显示的标题。<br />
                   2,所属开课课程：您新建的这次作业与您的所选的开课关联。<br />
                   3,所属视频：您本次新建的作业与您选择的视频关联，（注意:一个视频只能新建一次作业。）<br />
                   4,选择作业：学生做卷之前会随机的从您选择的作业中随机抽取一份作为作业。(如果您想让每个学生作业内容一样，请只选择一个试卷即可。) <br />
                   5,主观题评卷分数满分为100分，主观题最终得分=主观题所得分数*百分比；客观题的最终得分=客观题所得分数*（1-主观题百分比),主观题百分比默认为0 
                 </td>
               </tr> 
             </tfoot>
          </table>
         </form>
     </div>
  </div>
</div>
<!--课程选择-->
<div class="chooseTip" id="listOfCourse"  style="overflow:auto">
      <div class="chooseTiptop"><span>选择所属课程</span><a onclick="closeAll(this);"></a></div> 
      <ul class="prosearch" style="padding: 0 20px;">
         <li>
              <i>关键字查询:</i><a><input name="search_course" class="input-text" placeholder="请输入课程类别关键字" type="text"></a>
              <a><input name="" class="search" value="查询" type="button"></a>
         </li>
      </ul> 
      <div class="chooseinfo">
        <table class="tablelist" style="border-left:none;border-right:none;">
          <thead>
              <tr>
                    <th width="10%">选择</th>
                    <th>课程名称</th>
                    <th width="28%">课程类别</th>
                    <th width="15%">创建作者</th>
                </tr>
            </thead>
            <tbody id="courses"> <!--请循环8条数据-->
            <%-- <c:forEach items="${courses}" var="course">
               <tr>
                    <td><input name="npt_checkbox"  class="npt_checkbox" value="${course.courseId}" type="checkbox"></td>
                    <td class="ntp_tdValue">${course.courseName}</td>
                    <td>${course.courseTypePo.typeName}</td>
                    <td>${course.userPo.name}</td>
                </tr>
            </c:forEach> --%>
            </tbody>
          </table>
          
          <!--分页-->
        <div class="pagincourse pagin">
           
        </div>
        <!--分页 end-->  
      </div>
      <div class="chooseTiptopbtn" style="margin:35px 0 0 0;text-align:center;">
            <input name="" type="button"  class="sure" value="确定" id="selectCourseButton" />
      </div>
</div>   
<!--课程选择 end-->
<!--视频选择-->
<div class="chooseTip" id="listOfVideo"  style="overflow:auto">
      <div class="chooseTiptop"><span>选择所属视频</span><a onclick="closeAll(this);"></a></div> 
     <!--  <ul class="prosearch" style="padding: 0 20px;">
         <li>
              <i>关键字查询:</i><a><input name="" class="input-text" placeholder="" type="text"></a>
              <a><input name="" class="search" value="查询" type="button"></a>
         </li>
      </ul>  -->
      <div class="chooseinfo">
        <table class="tablelist" style="border-left:none;border-right:none;">
          <thead>
              <tr>
                    <th width="7%">选择</th>
                    <th>视频名称</th>
                    <th>试卷套数</th>
                    <th>是否已有作业</th>
                </tr>
            </thead>
            <tbody id="video"> <!--请循环8条数据--> 
            </tbody>
            
          </table>
           <!--分页-->
        <div class="paginvideo pagin">
           
        </div>
        <!--分页 end-->  
      
      </div>
      <div class="chooseTiptopbtn" style="margin:35px 0 0 0;text-align:center;">
            <input name="" type="button"  class="sure" value="确定" id="selectVideoButton" />
      </div>
</div>   
<!--视频选择 end-->

<!--试卷列表-->
<div class="chooseTip" id="paperList"  style="overflow:auto">
      <div class="chooseTiptop"><span>选择所属试卷</span><a onclick="closeAll(this);"></a></div> 
      <div class="chooseinfo">
        <table class="tablelist" style="border-left:none;border-right:none;">
          <thead>
              <tr>
                    <th width="10%"><input name="up_allSelect"  value="" type="checkbox" id="allPaperSelect">选择</th>
                    <th>试卷名称</th>
                    <th>创建人</th>
                    <th>创建时间</th>
                </tr>
            </thead>
            <tbody id="paper"> <!--请循环8条数据-->
                
            </tbody>
          </table>
           <!--分页-->
        <div class="paginpaper pagin">
           
        </div>
        <!--分页 end-->  
      </div>
      <div class="chooseTiptopbtn" style="margin:35px 0 0 0;text-align:center;">
           <div style="margin:0 0 0 160px;float:left;"><input name="" type="button"  class="sure" value="确定" id="np_sure" /></div>
            <div style="margin:0 0 0 40px;float:left;"><input name="" type="button"  class="sure" value="选择所有" id="npt_all" /></div>
            <div style="margin:0 0 0 40px;float:left;"><input name="" type="button"  class="cancel" value="取消" id="npt_cancel" /></div>
            
      </div>
</div> 
  
<!--视频列表 end-->
<!--遮罩层-->
<div class="mask"></div>
<!--遮罩层 end-->
<script type="text/javascript">
var pageSize=8  //设置每页默认8条数据
var courseId;
var videoId;
var openId;
var paperNum;
//弹框上的关闭按钮
 function closeAll(m) {
    $(".mask").hide();
    $(m).parent().parent().hide();
 };

 $(function(){
	//课程列表被点击
	  $("#courseListButton").click(function(){
		getcourses(1,"");  
	    $(".mask").show();
	    $("#listOfCourse").fadeIn(200);
	  });

	  /**课程列表实现确定按钮**/
	    $("#selectCourseButton").click(function(){ 
	      //tmp1:判断有几个npt_checkbox被选择
	      //tmp2:取得当npt_checkbox时，npt_checkbox是第几个
	      var tmp1 = 0;
	      var tmp2 = 0;
	      $("[name='npt_checkbox']").each(function(i,val){
	        if (val.checked == true) {
	        openId=$(this).val();
	          tmp2 = i;
	          tmp1++;
	        };
	      });


      if (tmp1 == 1) {
    	  $("#videoOfSelected").html("");//再次选择课程时，将之后视频选择清空
    	  $("#clearPaperButton").siblings(".namesOfPaper").find("span").remove();//再次选择课程时，将之后试卷选择清空
    	   $('input[name="openCourseId"]').val(openId);
        //给courseOfSelected赋值，显示选择的课程
        $("#courseOfSelected").html($(".ntp_tdValue").eq(tmp2).html());
        //隐藏listOfCourse
        $("#listOfCourse").hide();
        //让[name='npt_checkbox']处于未选中状态
        $("[name='npt_checkbox']").each(function(i,val){
          $(val).attr('checked',false);
        });
      } else {
        $(".mask").show();
        layer.alert('请选择一门课程！', {icon: 0});
      };

    });
   
  

  //视频列表被点击
    $("#videoListButton").click(function(){
         var courseOfSelectedHtml = "选择视频之前请先选择课程!";
         if ($("#courseOfSelected").text() == "" || $("#courseOfSelected").text() == courseOfSelectedHtml) {
           $("#courseOfSelected").html(courseOfSelectedHtml);
         } else {
        	  getvideos(1,openId);
        	 $(".mask").show();
             $("#listOfVideo").fadeIn(200);
         };
     
    });

    /**视频列表实现确定按钮**/
      $("#selectVideoButton").click(function(){ 

        //tmp1:判断有几个npt_checkbox被选择
        //tmp2:取得当npt_checkbox时，npt_checkbox是第几个
        var tmp1 = 0;
        var tmp2 = 0;
        $(".nvt_checkbox").each(function(i,val){
          if (val.checked == true) {
        	 videoId=$(this).val();
        	 paperNum=$(".paperNum").eq(i).text();
        	var num=$(".num").eq(i).text();
            tmp2 = i;
            IsHomeworkReapet(num,tmp2);//判断是否已有作业
            tmp1++;
          };
        });

        if (tmp1 == 1) {
        $("#clearPaperButton").siblings(".namesOfPaper").find("span").remove();//再次选择视频时，将之后试卷选择清空 	
         $('input[name="paperNum"]').val(paperNum);
      	/*  alert(courseId); */

          //让[name='npt_checkbox']处于未选中状态
          $(".nvt_checkbox").each(function(i,val){
            $(val).attr('checked',false);
          });
        } else {
          $(".mask").show();
          layer.alert('请选择一个视频！', {icon: 0});
        };

      });

    //试卷列表被点击
    $("#paperListButton").click(function(){
      var videoOfSelectedHtml = "选择试卷之前请先选择视频!";
      if ($("#videoOfSelected").text() == "" || $("#videoOfSelected").text() == videoOfSelectedHtml) {
        $("#videoOfSelected").html(videoOfSelectedHtml);
      } else {
        getPapers(1,videoId,openId);	  
        $(".mask").show();
        $("#paperList").fadeIn(200);
      };
    });
    /**试卷列表实现确定按钮**/
    $("#np_sure").click(function(){
      $("#paperList").hide();
      //取得checkbox的集合
      var selectBoxNum = $(".up_checkbox");

      var tmp1 = 0;
      var id_array=new Array();
      var idstrs;
      for (var i = 0; i < selectBoxNum.length; i++) {
    	  
        if (selectBoxNum[i].checked == true) {
        	var paperId=  $(".up_checkbox").eq(i).val();
        	 id_array.push(paperId);//向数组中添加元素 
        	 idstrs=id_array.join(',');//将数组元素连接起来以构建一个字符串 
           	
          if (tmp1 == 0) {
            $(".namesOfPaper").html("<span>" + $(".up_tdValue").eq(i).html() + "<span/>");
            tmp1++;
          } else {
            $(".namesOfPaper").html($(".namesOfPaper").html() + "<span>" + $(".up_tdValue").eq(i).html() + "<span/>");
          };
          
        };
        
      };
      $('input[name="paperIds"]').val(idstrs);
      $('input[name="paperNum"]').val(id_array.length);//选择后的试卷套数
    });

    /**试卷列表实现取消按钮**/
    $("#npt_cancel").click(function(){
      $("#paperList").hide();
      //取得checkbox的集合
      var selectBoxNum = $(".up_checkbox");

      for (var i = 0; i < selectBoxNum.length; i++) {
        selectBoxNum[i].checked = false;
      };

      $("#allPaperSelect").attr('checked',false);

      tmp=0;
    });
    

    })
    //试卷列表选择所有试卷
    $("#npt_all").click(function(){
    	var id_array=new Array();
    	var idstrs;
    	 $('input:checkbox[name=up_checkbox]').each(function(i){
    		 id_array.push($(this).attr('value'));//向数组中添加元素 
    		 idstrs=id_array.join(',');//将数组元素连接起来以构建一个字符串 
    	
    	 });
    	 $('input[name="paperIds"]').val(idstrs);
         $('input[name="paperNum"]').val(id_array.length);
      $("#paperList").hide();
      $(".namesOfPaper").html("<span>" + "所有试卷" + "<span/>");
    });
    
    //试卷列表清空所选课程 
    $("#clearPaperButton").click(function(){
        $(this).siblings(".namesOfPaper").find("span").remove();
     });
    //视频列表清空所选视频
    $("#clearVideoButton").click(function(){
    	$("#clearPaperButton").siblings(".namesOfPaper").find("span").remove();
        $("#videoOfSelected").html("");
     });

    //选择试卷下拉框变化时，清空选择试卷和选择视频后面的文字
    $("#nt_select").change(function(){
      $("#nt_courseOfSelected").html("");
      $(".namesOfPaper").html("");
    });
    $(".ext_btn_submit").click(function(){
    	var title=$("input[name='title']").val();
    	var openCourseId=$("input[name='openCourseId']").val();
    	var videoId=$("input[name='videoId']").val();
    	var paperIds=$("input[name='paperIds']").val();
    	var showTime=$("input[name='showTime']").val();
    	if(title!=""&&openCourseId!=""&&videoId!=""&&paperIds!=""&&showTime!=""){
    	var formData=$("#homeworkForm").serialize();
    	formData = decodeURIComponent(formData,true);
    	$.ajax({
    		  type: "POST",
    		  url: "${res}/paper/homeworkAdd.html",
    		  processData:true,
    		  data:formData,
    		  dataType: "json",
    		  success: function(data){
    	    		if(1 == data.flag){
    	    			layer.alert(data.msg,{icon: 1, title:'提示'},function(){
		    				  window.location.href="${res}/homework/toHomeworkInfo.html";
		    			  });
    	    		}else{
    	    			layer.alert(data.msg,{icon: 2, title:'提示'});
    	    		}
    		  }
    		 }); 
    	}else{
    		layer.alert("请完善作业相关信息");
    	}
    })
  $(".search").click(function(){
	  keyWords=$("input[name='search_course']").val();
	  getcourses(1,keyWords);
	});
   
function getcourses(pageNum,keyWords){
	$.ajax({
		type:"post",
		url:"${res}/paper/getcoursesOftest.html",
		data:{pageNum:pageNum,keyWords:keyWords,pageSize:7},
		dataType:"json",
		success:function(data){
			var htmlStr="";
            var jsonList=data.page.list;
			$("input[name='search_course']").val(data.page.keyWords)
		if(jsonList==null||jsonList==''){
			$("#courses").html('<tr style="height:120px"><td colspan=4 ><a style="display:block;text-align:center;color:#f00;font-size:16px;font-weight:bold;" >暂无课程</a></td></tr>')
			  $('.pagincourse').empty();
		}else{
			$("#courses").empty();
			for(var i=0;i<jsonList.length;i++){
				htmlStr+="<tr>";
				htmlStr+="<td><input id='courseId' name='npt_checkbox' value='"+jsonList[i].openId+"'type='checkbox'>"+(i+1+pageSize*pageNum-pageSize)+"</td>";
				htmlStr+="<td class='ntp_tdValue'>"+jsonList[i].courseName+"</td>";
				htmlStr+="<td>"+jsonList[i].courseTypeName+"</td>";
				htmlStr+="<td>"+jsonList[i].userName+"</td>";
				htmlStr+="</tr>";
				 $("#courses").html(htmlStr);	 
				} 
			pager(data.page,keyWords,1,pageNum);	
		}  
		 
	}
	
	});  
}
function getPapers(pageNum,videoId,openId){
      	 $.ajax({
   		  type: "POST",
   		  url: "${res}/paper/getPaperByIdOfHomework.html",
   		  data:{"videoId":videoId,pageNum:pageNum,pageSize:pageSize,openId:openId},
   		  dataType: "json",
   		  success: function(data){
   			var op;//字符串拼接参数
   			$("#paper").empty();
   		    var jsonList=data.page.list;
   			if(jsonList==null||jsonList==''){
   				$('.paginpaper').empty();
   				$("#npt_all").hide();
   				$("#paper").html('<tr style="height:120px"><td colspan=4 ><a style="display:block;text-align:center;color:#f00;font-size:16px;font-weight:bold;" >暂无试卷</a></td></tr>');
   			}else{
   	    		$.each(jsonList, function (index,paper) {
      	             op+="<tr>";
      				 op+='<td><input name="up_checkbox"  class="up_checkbox" value='+paper.paperId+' type="checkbox">'+(index+1+pageSize*pageNum-pageSize)+'</td>';
      				 op+='<td class="up_tdValue">'+paper.title+'</td>';
      				 op+='<td >'+paper.teacherPo.userPo.name+'</td>';
      				 var createDate = new Date(paper.creDt);
      				 op+='<td >'+createDate.pattern("yyyy-MM-dd hh:mm:ss")+'</td>';
      				 op+="</tr>";
            		 $("#paper").html(op);	 
           		});
   	    		$("#npt_all").show();
      			pager(data.page,videoId,3,pageNum);
   	    	}
   			
   		
  		  }
  		 });
	
    	
    }
function getvideos(pageNum,openId){
		 $.ajax({
			  type: "POST",
			  url: "${res}/paper/getvideos.html",
			  processData:true,
			  data:{pageNum:pageNum,pageSize:pageSize,openId:openId},
			  dataType: "json",
			  success: function(data){
				  var op;//字符串拼接参数
				  var jsonList=data.page.list;
				  if(jsonList==null||jsonList==''||data.page.totalPage==0){
					  $('.paginvideo').empty();
		   				$("#paper").html('<tr style="height:120px"><td colspan=3 ><a style="display:block;text-align:center;color:#f00;font-size:16px;font-weight:bold;" >暂无视频</a></td></tr>');
		   			}else{
		   			 $.each(jsonList, function (index,video) {
		   	             op+=" <tr >";
		   				 op+='<td ><input  class="nvt_checkbox" value='+video.videoId+' type="checkbox">'+(index+1+pageSize*pageNum-pageSize)+'</td>';
		   				 op+='<td class="ntv_tdValue">'+video.videoName+'</td>';
		   				if(video.paperNum==null||video.paperNum==0){
		   					op+="<td class='paperNum'>无</td>";
						}else{
							op+="<td class='paperNum'>"+video.paperNum+"</td>";
						}
		   				if(video.num>0||video.num!=null){
		   					op+="<td class='num' style='color:red;'>是</td>";
						}else{
							op+="<td class='num'>否</td>";
						}
		   				op+="</tr>";
		         		$("#video").html(op);
		         		})
		         		pager(data.page,openId,2,pageNum);
		   			}
			  }
			 });
    }
//分页 num=1是课程 num=2是视频 num=3是试卷
  function pager(page,param,num,pageNum){
	  if(num==1){
		  var keyWords=param;
		}else if(num==2){
			var openId=param;
		}else{
			var videoId=param;
		}
		
		
	  if(page.totalPage>0){
	  htm = '<div class="message">共<i class="blue">'+page.totalPage+'</i>条记录，当前显示第&nbsp;<i class="blue">'+page.pageNum+'&nbsp;</i>页</div>'
		+'<ul class="paginList"><li class="paginItem">';
		if(page.pageNum>1){
           if(num==1){
        	    htm=htm+'<a href="javascript:;" onclick="getcourses('+(pageNum-1)+',\''+keyWords+'\')"><span class="pagepre"></span></a>';
			}else if(num==2){
				htm=htm+'<a href="javascript:;" onclick="getvideos('+(pageNum-1)+','+openId+')"><span class="pagepre"></span></a>';
			}else{
				htm=htm+'<a href="javascript:;" onclick="getPapers('+(pageNum-1)+","+videoId+','+openId+')"><span class="pagepre"></span></a>';
			}
			
		}else{
			htm=htm+'<a href="javascript:;"><span class="pagepre"></span></a>';
		}
		htm=htm+'</li>';
		for(var i = 1; i <=page.totalCount; i++){
			if(i==page.pageNum){
				htm = htm+'<li class="paginItem current"><a href="javascript:;">'+i+'</a></li>';
				continue;
			}
			if(num==1){
				htm = htm + '<li class="paginItem"><a href="javascript:;" onclick="getcourses('+i+',\''+keyWords+'\')">'+i+'</a></li>';
			}else if(num==2){
				htm = htm + '<li class="paginItem"><a href="javascript:;" onclick="getvideos('+i+','+openId+')">'+i+'</a></li>';
			}else{
				htm = htm + '<li class="paginItem"><a href="javascript:;" onclick="getPapers('+i+","+videoId+','+openId+')">'+i+'</a></li>';
			}
		
		}
		htm=htm+'<li class="paginItem">';
		if(page.pageNum<page.totalCount){
			if(num==1){
				htm=htm+'<a href="javascript:;" onclick="getcourses('+(pageNum+1)+',\''+keyWords+'\')"><span class="pagenxt"></span></a>';
			}else if(num==2){
				htm=htm+'<a href="javascript:;" onclick="getvideos('+(pageNum+1)+','+openId+')"><span class="pagenxt"></span></a>';
			}else{
				htm=htm+'<a href="javascript:;" onclick="getPapers('+(pageNum+1)+","+videoId+','+openId+')"><span class="pagenxt"></span></a>';
			}

		}else{
			htm=htm+'<a href="javascript:;"><span class="pagenxt"></span></a>';
		}
		htm=htm+'</li></ul>';
		// num=1是课程 num=2是视频 num=3是试卷
		if(num==1){
			$('.pagincourse').html(htm);	
		}else if(num==2){
			$('.paginvideo').html(htm);	
		}else{
			$('.paginpaper').html(htm);	
		}
	  }
  }
//判断是否已有作业
  function IsHomeworkReapet(num,tmp2){
	if (num == "是") {
			layer.alert("已有作业，请在作业列表删除后再新建!")
		} else {
			   $('input[name="videoId"]').val(videoId);
			 //给videoOfSelected赋值，显示选择的视频
	          $("#videoOfSelected").html($(".ntv_tdValue").eq(tmp2).html());
	          //隐藏listOfVideo
	          $("#listOfVideo").hide();
		}

	}
</script>
</body>
</html>
