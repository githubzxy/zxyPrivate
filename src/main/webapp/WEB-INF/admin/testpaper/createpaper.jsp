<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新建试卷</title>
<link href="${res}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res}/css/layout.css" rel="stylesheet" type="text/css" />
<!-- <link href="plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" /> -->
<link href="${res}/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${res}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res}/js/jquery.form.js"></script>
<script type="text/javascript" src="${res}/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script type="text/javascript" src="${res}/js/global.js"></script>
<style type="text/css">
.test_num{width:120px;float:left;text-align:left;}
</style>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">新建试卷</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>新建试卷</span></div>
     <div class="padding5">
     <form id="paperForm" action="" method="post">
     <input name="courseId" type="hidden" value=""></input>
     <input name="videoId" type="hidden" value=""/>
     <input name="courseName" type="hidden" value=""/>
     <input name="videoName" type="hidden" value=""></input>
     <input name="openId" type="hidden" value=""></input>
      <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">试卷用途</td>
                  <td>
                     <select name="functionId" class="select" id="subjectType"> 
                        <option value="1" selected="selected">用于作业</option>
                        <option value="2">用于考试</option>
                        <option value="3">作业、考试均可</option>
                      </select>
                  </td>
                </tr>
                <tr>
                 <td class="td_right" valign="top">所属课程</td>
                 <td><input class="x-button1" id="courseListButton" value="选择课程" type="button"><a style="padding-left:20px;color:#f00;" id="courseOfSelected"></a>
                 </td>
                </tr>
                 <tr id="idOfSelectedVideo">
                  <td class="td_right" valign="top">选择视频</td>
                  <td><input class="x-button1" id="videoListButton" value="选择视频" type="button"><a style="padding-left:20px;color:#f00;" id="clearButton">清空</a>
                    <div class="ycourse namesOfVideo"></div>
                  </td>
                 </tr>
                 <tr>
                   <td class="td_right" valign="top">题型分数设置</td>
                   <td>单选<input type="text" name="singleSelectedSco" value="" class="input-text ntp_text"/>分，判断<input type="text" name="judgeSco" value="" class="input-text ntp_text" />分，多选<input type="text" name="multiSelectedSco" value="" class="input-text ntp_text" />分</td>
                 </tr>
                 <tr>
                   <td class="td_right" valign="top">数量设置</td>
                   <td>单选<input type="text" name="singleSelectedNum" value="" class="input-text ntp_text" onclick="getCount(1,this)" />道，判断<input type="text" value="" name="judgeNum" class="input-text ntp_text" onclick="getCount(2,this)"/>道，多选<input type="text" value="" name="multiSelectedNum" class="input-text ntp_text" onclick="getCount(3,this)"/>道</td>
                 </tr>
                 <tr>
                    <td  class="td_right" valign="top">题库现有</td>
                    <td >
                     <span  class="test_num">单选题：<a style="color:#f00;" id="1"></a>道</span>
                     <span class="test_num">判断题：<a style="color:#f00;" id="2" ></a>道</span>
                     <span class="test_num">多选题：<a style="color:#f00;" id="3" ></a>道</span>
                   </td>
                   
                 </tr>
                 <tr>
                 <td class="td_right">随机试卷套数</td>
                   <td>
                      <select name="paperItems" class="select"> 
                         <option value="1">1</option>
                         <option value="2">2</option>
                         <option value="3">3</option>
                         <option value="4">4</option>
                         <option value="5">5</option>
                         <option value="6">6</option>
                         <option value="7">7</option>
                         <option value="8">8</option>
                         <option value="9">9</option>
                         <option value="10">10</option>
                       </select>
                   </td>
                 </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" class="ext_btn ext_btn_submit" value="保存提交" type="button">
                   </td>
                 </tr>
               </tbody>
          </table>
          </form>
     </div>
  </div>
