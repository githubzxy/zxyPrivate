﻿// +----------------------------------------------------------------------
// | desc: global js
// +----------------------------------------------------------------------
// | Created By 2016-11-11
// +----------------------------------------------------------------------
// | Author: 亚卓技术部前端人员--欧攀、曾籍 、陈安国 后端开发人员：刘成元
// +----------------------------------------------------------------------

function searchToggle(obj, evt){
      var container = $(obj).closest('.search-wrapper');
      if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
      }
      else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            container.find('.search-input').val('');          
      } 
}
//////////////////////////////////////////////////////////////////////////////////
/**
 *desc:初始化加载
 *@param void;
 *@return void;
 */
$(function(){
  yazhuokj.banner();
  yazhuokj.wechatShow();
  yazhuokj.teacherDetail();
  yazhuokj.LoginDropHeader();
  yazhuokj.chapterDetail();
  yazhuokj.otherTabs();
  yazhuokj.applyNum();
});
/**
 *desc:构造函数 
 *@param void;
 *@return void;
 */
function Yazhuokj(){};

/**
*desc:登录后下拉框
*@param void;
*@return void;
*/
Yazhuokj.prototype.LoginDropHeader=function(){
 $(".header-pic-logout").hover(function(){
	 $(this).find(".drapmenuindex").show();
 },function(){
	 $(this).find(".drapmenuindex").hide();
 });
};

 /**
 *desc:大图轮播
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.banner=function(){
   $(".full_banner").slide({
     titCell:".hd ul", 
     mainCell:".bd ul", 
     effect:"fold",  
     autoPlay:true, 
     autoPage:true,
     trigger:"click",
     interTime:3500
  }); 
};

     
 /**
 *desc:footer 微信渐隐渐现
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.wechatShow=function(){
  $('.ft_icon a.wechat').hover(function() {
    $(this).find('.gwxLi').stop(true, true).fadeIn();
  }, function() {
    $(this).find('.gwxLi').stop(true, true).fadeOut();
  });
};

 /**
 *desc:亚卓名师团队
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.teacherDetail=function(){
  $('.teacherlist li').hover(function() {
    $(this).find('a img').removeClass("a-img").addClass("a-img1");
    $(this).find('.na').removeClass("tname").addClass("tname1");
  }, function() {
    $(this).find('a img').removeClass("a-img1").addClass("a-img");
    $(this).find('.na').removeClass("tname1").addClass("tname");
  });
};
 /**
 *desc:章节
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.chapterDetail=function(){
	
     $(".chapter_list_view dl dd .list_view_detail ").eq(0).css("display",'block');
     $(".chapter_list_view dl dt").find('img').eq(0).attr('src','/front/images/icon/icon_zhangjie_pre.png');
     $(".chapter_list_view dl .list_view_title").eq(0).next().val("1");
    $(".chapter_list_view dl .list_view_title").click(function(){
    var flag = $(this).next().val();
    $(this).siblings(".list_view_detail").slideToggle();
    if(flag==0){
    	$(this).parent().siblings().find('img').attr('src','/front/images/icon/icon_zhangjie_pre.png');
    	$(this).next().val("1");
    }if(flag==1){
    	$(this).parent().siblings().find('img').attr('src','/front/images/icon/icon_zhangjie-new.png');
    	$(this).next().val("0");
    }
    
  });
};
 /**
 *desc:课程分类折叠菜单
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.NavMenu=function(){
//菜单隐藏展开
  var tabs_i=0;
  $('.categories_title').click(function(){
    var _self = $(this);
    var j = $('.categories_title').index(_self);
    if( tabs_i == j ) return false; 
    tabs_i = j;
    $('.categories_title em').each(function(e){
      if(e==tabs_i){
        $('em',_self).removeClass('courseCategories_v02').addClass('courseCategories_v01');
      }else{
        $(this).removeClass('courseCategories_v01').addClass('courseCategories_v02');
      }
    });
    $('.categories_ul').slideUp().eq(tabs_i).slideDown();
  }); 
  
  
  
};
  
/**
 *desc:意见反馈申请账号
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.otherTabs=function(){
    //other tabs
       $('.clist  li.item').each(function(index){
        $(this).click(function(){
            $('.item-content-tabs').hide();
             $('.course-list-ul').hide();
            $('.item-list-f_'+index).show();
            $('.clist  li.item').each(function(){
                $(this).removeClass('active');
                $(".category-list-tit span").text($(this).text());
            });
            $(this).addClass('active');
            $(".category-list-tit span").text($(this).text());
        });
    });
};

/**
 *desc:申请账号
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.applyNum=function(){
   //申请帐号
    $('.select_ul li').each(function(index){
        $(this).click(function(){
            $('.form-div').hide();
            $('.form-div_'+index).show();
            $('.select_ul li').each(function(){
                $(this).removeClass('cur');
            });
            $(this).addClass('cur');
        });
    });   

};
/**
 *desc:观看视频
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.NavMenu=function(index){
	//菜单隐藏展开
	  var tabs_i=index;
	  $('.categories_title').click(function(){
	    var _self = $(this);
	    var j = $('.categories_title').index(_self);
	    if( tabs_i == j ) return false; 
	    tabs_i = j;
	    $('.categories_title em').each(function(e){
	      if(e==tabs_i){
	        $('em',_self).removeClass('courseCategories_v02').addClass('courseCategories_v01');
	      }else{
	        $(this).removeClass('courseCategories_v01').addClass('courseCategories_v02');
	      }
	    });
	    $('.categories_ul').slideUp().eq(tabs_i).slideDown();
	  });
	  
	}; 
   
/**
 *desc:构造函数实例化
 */
var yazhuokj=new Yazhuokj();
