// +----------------------------------------------------------------------
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
  yazhuokj.shouChang();
  yazhuokj.chapterDetail();
});
/**
 *desc:构造函数 
 *@param void;
 *@return void;
 */
function Yazhuokj(){};
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
 *desc:查看收藏课程
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.shouChang=function(){
   $('.history').hover(function(){
      $(this).find('.hui-select-con').stop(true, true).fadeIn();
      $(this).find('.select-btn').css('border-bottom','none');
     }, function() {
        $(this).find('.hui-select-con').stop(true, true).fadeOut();
        $(this).find('.select-btn').css('border-bottom','1px solid #e8e8e8');
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
 *desc:课程公告添加new
 *@param void;
 *@return void;
 */
Yazhuokj.prototype.afficheNew=function(){
  $(".affiche-a span.txt").eq(0).addClass("new");
  $(".affiche-a span.txt").eq(1).addClass("new");
  $(".affiche-a span.txt").eq(2).addClass("new");
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
    $(".chapter_catalog01_title").click(function(){
    $(this).siblings(".chapter_catalog01_list_none").toggle();
  });
};
 /**
 *desc:课程分类折叠菜单
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