</div>
<!--课程选择-->
<div class="chooseTip" id="listOfCourse" style="overflow:auto">
      <div class="chooseTiptop"><span>选择所属课程</span><a onclick="closeAll(this);"></a></div> 
      <ul class="prosearch" style="padding: 0 20px;">
         <li>
              <i>关键字查询:</i><a><input name="search_course" class="input-text" placeholder="" type="text" value=""></a>
              <a><input name="" class="search" value="查询" type="button"></a>
         </li>
      </ul> 
      <div class="chooseinfo">
        <table class="tablelist" style="border-left:none;border-right:none;">
          <thead>
              <tr>
                    <th width="">选择</th>
                    <th>课程名称</th>
                    <th width="28%">课程类别</th>
                    <th width="15%">创建作者</th>
                </tr>
            </thead>
            <tbody id="courses"> <!--请循环8条数据-->
            </tbody>
          </table>
          <!--分页-->
          <div class="pagincourse pagin">
     
          </div>
    
    <!--分页 end-->

      </div>
      <div class="chooseTiptopbtn" style="margin:35px 0 0 0;text-align:center;">
            <input name="" type="button"  class="sure coursesure" value="确定" id="selectCourseButton" />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="" type="button"  class="cancel" value="取消" id="npt1_cancel" />
      </div>
</div>   
<!--课程选择 end-->
<!--视频列表-->
<div class="chooseTip" id="videoList" style="overflow:auto">
      <div class="chooseTiptop"><span>视频列表</span><a onclick="closeAll(this);"></a></div> 
     
      <div class="chooseinfo">
        <table class="tablelist" style="border-left:none;border-right:none;" >
          <thead>
              <tr>
                    <th width="4%"><input name="ur_allSelect" value="" type="checkbox" id="allSelect"></th>
                    <th>视频名称</th>
                    <th width="28%">题目数量</th>
                    <th width="15%">试卷数量</th>
                </tr>
            </thead>
            <tbody id="videos"> <!--请循环8条数据-->
                
            </tbody>
          </table>
          <!--分页-->
        <div class="paginvideo pagin">
           
        </div>
        <!--分页 end-->  
      </div>
     
      <div class="chooseTiptopbtn" style="margin:35px 0 0 0;text-align:center;">
            <input name="" type="button"  class="sure videosure" value="确定" id="ntp_sure" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="" type="button"  class="cancel" value="取消" id="npt_cancel" />
      </div>
      
</div>   
<!--视频列表 end-->
<!--遮罩层-->
<div class="mask"></div>
<!--遮罩层 end-->
<script type="text/javascript">

