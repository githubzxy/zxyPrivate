﻿/*+++++++++++++++++++++++++++++++++++++++++++++++++++//
//+++++desc:四川亚卓教育科技有限公司+++++++++++++++++++//
//+++++Website:www.yazhuojy.com++++++++++++++++++++++++//
//+++++Created By 亚卓技术部+++++++++++++++++++++++++++//

//++++++++++++++++jquery ++++++++++++++++*/
//++++++++++++++++jquery ++++++++++++++++*/
//++++++++++++++++jquery ++++++++++++++++*/

$(function(){
	//课程建设tabs切换
  $('.box-step li').each(function(index){
      $(this).click(function(){
         
          $('.box-step li').each(function(index){
        	  if($(this).attr("class")=="cur"){
        		  if(index==0){
        			  $('.box-course').hide();
        	          $('.box-course').eq(index).show();
        	          $('.box-step li').each(function(index){
        	        	  $(this).removeClass('cur');
        	          })
        	          $(this).addClass('cur');
        		  }else if(index==1){
        			  $('.box-course').hide();
        	          $('.box-course').eq(index).show();
        	          $('.box-step li').each(function(index){
        	        	  if(index==0 ||index==1){
        	          $(this).click(function(){
        	        	  $('.box-course').hide();
            	          $('.box-course').eq(index).show();
            	          $('.box-step li').each(function(index){
            	        	  $(this).removeClass('cur');
            	          })
            	          $(this).addClass('cur');
        	          })
        	        	  }
        	          })
        	          $(this).addClass('cur');
        		  }else if(index==2){
        			  $('.box-course').hide();
        	          $('.box-course').eq(index).show();
        	          $('.box-step li').each(function(index){
        	        	  if(index==0 ||index==1||index==2){
        	          $(this).click(function(){
        	        	  $('.box-course').hide();
            	          $('.box-course').eq(index).show();
            	          $('.box-step li').each(function(index){
            	        	  $(this).removeClass('cur');
            	          })
            	          $(this).addClass('cur');
        	          })
        	        	  }
        	          })
        	          $(this).addClass('cur');
        		  }
        	  }
             // $(this).removeClass('cur');
          });
        
      });
  });
  $('.nexnt').each(function(index){
	  if($(this).attr("name")!="stop"){
	  $(this).click(function(){
		  if(index!=2){
		    $('.box-course').hide();
		    $('.box-course').eq(index+1).show();
		    $('.box-step li').removeClass('cur');
		    $('.box-step li').eq(index+1).addClass("cur");
		  }
	  	});
	  }
  });
  //弹窗
   $(".click").click(function(){
      $(".mask").show();
    $(".tip").fadeIn(200);
    });
    
    $(".tiptop a").click(function(){
        $(".mask").hide();
    $(".tip").fadeOut(200);
  });

$(".sure").click(function(){
   $(".mask").hide();
   $(".tip").fadeOut(100);
});

$(".cancel").click(function(){
   $(".mask").hide();
   $(".tip").fadeOut(100);
});

//table
$('.tablelist tbody tr:odd').addClass('odd');
//上传资源
 $("#checkCourse").click(function(){
      $(".mask").show();
    $("#courseList").fadeIn(200);
    PageTmp();
    });
    
    $(".chooseTiptop a").click(function(){
        $(".mask").hide();
      $("#courseList").fadeOut(200);
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
  /**实现取消按钮**/
  $("#up_cancel").click(function(){
    $("#courseList").hide();
    //取得checkbox的集合
    var selectBoxNum = $("[name='up_checkbox']");

    for (var i = 0; i < selectBoxNum.length; i++) {
      selectBoxNum[i].checked = false;
    };

    $("#allPaperSelect").attr('checked',false);

    tmp=0;
  });
  /**实现全选和全不选**/ 
  //取一个中间变量判断allSelect的checkbox是否被选中
  var tmp = 0;
  $("#allSelect").click(function(){
    //取得checkbox的集合
    var selectBoxNum = $("[name='ur_checkbox']");
    if (tmp == 0) {
      for (var i = 0; i < selectBoxNum.length; i++) {
        selectBoxNum[i].checked = true;
      };
      tmp=1;
    } else {
      for (var i = 0; i < selectBoxNum.length; i++) {
        selectBoxNum[i].checked = false;
      };
      tmp=0;
    };
  });
  $("#allSelect1").click(function(){
	    //取得checkbox的集合
	    var selectBoxNum = $("[name='ur_checkbox1']");
	    if (tmp == 0) {
	      for (var i = 0; i < selectBoxNum.length; i++) {
	        selectBoxNum[i].checked = true;
	      };
	      tmp=1;
	    } else {
	      for (var i = 0; i < selectBoxNum.length; i++) {
	        selectBoxNum[i].checked = false;
	      };
	      tmp=0;
	    };
	  });
  $("#allPaperSelect").click(function(){
      //取得checkbox的集合
      var selectBoxNum = $("[name='up_checkbox']");
      if (tmp == 0) {
        for (var i = 0; i < selectBoxNum.length; i++) {
          selectBoxNum[i].checked = true;
        };
        tmp=1;
      } else {
      for (var i = 0; i < selectBoxNum.length; i++) {
          selectBoxNum[i].checked = false;
      };
        tmp=0;
      };
    });
});
 
 /** * 对Date的扩展，将 Date 转化为指定格式的String * 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q)
 可以用 1-2 个占位符 * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) * eg: * (new
 Date()).pattern("yyyy-MM-dd hh:mm:ss.S")==> 2006-07-02 08:09:04.423      
* (new Date()).pattern("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04      
* (new Date()).pattern("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04      
* (new Date()).pattern("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04      
* (new Date()).pattern("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18      
*/ 
 Date.prototype.pattern=function(fmt) {         
	    var o = {         
	    "M+" : this.getMonth()+1, //月份         
	    "d+" : this.getDate(), //日         
	    "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时         
	    "H+" : this.getHours(), //小时         
	    "m+" : this.getMinutes(), //分         
	    "s+" : this.getSeconds(), //秒         
	    "q+" : Math.floor((this.getMonth()+3)/3), //季度         
	    "S" : this.getMilliseconds() //毫秒         
	    };         
	    var week = {         
	    "0" : "/u65e5",         
	    "1" : "/u4e00",         
	    "2" : "/u4e8c",         
	    "3" : "/u4e09",         
	    "4" : "/u56db",         
	    "5" : "/u4e94",         
	    "6" : "/u516d"        
	    };         
	    if(/(y+)/.test(fmt)){         
	        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));         
	    }         
	    if(/(E+)/.test(fmt)){         
	        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);         
	    }         
	    for(var k in o){         
	        if(new RegExp("("+ k +")").test(fmt)){         
	            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));         
	        }         
	    }         
	    return fmt;         
	} 












































































