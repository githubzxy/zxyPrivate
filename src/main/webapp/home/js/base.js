/*******************************************
	Created By 欧攀 On 2016年
********************************************/
$(function(){

	//查看收藏课程
     $('.history').hover(function(){
      $(this).find('.hui-select-con').stop(true, true).fadeIn();
      $(this).find('.select-btn').css('border-bottom','none');
     }, function() {
        $(this).find('.hui-select-con').stop(true, true).fadeOut();
        $(this).find('.select-btn').css('border-bottom','1px solid #e8e8e8');
    });
     //首页上登陆弹窗
     var tc_left = ($(window).width()-$(".tc_login_wrap").width())/2;
     var tc_top = ($(window).height()-$(".tc_login_wrap").height())/2;
    $(".tclogin").click(function(){
        $(".mask").show();
        $(".tc_login_wrap").show();
        $(".tc_login_wrap").css("left",tc_left).css("top",tc_top);
    });
    $(".closex").click(function(){
        $(".mask").hide();
        $(".tc_login_wrap").hide();
    });
    //首页全部课程
    $('.all-sort-list > .item').hover(function(){
            var eq = $('.all-sort-list > .item').index(this),               //获取当前滑过是第几个元素
                h = $('.all-sort-list').offset().top,                       //获取当前下拉菜单距离窗口多少像素
                s = $(window).scrollTop(),                                  //获取游览器滚动了多少高度
                i = $(this).offset().top,                                   //当前元素滑过距离窗口多少像素
                item = $(this).children('.item-list').height(),             //下拉菜单子类内容容器的高度
                sort = $('.all-sort-list').height();                        //父类分类列表容器的高度
            
            if ( item < sort ){                                             //如果子类的高度小于父类的高度
                if ( eq == 0 ){
                    $(this).children('.item-list').css('top', (i-h));
                } else {
                    $(this).children('.item-list').css('top', (i-h)+1);
                }
            } else {
                if ( s > h ) {                                              //判断子类的显示位置，如果滚动的高度大于所有分类列表容器的高度
                    if ( i-s > 0 ){                                         //则 继续判断当前滑过容器的位置 是否有一半超出窗口一半在窗口内显示的Bug,
                        $(this).children('.item-list').css('top', (s-h)+2 );
                    } else {
                        $(this).children('.item-list').css('top', (s-h)-(-(i-s))+2 );
                    }
                } else {
                    $(this).children('.item-list').css('top', 3 );
                }
            }   

            $(this).addClass('hover');
            $(this).children('.item-list').css('display','block');
        },function(){
            $(this).removeClass('hover');
            $(this).children('.item-list').css('display','none');
        });

        $('.item > .item-list > .close').click(function(){
            $(this).parent().parent().removeClass('hover');
            $(this).parent().hide();
        });



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







    
    //tabs课程切换
       $('.course-panel .categary-list li').eq(0).addClass('on');
       $('.class-list_0').show();
        $('.course-panel .categary-list li').eq(0).click(function(){ 
            $('.class-list').hide();
            $('.class-list_0').show();
            $(this).addClass('on');
            $('.course-panel .categary-list li').eq(1).removeClass('on');
            $('.course-panel .categary-list li').eq(2).removeClass('on');
        });
        $('.course-panel .categary-list li').eq(1).click(function(){ 
            $('.class-list').hide();
            $('.class-list_1').show();
            $(this).addClass('on');
            $('.course-panel .categary-list li').eq(0).removeClass('on');
            $('.course-panel .categary-list li').eq(2).removeClass('on');
        });
        $('.course-panel .categary-list li').eq(2).click(function(){ 
            $('.class-list').hide();
            $('.class-list_2').show();
            $(this).addClass('on');
            $('.course-panel .categary-list li').eq(0).removeClass('on');
            $('.course-panel .categary-list li').eq(1).removeClass('on');
        });
        
         $('#box ul li').hover(function(){
            $(this).find('.num').hide().siblings('.word').css({'display':'block','background':'#f60','color':'white'});
        },function(){ 
            $(this).find('.num').css({'display':'block','background':'white','color':'#666'}).siblings('.word').hide().css({'display':'none','background':'','color':''});
        })
        // @ 给窗口加滚动条事件
        $(window).scroll(function(){
            // 获得窗口滚动上去的距离
            var ling = $(document).scrollTop();
            // 在标题栏显示滚动的距离
            //document.title = ling;
            // 如果滚动距离大于1534的时候让滚动框出来
            if(ling>650){
                $('#box').show();
            }
            if(650<ling && ling<1250){
                // 让第一层的数字隐藏，文字显示，让其他兄弟元素的li数字显示，文字隐藏
                $('#box ul li').eq(0).find('.num').hide().siblings('.word').css('display','block');
                $('#box ul li').eq(0).siblings('li').find('.num').css('display','block').siblings('.word').hide();
            }else if(ling<1425){
                $('#box ul li').eq(1).find('.num').hide().siblings('.word').css('display','block');
                $('#box ul li').eq(1).siblings('li').find('.num').css('display','block').siblings('.word').hide();
            }else if(ling<1775){
                $('#box ul li').eq(2).find('.num').hide().siblings('.word').css('display','block');
                $('#box ul li').eq(2).siblings('li').find('.num').css('display','block').siblings('.word').hide();
            }else if(ling<2190){
                $('#box ul li').eq(3).find('.num').hide().siblings('.word').css('display','block');
                $('#box ul li').eq(3).siblings('li').find('.num').css('display','block').siblings('.word').hide();
            }else if(ling<2600){
                $('#box ul li').eq(4).find('.num').hide().siblings('.word').css('display','block');
                $('#box ul li').eq(4).siblings('li').find('.num').css('display','block').siblings('.word').hide();
            }
            if(ling>3000 || ling<650){
                // $('#box').css('display','none');  // @ 这一句和下一句效果一样。
                $('#box').hide();
            }
            
        })
      
    //教学资源
    $(".mr_frUl li ").hover(function(){
               $(this).find(".play").stop(true,true).fadeIn();
    },function(){
              $(this).find(".play").stop(true,true).fadeOut();
    });
	//footer微信微渐显效果
    $('.shipImg a.weixin').hover(function() {
        $(this).find('.gwxLi').stop(true, true).fadeIn();
    }, function() {
        $(this).find('.gwxLi').stop(true, true).fadeOut();
    });
    //返回顶部
    // Animate the scroll to top
    $('#go-top').click(function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, 200);
    });
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
    //study.html页面关注
      $(".yazhuo_guanzhu_staus .yazhuo_guanzhu_staus_01").click(function(){
        $(this).hide(); 
        $(this).siblings(".yazhuo_guanzhu_staus_02").show();
       });
     //章节
                $(".chapter_catalog01_title").click(function(){
        $(this).siblings(".chapter_catalog01_list_none").toggle();
       });

    //video播放视频界面
    $('.yazhuo_couser_list_player .yazhuo_couser_list_player_listt li .yazhuoline').last().css("display","none"); 
        $(".yazhuo_anniu_list_play").click(function() { 
                         $(this).hide();
                         $(this).siblings(".yazhuo_anniu_list_play2").show();
        $(this).parent().siblings('.yazhuo_couser_list_player').animate({right:"362px"},1000);
        $(this).parent().animate({left:"145px"},1000);
        });
        
        $(".yazhuo_anniu_list_play2").click(function() {    
         $(this).hide();
                         $(this).siblings(".yazhuo_anniu_list_play").show();
        $(this).parent().siblings('.yazhuo_couser_list_player').animate({right:"0px"},1000);
        $(this).parent().animate({left:"0px"},1000);
        });
        

});
	