var functionId;
$(".ext_btn_submit").click(function(){
	var sSco=$("input[name='singleSelectedSco']");
	var jSco=$("input[name='judgeSco']");
	var mSco=$("input[name='multiSelectedSco']");
	var sNum=$("input[name='singleSelectedNum']");
	var jNum=$("input[name='judgeNum']");
	var mNum=$("input[name='multiSelectedNum']");
	var paperItems=$("input[name='paperItems']").val();
	var videoId=$("input[name='videoId']").val();
	functionId=$("[name='functionId']").val();
	
	var conditionStr=(functionId!="")&&($("input[name='courseId']").val()!="")&&(paperItems!="");

	if((sSco.val()!=0&&sSco.val()!="")||(jSco.val()!=0&&jSco.val()!="")||(mSco.val()!=0&&mSco.val()!="")){
	$(".test_num").each(function(index){
		var items=$(this).children("a").html();
		if(index==0){
	if(sSco.val()!=0&&sSco.val()!=""){
		if(items!="0"&&items!=""){
			conditionStr=conditionStr&&((sSco.val()!="")&&(sSco.val()!=0))&&((sNum.val()!="")&&(sNum.val()!=0))&&(sNum.val()<=parseInt(items));
			if(!conditionStr){
				return false;
			}
			}else{
				 
				conditionStr=conditionStr&&(sNum.val()==""||sNum.val()==0)&&((sSco.val()=="")||(sSco.val()==0));
				 sSco.val(0);
				 	sNum.val(0); 
			}
		
		}else{
			conditionStr=conditionStr&&(sNum.val()==""||sNum.val()==0);
			sSco.val(0);
			sNum.val(0);
		}
		}
		
		if(index==1){
			if(jSco.val()!=0&&jSco.val()!=""){
			if(items!="0"&&items!=""){
				conditionStr=conditionStr&&((jSco.val()!="")&&(jSco.val()!=0))&&((jNum.val()!="")&&(jNum.val()!=0))&&(jNum.val()<=parseInt(items));
				if(!conditionStr){
					return false;
				}
				}else{
					
					conditionStr=conditionStr&&(jNum.val()==""||jNum.val()==0)&&((jSco.val()=="")||(jSco.val()==0));
				 	jSco.val(0);
					jNum.val(0); 
				}
			}else{
				conditionStr=conditionStr&&(jNum.val()==""||jNum.val()==0);
				 jSco.val(0);
				jNum.val(0); 
			}
			}
		
		if(index==2){
			if(mSco.val()!=0&&mSco.val()!=""){
			if(items!="0"&&items!=""){
				conditionStr=conditionStr&&((mSco.val()!="")&&(mSco.val()!=0))&&((mNum.val()!="")&&(mNum.val()!=0))&&(mNum.val()<=parseInt(items));
				
				}else{
					conditionStr=conditionStr&&(mNum.val()==""||mNum.val()==0)&&((mSco.val()=="")||(mSco.val()==0));
					mSco.val(0);
					mNum.val(0); 
				}
			}else{
				conditionStr=conditionStr&&(mNum.val()==""||mNum.val()==0);
				 mSco.val(0);
				mNum.val(0); 
			}
			}
		
	})
	}else{
		conditionStr=conditionStr&&false;
	}
	if((sSco.val()!=0&&sSco.val()!="")||(jSco.val()!=0&&jSco.val()!="")||(mSco.val()!=0&&mSco.val()!="")){

	if(conditionStr){
	 if( $("[name='functionId']").val()==2){
		 add();
	 }else{
		 if(videoId!=""){
			 add(); 
		 }else{
	    layer.alert("请完善试卷相关信息",{icon:2});
		 }
	 }
	}else{
		layer.alert("请完善试卷相关信息或输入信息有误",{icon:2});
	}
	}else{
		  layer.alert("请完善试卷相关信息",{icon:2});
	}
})

