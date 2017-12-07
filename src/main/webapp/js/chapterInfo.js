
//删除视频
function delVideo(){
	var removeButtonIndex= $(".fileId").attr("fN")
	$.ajax({
		url : "/resource/delFtpResource.html",
		type : "post",
		data : {
			fileId : removeButtonIndex
		},
		success : function() {
			$(".fileId").val("");
			$(".info").text("")
			$(".file").css('display', 'none');
			$(".upload").css('display', 'block');
			$(".font-wenzi").css('display','inline-block');
			
			}
	});
	
	
}
/*function delVideo(){
		$(".fileId").val("");
		$(".file").css('display', 'none');
		$("#fileQueue").empty();
		$(".upload").css('display', 'block');
		$(".font-wenzi").css('display','inline-block');
}*/
//修改视频
function updateVideo(videoId,courseId){
  var flag=0;
  if(flag==0){
	  $("#uploadify-button").click();
	  $(".fileId").val("");
	  $(".info").text("")
	  $(".file").css('display', 'none');
	  var obj = document.getElementById("uploadSelect");
	   obj.style.cssText = "opacity: 1; filter:Alpha(opacity=1);"
	  $(".font-wenzi").css('display','inline-block');
		flag=1;
  }
}

//删除文件			
function delFile(obj,fileId,url){
	var fileId = fileId;
	layer.confirm('你确定删出该资源吗？',{icon: 3, title:'提示'},function(){ 
		layer.closeAll();
	$.ajax({
			url : 'delFile.html',
			type : 'post',
			data : {"fileId":fileId,url:url},
			success : function (data){
				$(obj).parent().parent().remove();
				},
			});
	});
}
	

/**
 * 课程资源库dialog
 */
//$(function(){
     //资源列表弹窗
//	$("#uploadfileresource").dialog({
//    		closed:true,
//    		modal:true,
//    		left:100,
//    		top:100,
//    		buttons: [{
//  	          text:'保存',
//  	          iconCls:'icon-save',
//  	           handler : function () {
//  	        var arr = new Array();
//  	        var length=$("#uploadfileresource li").length;
//  	        var num=0;
//  	        for(var i=0;i<length;i++){
//  	        	if($("#uploadfileresource input")[i].checked){
//  	        		arr[num]=$("#uploadfileresource input")[i].value;
//  	        		num++;
//  	        	}
//  	        }
//  				$.ajax({
//  					url : 'addFile.html',
//  					type : 'post',
//  					data : {arr:arr,chapterId:1},
//  					success : function (data){
//  						$('#uploadfileresource').dialog('close');
//  						location.reload();
//  						},
//  					});
//  				},
//  			},{
//  				text : '取消',
//  				iconCls : 'icon-redo',
//  				handler : function () {
//  					$('#uploadfileresource').dialog('close');
//  				},
//  	        }]
//    	});
//});
	$(function(){
		$(".dialog").click(function(){
			getResource();
			$('#ResourceList', window.parent.document).show();
		  $('.mask', window.parent.document).show();
		});
		function getResource(){
    		$.ajax({
    			url:'/resource/getAllResource.html',
    			data:{"typeId":1},
    			type : 'post',
    			success : function(data){
    				var files = eval("("+data+")");
    				var html="";
    				//alert(files.length);
    				for(var i=0;i<files.length;i++){
    					html += '<tr><td><input type="checkbox" name ="ur_checkbox1" value="'+files[i].id+'"></td><td class="ur_tdValue1">'
    							+files[i].name+'</td><td ur_tdTypevalue1>'
    							+files[i].fileTypePo.name+'</td><td>'
    							+formatDate(files[i].createDate)+'</td></tr>';
    				}
    				$('.resourceTable tbody', window.parent.document).html(html);
    			}
    		});
    	}
    	//格式化时间
    	function formatDate(date) {
    			var date = new Date(date);
    		    var y = date.getFullYear();  
    		    var m = date.getMonth() + 1;  
    		    m = m < 10 ? ('0' + m) : m;  
    		    var d = date.getDate();  
    		    d = d < 10 ? ('0' + d) : d;  
    		    var h = date.getHours();  
    		    var minute = date.getMinutes();  
    		    var minute = date.getSeconds(); 
    		    minute = minute < 10 ? ('0' + minute) : minute;  
    		    return y + '-' + m + '-' + d+' '+h+':'+minute;  
    		};  
  
	});
	