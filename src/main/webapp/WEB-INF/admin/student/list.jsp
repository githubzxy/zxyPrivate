<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生信息列表</title>
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
       <li><a href="#">学生信息列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li><a href="add.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>新加学生</a></li>
            <li><a href="import.html" target="rightFrame"><span><img src="${res}/images/t01.png"></span>批量导入学生</a></li>
  
            <li onclick="delAll();"><span><img src="${res}/images/t03.png"></span>全部删除</li>
       </ul>
    </div>
    
    <ul class="prosearch">
           <li>
               <i>学生姓名:</i><a><input name="name" class="input-text" placeholder="学生姓名" type="text" value=""></a>
               <i>学生学号:</i><a><input name="number" class="input-text" placeholder="学号" type="text" value="" ></a>
               <i>年级:</i>
                <a>
                   <select name="gradeId" class="select" id ="selectGrade" onchange="getCla()"> 
                      <option value="">请选择年级</option> 
                       <c:forEach items="${grades}" var="grade" varStatus="status">
                       <option value="${grade.gradeId}" <c:if test="${grade.gradeId==page.gradeId}">selected</c:if>>${grade.name}</option>
                       </c:forEach>
                    </select>
                </a>
                <i>班级:</i>
                <a>
                   <select name="classId" class="select changeClass" id="selectClass" > 
                    <option value="">请选择班级</option>
                     <c:forEach items="${classes}" var="cla" varStatus="status">
                       <option value="${cla.classId}" <c:if test="${cla.classId==page.classId}">selected</c:if>>${cla.name}</option>
                       </c:forEach>
                    </select>
                </a>
                <a><input name="" class="search" value="查询" type="button"/></a>
           </li>
    </ul>
    <div class="formbody">
        <div class="formtitle"><span>学生信息列表</span></div>
         <table class="tablelist">
          <thead>
              <tr>
                    <th><input name="ur_allSelect" value="" type="checkbox" id="allSelect"/></th>
                    <th>序&nbsp;&nbsp;号</th>
                    <th>姓&nbsp;&nbsp;名</th>
                    <th>学&nbsp;&nbsp;号</th>
                    <th>手机号码</th>
                    <th>邮&nbsp;&nbsp;箱</th>
                    <th>年&nbsp;&nbsp;级</th>
                    <th>班&nbsp;&nbsp;级</th>
                    <th>账号状态</th>
                    <th width="296" class="text-center">操&nbsp;&nbsp;作</th>
                </tr>
            </thead>
            <tbody id="studentStr"> 
            </tbody>
        </table>
        <!--分页-->
        <div id="pageToolbar">
           
        </div>
        <!--分页 end-->
     </div>
</div>
<script type="text/javascript">

