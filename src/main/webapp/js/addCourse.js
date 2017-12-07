/*
  *主要存放添加课程的js
 *creaded by oupan on 2016年6月19日 16:45:23
 */
$(function(){
	var courseId = '${course.courseId}';
	var chapterId = -1;
	var submit=0;//判断在点击下一步时是否保存，保存了为1，没保存为0
       //建课界面下一步跳转
	//getChapterTree();
    var submit2=0;
	var submit3=0;
    $(".addStepOne").click(function(){
    	if(submit==0){
    	 var $courseName=$('input[name="courseName"]').val();
		  if($courseName!=''){
    	$("#form").ajaxSubmit({
		     type: "post",
		     url: "add/1.html",
		     dataType: "json",
			success : function(data) {
				
				if (0 != data.flag) {
					layer.alert(data.msg, {
						  icon: 1,
						  skin: 'layer-ext-moon' 
						},function(){
						
						 $('.box-course').hide();
						    $('.box-course').eq(1).show();
						    $('.box-step li').removeClass('cur');
						    $('.box-step li').eq(1).addClass("cur");
						
						layer.closeAll();
					});
					courseId=data.courseId;
					getChapterTree();
					
				} else {
					layer.alert(data.msg,{icon:2});
				}
			},
    		error : function(XmlHttpRequest, textStatus, errorThrown){
    			layer.alert("保存失败，请检查你的表单",{icon:2});
    		}
		});
		  }else{
			  layer.alert("课程名称不能为空",{icon:2});
		  }
		  
		  
    	}else{
    		submit=0;
    		 $('.box-course').hide();
			    $('.box-course').eq(1).show();
			    $('.box-step li').removeClass('cur');
			    $('.box-step li').eq(1).addClass("cur");
    	}
    	
	});
    $(".saveStepOne").click(function(){
    	 var $courseName=$('input[name="courseName"]').val();
    	  if($courseName!=''){
    	$("#form").ajaxSubmit({
		     type: "post",
		     url: "add/1.html",
		     dataType: "json",
			success : function(data) {
				if (0 != data.flag) {
					layer.alert(data.msg, {
						  icon: 1,
						  skin: 'layer-ext-moon' 
						})
					courseId=data.courseId;
					getChapterTree();
					submit=1;
				} else {
					layer.alert(data.msg,{icon:2});
				}
			},
    		error : function(XmlHttpRequest, textStatus, errorThrown){
    			layer.alert("保存失败，请检查你的表单",{icon:2});
    		}
		});
    	  }else{
    		  layer.alert("课程名称不能为空",{icon:2}); 
    	  }
	});
    $(".editStepOne").click(function(){
    	if(submit3==0){
    	 var $courseName=$('input[name="courseName"]').val();
    	 if($courseName!=''){
    	$("#form").ajaxSubmit({
		     type: "post",
		     url: "update/1.html",
		     dataType: "json",
			success : function(data) {
				if (0 != data.flag) {
					layer.alert(data.msg, {
						  icon: 1,
						  skin: 'layer-ext-moon' 
						},function(){
							 $('.box-course').hide();
							    $('.box-course').eq(1).show();
							    $('.box-step li').removeClass('cur');
							    $('.box-step li').eq(1).addClass("cur");
							layer.closeAll();
						})
					courseId = $("#courseId").val();
					getChapterTree();
				} else {
					layer.alert(data.msg,{icon:2});
				}
			},
    		error : function(XmlHttpRequest, textStatus, errorThrown){
    			layer.alert("保存失败，请检查你的表单",{icon:2});
    		}
		});
    	 }else{
    		 layer.alert("课程名称不能为空",{icon:2}); 
    	 }
    	}else{
    		submit3=0;
    		  $('.box-course').hide();
			    $('.box-course').eq(1).show();
			    $('.box-step li').removeClass('cur');
			    $('.box-step li').eq(1).addClass("cur");
    	}
	});
    $(".editsaveStepOne").click(function(){
    	 var $courseName=$('input[name="courseName"]').val();
    	 if($courseName!=''){
    	$("#form").ajaxSubmit({
		     type: "post",
		     url: "update/1.html",
		     dataType: "json",
			success : function(data) {
				if (0 != data.flag) {
					layer.alert(data.msg, {
						  icon: 1,
						  skin: 'layer-ext-moon' 
						})
					courseId = $("#courseId").val();
					getChapterTree();
					submit3=1;
				} else {
					layer.alert(data.msg,{icon:2});
				}
			},
    		error : function(XmlHttpRequest, textStatus, errorThrown){
    			layer.alert("保存失败，请检查你的表单",{icon:2});
    		}
		});
    	 }else{
    		 layer.alert("课程名称不能为空",{icon:2}); 
    	 }
	});
   
    $(".stepnext2").click(function(){
    	var name  = $(".chapterName").val();
    	if(submit2==0){
    	if(name!=''){
    		addOrUpdateChapter(1);	
    	}else{
    		
    		layer.alert("目录名称不能为空",{icon:2});
    	}
    	}else{
    		submit2=0;
    		 $('.box-course').hide();
			    $('.box-course').eq(2).show();
			    $('.box-step li').removeClass('cur');
			    $('.box-step li').eq(2).addClass("cur");
			    
    	}
    });
        //第三步新增/修改
        $(".addCourseType").click(function(){
        	var courseType = $(".courseType").val();
        	if(courseType!=''){
        	$.ajax({
    	  		  type: "POST",
    	  		  url: "/admin/course/add/3.html",
    	  		  data:{courseType:courseType,courseId:courseId},
    	  		  dataType: "json",
    	  		  success: function(data){		 
    	  	    	location.href="/admin/course/list.html";
    	  	    	
    	  		  },error : function(XmlHttpRequest, textStatus, errorThrown){
    	    			layer.alert("保存失败，请检查你的表单",{icon:2});
    	    		}
    	  		 });
        	}else{
        		layer.alert("课程分类不能为空",{icon:2})
        	}
        });
        
        $(".newChapter").click(function(){
        	chapterId=-1;
        	var url = "/admin/course/chapter/chapterInfo.html?chapterId="+ -1+"&courseId="+courseId;
        	document.getElementById('iframe').src = url;
        })
        $(".updateChapter").click(function(){
        	var name  = $(".chapterName").val();
        	if(name!=''){
        		addOrUpdateChapter(0);
        		submit2=1;
        	}else{
        		layer.alert("目录名称不能为空",{icon:2});
        	}
        
        })
        
        function addLevel(courseId){
        	$.ajax({
    			url : '/admin/course/chapter/addLevel.html',
    			type: "POST",
    			data : {courseId:courseId},
    			success:function(data){
    				
    				}
    			})
        }
        //updateChapter	更新章节信息
        function addOrUpdateChapter(flag){
        	var name  = $(".chapterName").val();
        	var videoIdBefore=window.frames[0].document.getElementById("videoId").value;
        	/*var videoIdBefore = null;*/
        	var videoId = window.frames[0].document.getElementById("fileId").getAttribute("fN");
        	var chapterInfo = window.frames[0].document.getElementById("chapterInfo").value;
        	var selectBoxNum = window.frames[0].document.getElementsByName("fileIds");
        	var selectBoxNum2 = window.frames[0].document.getElementsByName("fileIds2");
        	var tmp = 0;
        	var fileIds= "";
        	var fileIds2= "";
        	  //循环name值为fileIds的input:checkbox,如果input:checkbox有选中
        	  for (var i = 0; i < selectBoxNum.length; i++) {
        	    if (selectBoxNum[i].checked == true) {
        	      fileIds+=selectBoxNum[i].value+","; 
        	    };
        	  };
        	  //循环name值为fileIds2的input:checkbox,如果input:checkbox有选中
        	  for (var i = 0; i < selectBoxNum2.length; i++) {
        	    if (selectBoxNum2[i].checked == true) {
        	    	fileIds2+=selectBoxNum2[i].value+",";  
        	    };
        	  };
        	$.ajax({
    			url : '/admin/course/chapter/'+courseId+'/editChapter.html',
    			type: "POST",
    			data : {chapterId:chapterId,chapterName:name,videoId:videoId,chapterInfo:chapterInfo,fileIds:fileIds,fileIds2:fileIds2,videoIdBefore:videoIdBefore},
    			success:function(data){
    				var tree = jQuery.jstree.reference("#ChapterTree");
    				tree.refresh();
    				
    				layer.alert("保存成功",{
						  icon: 1,
						  skin: 'layer-ext-moon' 
						},function(){
						
    					if(flag==1){
       					 $('.box-course').hide();
    					    $('.box-course').eq(2).show();
    					    $('.box-step li').removeClass('cur');
    					    $('.box-step li').eq(2).addClass("cur");
    					    
    					  
       				}
    					  layer.closeAll();	
    				});
    				addLevel(courseId);
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    				
    				layer.alert("保存失败，请检查你的表单",{icon:2});
    			}
    		});
        }
        
        //章节树
        function getChapterTree(){
		    var oldnodename = "";
			$.ajaxSetup({
				cache : false
			});
			$('#ChapterTree').jstree(
						{
							'core' : {
								'data' : {
									'url' : "/admin/course/chapter/chapterTree.html?courseId="
											+ courseId + "&&parentId=" + 0,
									"dataType" : "json"
								},
								'check_callback' : true,
								'themes' : {
									'responsive' : false
								}
							},
							'contextmenu' : {
								'items' : function(node) {
									var tmp = $.jstree.defaults.contextmenu
											.items();
									delete tmp.ccp;
									return tmp;
								}
							},
							'plugins' : [ 'state', 'dnd', 'contextmenu',
									'wholerow' ]
						})
				.on('delete_node.jstree', function(e, data) {
					$.get('/admin/course/chapter/' + courseId + '/delChapter.html', {
						'chapterId' : data.node.id,
						'chapterName' : data.node.text
					}).fail(function() {
						data.instance.refresh();
					});
				})
				.on('create_node.jstree', function(e, data) {
				
					$.get('/admin/course/chapter/' + courseId + '/addChapter.html', {
						'parentId' : data.node.parent,
						'chapterName' : data.node.text
					}).done(function(d) {
						var chapter = eval("("+d+")");
						data.instance.set_id(data.node, chapter.id);
					}).fail(function() {
						data.instance.refresh();
					});
				})
				.on('rename_node.jstree',function(e, data) {
					       
							$.get('/admin/course/chapter/' + courseId + '/editChapter.html', {
										'chapterId' : data.node.id,
										'chapterName' : data.node.text
									}).fail(function() {
								data.instance.refresh();
							});
						})
				  .on('move_node.jstree', function (e, data) {
					 $.get('/admin/course/chapter/' + courseId + '/moveNode.html', { 'chapterId' : data.node.id,
					 'parent' : data.parent, 'position' : data.position })
					 .fail(function () {
						 data.instance.refresh();
					 });
				 })
				.on('click.jstree',function(e, data) {
							var eventNodeName = e.target.nodeName;
							if (eventNodeName == 'INS') {
								return;
							} else if (eventNodeName == 'A') {
								var $subject = $(e.target).parent();
								if ($subject.find('ul').length > 0) {
								} else {
									// 选择的id值
									id = $(e.target).parents('li').attr('id');
									chapterId = id;
								}
							}
							var url = "/admin/course/chapter/chapterInfo.html?chapterId="
									+ chapterId+"&courseId="+courseId;
							document.getElementById('iframe').src = url;
						})
        }

});
