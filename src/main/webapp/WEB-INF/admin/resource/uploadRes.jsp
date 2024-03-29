<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传资源</title>
<link href="${res }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${res }/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${res}/webuploader/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${res}/webuploader/0.1.5/webuploader.css">
<link rel="stylesheet" type="text/css" href="${res}/webuploader/icheck/icheck.css">
<!-- <link href="plugin/swfupload/css/default.css" rel="stylesheet" type="text/css" /> -->
<link href="${res }/plugin/Validform/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${res}/css/paging.css" />

<script type="text/javascript" src="${res }/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${res }/plugin/Validform/Validform.min.js"></script>
<script type="text/javascript" src="${res}/webuploader/bootstrap-3.3.7/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/webuploader/0.1.5/webuploader.js"></script>
<script type="text/javascript" src="${res}/webuploader/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${res}/webuploader/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${res }/js/global.js"></script>
<script type="text/javascript" src="${res}/js/query.js"></script>
<script type="text/javascript" src="${res}/js/paging.js"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${res}/" target=＂_blank＂>首页</a></li>
       <li><a href="#">上传资源</a></li>
    </ul>
</div>
<div class="rightinfo">   
  <div class="formbody">
     <div class="formtitle"><span>上传资源</span></div>
     <div class="padding5">
      <table class="form_table" width="100%" cellspacing="0" cellpadding="0" border="0">
            <tbody>
              <tr>
                <td class="td_right">资源分类：</td>
                <td>
                   <select name="resourceType" class="select" id="subjectType"> 
                   		<option value="2">公共资源</option>
                      	<option value="1" selected="selected">课程资源</option>
                    </select>
                </td>
                </tr>
                 <tr class="courseAll">
                  <td class="td_right" valign="top">所属课程：</td>
                  <td><input class="x-button1" id="checkCourse" value="选择课程" type="button"/>
                  <a style="padding-left:20px;color:#f00;" id="clear">清空</a>
                  <input class="courseId" name="courseId" value="" type="hidden"/>
                    <div class="ycourse"></div>
                  </td>
                 </tr>
                <tr>
                  <td class="td_right">资源描述：</td>
                  <td >
                    <textarea name="info" id="" cols="100" rows="7" class="textarea"></textarea>
                  </td>
                 </tr>
                <tr>
                  <td class="td_right">上传文件：</td>
                  <td class="file" style="display:none">
                  	<input name="fileId" class="fileId" fN="" type="text"/>
                  	 <input name="videoId" id="videoId" type="hidden"  value=""/>
                  	<a href='javascript:;' onclick="del()">删除</a>
                  </td>
                  <td style=" position: absolute; opacity: 0; filter:Alpha(opacity=0);" id="uploaderSelect">
                     <div id="uploader" class="wu-example" >
    <div id="thelist" class="uploader-list"></div>
    <div class="btns">
        <div id="picker">选择文件</div>
        <button id="ctlBtn" class="btn btn-default">开始上传</button>
    </div>
</div>
                  </td>
                 </tr>
                
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input name="button" class="ext_btn ext_btn_submit" value="保存" type="button"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      <input name="button" class="ext_btn ext_btn_error"  value="重置" type="reset"/> 
                   </td>
                 </tr>
               </tbody>
          </table>
     </div>
  </div>
</div>
<!--课程选择-->
<div class="chooseTip" id="courseList" style="overflow-y: scroll; overflow-x: hidden;">
      <div class="chooseTiptop"><span>选择所属课程</span><a></a></div> 
      <div class="chooseinfo">
        <table class="tablelist" style="border-left:none;border-right:none;">
          <thead>
              <tr>
                    <th width="4%"><input name="ur_allSelect" value="" type="checkbox" id="allSelect"/></th>
                    <th>课程名称</th>
                    <th width="28%">课程类别</th>
                    <th width="15%">创建作者</th>
                </tr>
            </thead>
           <%--  <tbody class="cont"> <!--请循环8条数据-->
	            <c:forEach  items="${courseList }" var="course" varStatus="status" begin="0" end="8">
	            	<tr>
		                <td><input name="ur_checkbox" value="${course.courseId}" type="checkbox"/></td>
		                <td class="ur_tdValue">${course.courseName}</td>
		                <td>${course.courseTypePo.typeName}</td>
		                <td>${course.createUser.name}</td>
	               </tr>
               </c:forEach>
            </tbody> --%>
            
            <tbody id="publicStr">
       		 </tbody>
          </table>
       <!--分页-->
    <div class="pagin" id="pageToolbar">
    </div>
    <!--分页 end-->
   
     </div>
      <div class="chooseTiptopbtn">
            <input name="" type="button"  class="sure" value="确定" id="ur_sure" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="" type="button"  class="cancel" value="取消" id="ur_cancel" />
      </div>
	</div>   