var  $studentStr=$("#studentStr");
//分页方法
function PageTmp(name,number,classId,gradeId,size,page){
	var htmlStr = "";
	$.ajax({
		  type: "POST",
		  url: "${res}/admin/student/list.html",
		  processData:true,
		  data:{"name":name,'pageSize':size,'pageNum':page,'number':number,'classId':classId,'gradeId':gradeId},
		  dataType: "json",
		  success: function(data){
			  if((typeof(size) == "undefined")){
				  var htmlStr = "";
				  $studentStr.empty();
				  $("#pageToolbar").empty();
				  $('#pageToolbar').Paging({pagesize:data.page.pageSize,count:data.page.totalPage,toolbar:true,callback:function(page,size,count){
					console.log(arguments); 
					PageTmp(name,number,classId,gradeId,size,page);
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
	 $studentStr.empty();
	$.each(datas, function (index, student) {
			htmlStr+="<tr>";
			htmlStr+="<td><input name='ur_checkbox' value='' type='checkbox' id="+student.studentId+"></td>";
			htmlStr+="<td>"+(++startIndex)+"</td>";
			htmlStr+="<td>"+student.name+"</td>";
			htmlStr+="<td>"+student.number+"</td>";
			if(student.userPo.phone!=null){
				htmlStr+="<td>"+student.userPo.phone+"</td>";
			}else{
				htmlStr+="<td>无</td>";
			}
		    if(student.userPo.email!=null){
		    	htmlStr+="<td>"+student.userPo.email+"</td>";
		    }else{
		    	htmlStr+="<td>无</td>";
		    }
			
			htmlStr+="<td>"+student.gradeName+"</td>";
			htmlStr+="<td>"+student.className+"</td>";
			if(student.userPo.state!=0){
				htmlStr+='<td class="green stauts">已启用</td><';
			}else{
				htmlStr+='<td class="f00">已禁用</td>';
			}
			htmlStr+="<td>";
			htmlStr+="<span class='pl25 ml15'>";
			htmlStr+="<a href='${res}/admin/student/update/"+student.studentId+".html' class='ext_btn ext_btn_submit mr10'>修改</a> ";
			if(student.userPo.state!=0){
				htmlStr+='<input class="ext_btn ext_btn_success mr10" value="注销" type="button" onclick="logout('+student.studentId+',this,1)" data-type="-1"/>';
			}else{
				htmlStr+='<input class="ext_btn ext_btn_error mr10" value="启用" type="button" onclick="logout('+student.studentId+',this,1)" data-type="1"/>';
			}
		/* 	htmlStr+='<a href="query.html?studentId='+student.studentId+'" class="ext_btn ext_btn_success mr10" >查看</a>'; */
			htmlStr+="<input class='ext_btn ext_btn_error mr10' value='删除'  onclick='del("+student.studentId+");' type='button'> ";
			htmlStr+="</span> ";
			htmlStr+="</td> ";
			htmlStr+="</tr>";
     });
		  $studentStr.append(htmlStr);
}

//搜索条件查询列表
$(".search").click(function(){
		var name=$("input[name='name']").val();
		var number=$("input[name='number']").val();
		var classId=$("#selectClass").val();
		var gradeId=$("#selectGrade").val();
		PageTmp(name,number,classId,gradeId);
})

//初始化时就调用
jQuery(function ($) {
	 PageTmp(); 
});

function logout(studentId,obj,pid){
    var state= $(obj).attr("data-type");
   
    if(state=="-1"){
        var hint="确认注销该学生账户?";
    }else{
        var hint="确认启用该学生账户?";
    }
    layer.confirm(hint,{icon: 3, title:'提示'},function(){ 
    layer.closeAll();
    if(state=="-1"){
        if(doLogout(pid,1)){//1表示分享
          
             $.ajax({
          	    type:'POST',
          		  url:"logout.html",
          		  data:{studentId:studentId},
          		  dataType: "json",
          		  success:function(data){
    		 if(data.flag==1){
    			 layer.alert("注销成功",{icon:1});
    			 $(obj).attr("data-type","1");
    	           $(obj).val("启用").addClass("ext_btn_error").removeClass("ext_btn_success");
    	            $(obj).parent().parent().siblings(".stauts").text("已注销").addClass("f00").removeClass("green");
    		  } 
          		  }
          		  }); 
        }else{
           //alert("数据请求失败！");
           layer.msg('数据请求失败！',{icon:2});
        }     
    }else if(state=="1"){
        if(doLogout(pid,-1)){//-1表示取消
              $.ajax({
     	    type:'POST',
     		  url:"reuse.html",
     		  data:{studentId:studentId},
     		  dataType: "json",
     		  success:function(data){
		  if(data.flag==1){
			  layer.alert("启用成功",{icon:1});
			  $(obj).val("注销").addClass("ext_btn_success").removeClass("ext_btn_error");
	           $(obj).attr("data-type","-1"); 
	           $(obj).parent().parent().siblings(".stauts").text("已启用").addClass("green").removeClass("f00");
		  } 
     		  }
     		  }); 
        }else{
           //alert("数据请求失败！");
            layer.msg('数据请求失败！',{icon:2});
        }      
     }  
    });
    
}

//请求数据接口-开启或者取消分享
function doLogout(pid,type){
    //把id,和type传给服务器端，服务器端修改成功返回true,修改失败返回false;
   return true;
}

 //点击单条删除按钮删除该行数据
function del(removeButtonIndex){
        layer.confirm('你确定删除选中的学生吗？',{icon: 3, title:'提示'},function(){
          $.ajax({
      	    type:'POST',
      		  url:"delete.html",
      		  data:{ids:removeButtonIndex},
      		  dataType: "json",
      		  success:function(data){
		  if(data.flag==1){
			  layer.alert("删除成功!",{icon:1},function(){
				  document.location.href="list.html";
			  });
		  }else{
			  layer.alert("删除失败!",{icon:2},function(){
			  });
		  }
      		  }
      		  });
          $("[name='ur_checkbox']").eq(tmp).parent("td").parent("tr").remove();
          removeButtonIndexArr.splice(tmp,1);
          
        });
        
      };  
      
      
  /*  } else {
    //没选中时，弹出提示框
    layer.open({
      time: 2000, //2s后自动关闭
      title: '提示' , 
      icon:2,  
      content:'请选择你要删除的学生信息！' 
    });
   };
 
 }; 
}*/

//删除全部选中的行数
function delAll(){
	//取得所有选中checkbox的id，拼接成字符串
	var id_array=new Array();  
	$('input[name="ur_checkbox"]:checked').each(function(){  
	    id_array.push($(this).attr('id'));//向数组中添加元素  
	});  
	var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
  //设置一个空数组，存储被删除的行数
  var nullArr = [];
  //取得所有name值为ur_checkbox的input:checkbox存入数组
  var selectBoxNum = $("[name='ur_checkbox']");
  //设置一个中间变量判断input:checkbox全部没有选中，如果tmp=0则都未选中  
  var tmp = 0;

  //循环name值为ur_checkbox的input:checkbox,如果input:checkbox有选中,tmp++
  for (var i = 0; i < selectBoxNum.length; i++) {
    if (selectBoxNum[i].checked == true) {
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
      content:'请选择你要删除的学生！' 
    });
  } else {
    //弹出确认框
     layer.confirm('你确定删除全部选中的学生吗？',{icon: 3, title:'提示'},function(){
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
        		  url:"delete.html",
        		  data:{ids:idstr},
        		  dataType: "json",
        		  success:function(data){
					  if(data.flag==1){
						  layer.alert(data.msg,{icon:1},function(){
							  document.location.href="list.html";
						  });
					  }else{  
						  layer.alert(data.msg,{icon:2});
					  }
        		  }
         });
      
        //循环nullArr执行逆序删除，删除每行样式和删除removeButtonIndexArr中的值
        for (var i = nullArr.length-1; i >= 0  ; i--) {
          removeButtonIndexArr.splice(nullArr[i],1);
          $("[name='ur_checkbox']").eq(nullArr[i]).parent("td").parent("tr").remove();
        };
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


function getCla(gradeId){
	var gradeId=$("#selectGrade").val();
	    
		$.ajax({
			type:"post",
			url:"getClassByGrade.html",
			data:{gradeId:gradeId},
			
			success:function(result){
				var jsonList = eval("(" +result+ ")") ;

			 if(jsonList==null||jsonList==''){
				  layer.alert("该年级尚未创建班级！",{icon:2})
			}else{
				
				var select=document.getElementById('selectClass'); 
				select.options.length=0;
				
				for(var i=0;i<jsonList.length;i++){
				
				var op=document.createElement("option");      // 新建OPTION (op) 
				op.setAttribute("value",jsonList[i].classId);          // 设置OPTION的 VALUE 
				op.appendChild(document.createTextNode(jsonList[i].name)); // 设置OPTION的 TEXT
				select.appendChild(op);           // 为SELECT 新建一 OPTION(op)

				}
			}  
			
		},
		
		});
			
		
	}
</script>    
</body>
</html>