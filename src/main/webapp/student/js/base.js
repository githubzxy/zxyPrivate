$(function(){
	//锚点连接平滑滚动
	$('a[href*=#]').click(function() {
		if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
		var $target = $(this.hash);
		$target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
		if ($target.length) {
		var targetOffset = $target.offset().top;
		$('html,body').animate({
		scrollTop: targetOffset
		},
		500);
		return false;
		}
		}
		});
	
  //课程章节
    $(".chapter_catalog01_title").click(function(){
    $(this).siblings(".chapter_catalog01_list_none").toggle();
    }); 
 //学生看视频列表显示
   $(".video_list_course .icon-left").click(function(){
    $(this).parent().css('width','0px');
    $(this).stop(true, true).fadeOut(); 
    $(this).siblings('.yazhuo_couser_list_player').hide();
    $("#yazhuoVideo").css('width','1200px');
    $(".video_list_course .operator").stop(true, true).fadeIn();
  });
     $(".video_list_course .operator .chapter").click(function(){
     $("#yazhuoVideo").css('width','900px').animate('left','0px');
     $(".video_list_course .operator").stop(true, true).fadeOut();
      $(".video_list_course").css('width','300px').animate('left','300px');
      $(this).parent().siblings('.yazhuo_couser_list_player').show();
      $('.video_list_course .icon-left').stop(true, true).fadeIn();
    });
   
	 //鼠标移入移除显示隐藏
	$(".father").hover(function() {
        $(this).find('.son').stop(true, true).fadeIn();
    }, function() {
        $(this).find('.son').stop(true, true).fadeOut();
    });
//脚部微信渐显
 $('.ft_icon a.wechat').hover(function() {
    $(this).find('.gwxLi').stop(true, true).fadeIn();
  }, function() {
    $(this).find('.gwxLi').stop(true, true).fadeOut();
  });

    //首页tabs切换
	$(".class dl dt").mouseover(function(){
		$(".class dl dt").removeClass("on")
		$(this).addClass("on");
		$(".class dl dd").stop(true, true).fadeOut();
		$(this).parent().find("dd").stop(true, true).fadeIn();
    });	
	


   //小学生个人中心页面切换
   $(".vip_class_resource_title span").click(function(){
     $(".vip_class_resource_title span").removeClass("on");
     $(this).addClass("on");
   });

   $(".vip_class_resource_title span").eq(0).click(function(){
   	   $(".class_resource").eq(1).stop(true, true).hide();
   	   $(".class_resource").eq(0).stop(true, true).fadeIn(300);
   	   $(".vip_class_resource_title .xuanke").fadeIn(300);
   })

   $(".vip_class_resource_title span").eq(1).click(function(){
   	   $(".class_resource").eq(0).stop(true, true).hide();
   	   $(".class_resource").eq(1).stop(true, true).fadeIn(300);
   	   $(".vip_class_resource_title .xuanke").fadeOut();
   })



    
  


//问答页面
$(".huida_btn").click(function(){
    if($(this).parent().parent().parent().find(".hide").is(":hidden")){
        $(".answer_questions_detailed .li").removeClass("bg");
        $(this).parent().parent().parent().addClass("bg");
    }else{
         $(this).parent().parent().parent().removeClass("bg");
    }
});
   

//评论展开隐藏
$(".shouqi").click(function(){
     if($(this).parent().parent().parent().find(".pinglun_list").is(":hidden")){
         $(this).parent().parent().parent().find(".pinglun_list").stop(true, true).fadeIn();
         $(this).text("收起");
         $(this).removeClass("zhankai");
    }else{
         $(this).parent().parent().parent().find(".pinglun_list").stop(true, true).fadeOut();
         $(this).text("展开");
          $(this).addClass("zhankai");
    } 
});





});