function add(){ 
$("#paperForm").ajaxSubmit({
		     type: "post",
		     url: "createPaper.html",
		     dataType: "json",
		     success: function(result){
		    	 if(result.flag==1){
		        layer.alert("创建成功",{icon:1},function(){
		        	window.location.href="${res}/paper/list.html";
		        });
		     }else{
		    	  layer.alert("创建失败",{icon:2}); 
		     }
		     }
		 });
}
//弹框上的关闭按钮
var courseId;
var videoId;
var openId;
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
        //给courseOfSelected赋值，显示选择的课程
        openId=$("[name='open_id']").eq(tmp2).val()
        $("#courseOfSelected").html($("[name='npt_checkbox']").eq(tmp2).parent().next().html());
        courseId=$("[name='npt_checkbox']").eq(tmp2).val();
        $("[name='courseName']").val($("[name='npt_checkbox']").eq(tmp2).parent().next().html());
        $("[name='courseId']").val(courseId);
        $("[name='openId']").val(openId);
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
	  getvideos(1,courseId);
    $(".mask").show();
    $("#videoList").fadeIn(200);
  });

  /**视频列表实现确定按钮**/
    $("#ntp_sure").click(function(){
     
      //取得checkbox的集合
      var selectBoxNum = $("[name='ur_checkbox']");
      var tmp1 = 0;
      var tmp2 = 0;
      selectBoxNum.each(function(i,val){
          if (val.checked == true) {
            tmp2 = i;
            tmp1++;
          };
        });
     
       
          if (tmp1 == 1) {
            $(".namesOfVideo").html("<span>" + $(".ur_tdValue").eq(tmp2).html() + "<span/>");
            videoId=selectBoxNum.eq(tmp2).val();
            $("[name='videoId']").val(videoId);
            $("[name='videoName']").val(selectBoxNum.eq(tmp2).parent().next().html());
            $("#videoList").hide();
            //让[name='npt_checkbox']处于未选中状态
            selectBoxNum.each(function(i,val){
              $(val).attr('checked',false);
            });
          } else {
            $(".mask").show();
            layer.alert('请选择一门课程！', {icon: 0});
          };
    
 
    });

    /**视频列表实现取消按钮**/
    $("#npt_cancel").click(function(){
      $("#videoList").hide();
      //取得checkbox的集合
      var selectBoxNum = $("[name='ur_checkbox']");

      for (var i = 0; i < selectBoxNum.length; i++) {
        selectBoxNum[i].checked = false;
      };

      $("#allSelect").attr('checked',false);

      tmp=0;
    });
    //课程列表实现取消
    $("#npt1_cancel").click(function(){
        $("#listOfCourse").hide();
        //取得checkbox的集合
        var selectBoxNum = $("[name='npt_checkbox']");

        for (var i = 0; i < selectBoxNum.length; i++) {
          selectBoxNum[i].checked = false;
        };
        tmp=0;
      });
  //视频列表选择所有视频
  $("#npt_all").click(function(){
    $("#videoList").hide();
    $(".namesOfVideo").html("<span>" + "所有视频" + "<span/>");
  });
  
  //视频列表清空所选课程
  $("#clearButton").click(function(){
      $(this).siblings(".namesOfVideo").find('span').remove();
      $("[name='videoId']").val("");
      $("[name='videoName']").val("");
   });

  $("#subjectType").change(function(){
    if ($(this).get(0).selectedIndex == 0||$(this).get(0).selectedIndex ==2) {
      $("#idOfSelectedVideo").show();
    } else {
      $("#idOfSelectedVideo").hide();
    };
  });

  
  
  
  $(".search").click(function(){
	  keyWord=$("input[name='search_course']").val();
	
	  getcourses(1,keyWord);
	
	});
  })
  
  function getcourses(pageNum,keyWord){
	
	 $.ajax({
		type:"post",
		url:"getcourses.html",
		data:{pageNum:pageNum,keyWords:keyWord,pageSize:7},
		dataType:"json",
		success:function(result){
			var page=result.page;
			var jsonList=result.page.list;
			$("input[name='search_course']").val(page.keyWords);
			
		if(jsonList==null||jsonList.length<1){
			$("#courses").html("暂无课程");
			 $('.pagincourse').html('');
			 $('.coursesure').hide();
		}else{
			$("#courses").empty();
			$('.coursesure').show();
			for(var i=0;i<jsonList.length;i++){
			$("#courses").append("<tr><td><input id='courseId' name='npt_checkbox' value='"
					+jsonList[i].courseId+"'type='checkbox'><input name='open_id' type='hidden' value='"
					+jsonList[i].openId+"'></td><td class='ntp_tdValue'>"
					+jsonList[i].courseName+"</td><td>"
					+jsonList[i].courseTypeName+"</td><td>"
					+jsonList[i].userName+"</td></tr>")
			} 
			htm = '<div class="message">共<i class="blue">'+page.totalPage+'</i>条记录，当前显示第&nbsp;<i class="blue">'+page.pageNum+'&nbsp;</i>页</div>'
 			+'<ul class="paginList"><li class="paginItem">';
 			if(page.pageNum>1){
 				htm=htm+'<a href="javascript:;" onclick="getcourses('+(pageNum-1)+',\''+keyWord+'\')"><span class="pagepre"></span></a>';
 			}else{
 				htm=htm+'<a href="javascript:;"><span class="pagepre"></span></a>';
 			}
     		htm=htm+'</li>';
     		var totalCount = page.totalPage == 0 ? 0 : (page.totalPage+page.pageSize - 1)/page.pageSize;
     		for(var i = 1; i <=totalCount; i++){
     			if(i==page.pageNum){
     				htm = htm+'<li class="paginItem current"><a href="javascript:;">'+i+'</a></li>';
     				continue;
     			}
     			htm = htm + '<li class="paginItem"><a href="javascript:;" onclick="getcourses('+i+',\''+keyWord+'\')">'+i+'</a></li>';
     		}
     		htm=htm+'<li class="paginItem">';
     		if(page.pageNum<page.totalCount){
     htm=htm+'<a href="javascript:;" onclick="getcourses('+(pageNum+1)+',\''+keyWord+'\')"><span class="pagenxt"></span></a>';
     		}else{
     			htm=htm+'<a href="javascript:;"><span class="pagenxt"></span></a>';
     		}
     		htm=htm+'</li></ul>';
     		
         $('.pagincourse').html(htm);
	     
		}  
		 
	},
	
	});  
}
 function getvideos(pageNum,courseId){
	 $.ajax({
		type:"post",
		url:"getvideosOfcreatePaper.html",
		data:{courseId:courseId,openId:openId,pageNum:pageNum,pageSize:7},
		dataType:"json",
		success:function(result){
			var videos=result.page.list;
	       var page=result.page;
	  
		if(videos==null||videos.length<1){
			$("#videos").html("<tr><td></td><td>该课程下暂无视频</td></tr>");
			$(".paginvideo").html("");
			 $('.videosure').hide();
		}else{
			$("#videos").empty();
			 $('.videosure').show();
			for(var i=0;i<videos.length;i++){
			$("#videos").append("<tr class='video"+i+"'><td><input name='ur_checkbox' value='"
					+videos[i].videoId+"' type='checkbox'></td><td class='ur_tdValue'>"
					+videos[i].videoName+"</td></tr>");
					if(videos[i].subjectNum==null||videos[i].subjectNum==0){
						$(".video"+i).append("<td>无</td>")	
					}else{
						$(".video"+i).append("<td>"+videos[i].subjectNum+"</td>")
					}
					if(videos[i].paperNum==null||videos[i].paperNum==0){
						$(".video"+i).append("<td>无</td>")
					}else{
						$(".video"+i).append("<td>"+videos[i].paperNum+"</td>")
					}
				
			} 
			htm = '<div class="message">共<i class="blue">'+page.totalPage+'</i>条记录，当前显示第&nbsp;<i class="blue">'+page.pageNum+'&nbsp;</i>页</div>'
 			+'<ul class="paginList"><li class="paginItem">';
 			if(page.pageNum>1){
 				htm=htm+'<a href="javascript:;" onclick="getvideos('+(pageNum-1)+","+courseId+')"><span class="pagepre"></span></a>';
 			}else{
 				htm=htm+'<a href="javascript:;"><span class="pagepre"></span></a>';
 			}
     		htm=htm+'</li>';
     		var totalCount = page.totalPage == 0 ? 0 :  (page.totalPage+page.pageSize - 1)/page.pageSize;
     		for(var i = 1; i <=totalCount; i++){
     			if(i==page.pageNum){
     				htm = htm+'<li class="paginItem current"><a href="javascript:;">'+i+'</a></li>';
     				continue;
     			}
     			htm = htm + '<li class="paginItem"><a href="javascript:;" onclick="getvideos('+i+","+courseId+')">'+i+'</a></li>';
     		}
     		htm=htm+'<li class="paginItem">';
     		if(page.pageNum<page.totalCount){
     htm=htm+'<a href="javascript:;" onclick="getvideos('+(pageNum+1)+","+courseId+')"><span class="pagenxt"></span></a>';
     		}else{
     			htm=htm+'<a href="javascript:;"><span class="pagenxt"></span></a>';
     		}
     		htm=htm+'</li></ul>';
     		
         $('.paginvideo').html(htm);	 
	
	     
		}  
		 
	},
	
	});  
}
 function getCount(subjectTypeId,subjectType){
	  functionId=$("[name='functionId']").val();
	 $.ajax({
			type:"post",
			url:"getsubjectcount.html",
			data:{courseId:courseId,subjectTypeId:subjectTypeId,videoId:videoId,functionId:functionId},
			dataType:"json",
			success:function(result){
				var subjectCount=result.subjectCount;
			if(subjectCount==null||subjectCount==0){
				$("#"+subjectTypeId).html(0);
				
			}else{
				$("#"+subjectTypeId).html(subjectCount);
				
				
			}  
			 
		},
		
		});  
 }
 
 
</script>
</body>
</html>