<!--课程选择 end-->
<!--遮罩层-->
<div class="mask"></div>
<!--遮罩层 end-->
<script type="text/javascript">
var courseId = 0;
 $(function(){
		var fileId = '${video.videoId}';
	 if(fileId =="" || fileId == null){
		  var obj = document.getElementById("uploaderSelect");
		   obj.style.cssText = "opacity: 1; filter:Alpha(opacity=1);"
		$(".font-wenzi").css('display','inline-block');
		
	}else{
		$(".file").css('display','inline-block');
	}
    //资源分类切换
    $("#subjectType option").eq(1).prop("selected", 'selected');
    $(".courseAll").show();
    $("#subjectType").change(function(){
     var subjectType=$("#subjectType").val();
    /* alert(subjectType);*/
     for (var i = 0; i < $("#subjectType").find("option").length; i++) {
       if (subjectType==1) {
         $(".courseAll").show();
       }else{
         $(".courseAll").hide();
       };
     };

    });
    //清空所选课程
    $("#clear").click(function(){
        $(this).siblings(".ycourse").find('span').remove();
        $(".courseId").val();
        courseId = 0;
     });
    
    /**实现取消按钮**/
    $("#ur_cancel").click(function(){
      $("#courseList").hide();
      //取得checkbox的集合
      var selectBoxNum = $("[name='ur_checkbox']");

      for (var i = 0; i < selectBoxNum.length; i++) {
        selectBoxNum[i].checked = false;
      };

      $("#allSelect").attr('checked',false);

      tmp=0;
    });
    /**实现确定按钮**/
    $("#ur_sure").click(function(){
      $("#courseList").hide();
      //取得checkbox的集合
      var selectBoxNum = $("[name='ur_checkbox']");

      var tmp1 = 0;
      for (var i = 0; i < selectBoxNum.length; i++) {
        if (selectBoxNum[i].checked == true) {
        	courseId = selectBoxNum.eq(i).val();  
          if (tmp1 == 0) {
            $(".ycourse").html("<span>" + $(".ur_tdValue").eq(i).html() + "<span/>");
            tmp1++;
          } else {
            $(".ycourse").html($(".ycourse").html() + "<span>" + $(".ur_tdValue").eq(i).html() + "<span/>");
          };
        };
      };
      $(".courseId").val(courseId);
      var c=uploader.options.formData.courseId; 
      alert(c)
    
     
    });
    
    //上传资源
     $(function(){ 
    	  $list = $("#thelist"),
  		$btn = $("#ctlBtn"),
  		state = "pending",
  		uploader;
    	//视频上传
 	  var uploader = WebUploader.create({

 		    // swf文件路径
 		    swf:'${res}/webuploader/0.1.5/Uploader.swf',

 		    // 文件接收服务端。
 		    server: '${res}/resource/uploadRes2.html',
 		    duplicate:true, //同一文件是否可重复选择
 		  /*  auto: true, */

 		    // 选择文件的按钮。可选。
 		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
 		    formData: { 'resourceType':1,'chapterId': 1,'courseId':courseId},
 		    pick: '#picker',
 		    multiple: false,

 		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
 		    resize: false
 		});
 	// 当有文件被添加进队列的时候
 	  uploader.on( 'fileQueued', function( file ) {
 	      $list.html( '<div id="' + file.id + '" class="item">' +
 	          '<h4 class="info">' + file.name + '</h4>' +
 	          '<p class="state">等待上传...</p>' +
 	      '</div>' );
 	  });
 	 uploader.on( 'uploadBeforeSend', function( block, data ) {  
 	    // block为分块数据。  
 	  
 	    // file为分块对应的file对象。  
 	    var file = block.file;  
 	  
 	  
 	    // 修改data可以控制发送哪些携带数据。  
 	    data.courseId = courseId;  
 	});  
 	// 文件上传过程中创建进度条实时显示。
 	  uploader.on( 'uploadProgress', function( file, percentage ) {
 	      var $li = $( '#'+file.id ),
 	          $percent = $li.find('.progress .progress-bar');

 	      // 避免重复创建
 	      if ( !$percent.length ) {
 	          $percent = $('<div class="progress progress-striped active">' +
 	            '<div class="progress-bar" role="progressbar" style="width: 0%">' +
 	            '</div>' +
 	          '</div>').appendTo( $li ).find('.progress-bar');
 	      }

 	      $li.find('p.state').text('上传中');

 	      $percent.css( 'width', percentage * 100 + '%' );
 	  });
 	  uploader.on( 'uploadSuccess', function( file ) {
 		  /*   $( '#'+file.id ).find('p.state').text('已上传'); */
 		 $( '#'+file.id ).find('p.state').text('');
		 layer.alert("上传成功！",{icon:1});
 		});

 		uploader.on( 'uploadError', function( file ) {
 		    $( '#'+file.id ).find('p.state').text('上传出错');
 		});

 		uploader.on( 'uploadComplete', function( file ) {
 		    $( '#'+file.id ).find('.progress').fadeOut();
 		});
 		uploader.on('all', function (type) {
 	        if (type === 'startUpload') {
 	            state = 'uploading';
 	        } else if (type === 'stopUpload') {
 	            state = 'paused';
 	        } else if (type === 'uploadFinished') {
 	            state = 'done';
 	        }

 	        if (state === 'uploading') {
 	            $btn.text('暂停上传');
 	        } else {
 	            $btn.text('开始上传');
 	        }
 	    });

 	    $btn.on('click', function () {
 	        if (state === 'uploading') {
 	            uploader.stop();
 	        } else {
 	            uploader.upload();
 	        }
 	    });
 	   uploader.on("uploadAccept", function (object, ret) {
           //服务器响应了
           //ret._raw  类似于 data
           var data = JSON.parse(ret._raw);
       	$(".file").css('display','block'); 
    	$(".upload").css('display','none');
    	 var obj = document.getElementById("uploaderSelect");
		   obj.style.cssText = " position: absolute; visibility: hidden;"
    	$(".fileId").val(data.name);
    	$(".fileId").attr("fN",data.id);
    	$(".fileId").append(data.name);
    	
       });
    }); 
    
       $(".ext_btn_submit").click(function(){
    	   var type=$(".select").val();
    	   var fileId=$(".fileId").attr("fN");
			var info=$(".textarea").val();
			var courseId=$(".courseId").val();
			if(type==1){
				if (courseId == null || courseId == ""){
					layer.alert("请选择要添加到的课程！",{icon:2});
				}
			}
			if (fileId == null || fileId == "") {
				layer.alert("请上传你的资源！",{icon:2});
			}
			$.ajax({
				type : "post",
				url : "addResource.html",
				data : {
					resourceType : type,
					id : fileId,
					info : info,
					courseId : courseId
				},
				success : function(result) {
					if (type == 1) {
						location.href = "myCourseResList.html";
					} else {
						location.href = "myPublicList.html";
					}
				}
			});
		})
	})

	function del() {
	var removeButtonIndex= $(".fileId").attr("fN")
		$.ajax({
			url : "delFtpResource.html",
			type : "post",
			data : {
				fileId : removeButtonIndex
			},
			success : function() {
				$(".fileId").val("");
				$(".file").css('display', 'none');
				$("#fileQueue").empty();
				$(".upload").css('display', 'block');
				 $(".info").text("");
				 var obj = document.getElementById("uploaderSelect");
				   obj.style.cssText = "opacity: 1; filter:Alpha(opacity=1);"
					  
			}
		});
	}
	$(".pagenxt").click(function() {
		if (Number($(".current a").html()) + 1 > $(".totalpage").val()) {
			layer.msg("已是最后一页！");
		} else {
			var o = $(".current")
			o.removeClass("current");
			o.next().addClass("current");
			PageTmp($(".current a").html());
		}
	});
	$(".pagepre").click(function() {
		if ($(".current a").html() == 1) {
			layer.msg("已是第一页！");
		} else {
			var o = $(".current")
			o.removeClass("current");
			o.prev().addClass("current");
			PageTmp($(".current a").html());
		}
	});
	$(".paginItem a").click(function() {
		if (!isNaN(this.innerHTML)) {
			$(".current").removeClass("current");
			$(this).addClass("current");
			PageTmp(this.innerHTML);
		}
	});
	$(".scbtn").click(function() {
		PageTmp(num);
	});
	
	
	var $publicStr=$("#publicStr");
	//分页PageTmp
	 function PageTmp(name,size,page){
	 	$.ajax({
  		  type: "POST",
  		  url: "${res}/admin/course/list.html",
  		  processData:true,
  		  data:{"pageSize":size,"pageNum":page,"keyWords":name},
  		  dataType: "json",
  		  contentType : "application/x-www-form-urlencoded",
  		  success: function(data){
  			  if((typeof(size) == "undefined")){
  				  var htmlStr = "";
  				  $("#publicStr").empty();
  				  $("#pageToolbar").empty();
  				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
  					console.log(arguments); 
  					PageTmp(name,size,page);
  				  }}); 
  			  }
  			HtmlTmp(data.page.list,htmlStr,data.page.startIndex);
  		  },
  		  error:function(e){
  			  layer.alert("出错",{icon:2});
  		  }
  		 });
	 };
	 
	 //列表拼接方法
	 function HtmlTmp(datas,htmlStr,startIndex){
	 	 $publicStr.empty();
	 	$.each(datas, function (index, resource) {
				 	htmlStr+='<tr>';
					htmlStr+='<td><input name="ur_checkbox" value="'+resource.courseId+'" type="checkbox"></td>'
					htmlStr+='<td class="ur_tdValue">'+resource.courseName+'</td>'; 
					if(resource.courseTypePo != null){
						htmlStr+='<td>'+resource.courseTypePo.typeName+'</td>'; 
					}else{
						htmlStr+='<td></td>'; 
					}
					
					htmlStr+='<td>'+resource.createUser.name+'</td>'; 
					htmlStr+='</tr>'; 
	      });
			  $publicStr.append(htmlStr);
	 }
</script>
</body>
</html>