<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
<title>个人中心-亚卓数字教学中心</title>
<!--站标-->
<link rel="shortcut icon" href="${res }/images/ico/favicon.ico" type="image/x-icon" />
<!--站标-->
<!--css-->
<link rel="stylesheet" type="text/css" href="${res}/student/css/global.css" />
<link rel="stylesheet" type="text/css" href="${res}/student/css/vip.css" />
<!--/css-->
<!--js-->
<script type="text/javascript" src="${res}/student/js/jquery.min.js"></script>
<script type="text/javascript" src="${res}/student/js/layer/layer.js"></script>
<script type="text/javascript" src="${res}/student/js/base.js"></script>
<script type="text/javascript" src="${res}/student/js/jquery.countdown.js"></script>
<!--/js-->
</head>
<body class="exam_bg">
   <div class="content_exam">
     <div class="exam-title-top">
        <p class="title">${paper.title }</p>
        <p class="alt"><span style="float: left;padding-left:25px">姓名：${name}</span>交卷时间：${subDate}</p>
        <div class="score">${subject1.stuScore+subject2.stuScore+subject3.stuScore}</div>
      </div><!--exam-title-top end-->
      <div class="exam-alt">
        本试卷共有<label id="topicnumlbl">${subject1.subjectNum+subject2.subjectNum+subject3.subjectNum}</label>道题！
      </div><!--exam-alt end-->
      <div class="content-main_exam">
        <!--left-->
         <div class="nyexam-content-left" >
             <c:forEach items="${hwTest1}" var="hw" varStatus="status">
              <div class="exam-info" >
              <div class="title">
                <label id="lbl_1">${(status.index+1)}</label>
                <span>[单选]</span>${hw.title }？（） （${subject1.totalScore/subject1.subjectNum}分）
               </div>
               <div class="options" id="${hw.subjectId}">
                  <dl>
                    <dt><input value="A"  name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}" num="${(status.index+1)}" onclick="SignComplete(this,'single')" type="radio"></dt>
                    <dd><label  name="stuAnswers">A、${hw.optionsA} </label></dd>
                  </dl>
                   <dl>
                    <dt><input value="B" name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}" num="${(status.index+1)}" onclick="SignComplete(this,'single')" type="radio"></dt>
                    <dd><label  name="stuAnswers">B、${hw.optionsB}  </label></dd>
                  </dl>
                   <dl>
                    <dt><input value="C" name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}" num="${(status.index+1)}" onclick="SignComplete(this,'single')" type="radio"></dt>
                    <dd><label  name="stuAnswers">C、${hw.optionsC}  </label></dd>
                  </dl>
                   <dl>
                    <dt><input value="D" name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}" num="${(status.index+1)}" onclick="SignComplete(this,'single')" type="radio"></dt>
                    <dd><label  name="stuAnswers">D、${hw.optionsD}  </label></dd>
                  </dl>
                  <div class="ans-analysis" name="result" style="display:;">
                  <div class="ans-right">正确答案：${hw.trueOption}</div>
                  <input value="${hw.stuAnswer}" type="hidden" id="stuAnswers_${hw.subjectId}">
                    
                  </div>
                 <!--  <div class="exam-teacher" name="result" style="display:none;">
                    <span>考点难点：</span>正确认识自己的前提是。答案为 D
                  </div> -->
                  <div class="bj"><a href="javascript:void(0);" name="${(status.index+1)}" onclick="Sign(this)">标记</a></div>
                </div>
                      
            </div><!--单个题目单选-->
              </c:forEach> 
                <c:forEach items="${hwTest2}" var="hw" varStatus="status">
            <div class="exam-info" >
              <div class="title">
                <label id="lbl_3">${(status.index+1+subject1.subjectNum)}</label>、
                <span>[判断]</span>${hw.title }？   （     ） （${subject2.totalScore/subject2.subjectNum}分）
               </div>
               <div class="options" id="${hw.subjectId}">
                  <dl>
                    <dt><input value="A" name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}" num="${(status.index+1+subject1.subjectNum)}" onclick="SignComplete(this,'single')" type="radio"></dt>
                    <dd><label  name="3">A、对 </label></dd>
                  </dl>
                   <dl>
                    <dt><input value="B"  name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}" num="${(status.index+1+subject1.subjectNum)}" onclick="SignComplete(this,'single')" type="radio"></dt>
                    <dd><label  name="3">B、错  </label></dd>
                  </dl>
                  <div class="ans-analysis" name="result" style="display:;">
                  <div class="ans-right">正确答案：${hw.trueOption}</div>
                   <input value="${hw.stuAnswer}" type="hidden" id="stuAnswers_${hw.subjectId}">
                  </div>
                  <div class="exam-teacher" name="result" style="display:none;">
                    <span>考点难点：</span>小明上课经常骂人，说明他心理不健康？答案为 A
                  </div>
                  <div class="bj"><a href="javascript:void(0);" name="${(status.index+1+subject1.subjectNum)}" onclick="Sign(this)">标记</a></div>
                </div>
            </div><!--单个题目判断-->
              </c:forEach> 
                <c:forEach items="${hwTest3}" var="hw" varStatus="status">
             <div class="exam-info" >
              <div class="title">
                <label id="lbl_2">${(status.index+1+subject1.subjectNum+subject2.subjectNum)}</label>、
                <span>[多选]</span>${hw.title }？（）（${subject3.totalScore/subject3.subjectNum}分）
               </div>
               <div class="options" id="${hw.subjectId}">
                  <dl>
                    <dt><input value="A"  name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}" num="${(status.index+1+subject1.subjectNum+subject2.subjectNum)}" onchange="SignComplete(this,'multi')" type="checkbox"></dt>
                    <dd><label>A、${hw.optionsA}</label></dd>
                  </dl>
                  <dl>
                    <dt><input value="B" name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}" num="${(status.index+1+subject1.subjectNum+subject2.subjectNum)}" onchange="SignComplete(this,'multi')" type="checkbox"></dt>
                    <dd><label>B、 ${hw.optionsB}</label></dd>
                  </dl>
                  <dl>
                    <dt><input value="C"  name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}"  num="${(status.index+1+subject1.subjectNum+subject2.subjectNum)}" onchange="SignComplete(this,'multi')" type="checkbox"></dt>
                    <dd><label>C、${hw.optionsC}</label></dd>
                  </dl>
                  <dl>
                    <dt><input value="D"  name="stuAnswers_${hw.subjectId}" class="stuAnswers_${hw.subjectId}" num="${(status.index+1+subject1.subjectNum+subject2.subjectNum)}" onchange="SignComplete(this,'multi')" type="checkbox"></dt>
                    <dd><label>D、${hw.optionsD}</label></dd>
                  </dl>
                  <div class="ans-analysis" name="result" style="display:;">
                  <div class="ans-right">正确答案：${hw.trueOption}</div>
                  <input value="${hw.stuAnswer}" type="hidden" id="stuAnswers_${hw.subjectId}">
                  </div>
                  <!-- <div class="exam-teacher" name="result" style="display:;">
                    <span>考点难点：</span>缓解压力的心理调节方法有哪些？答案为 A、B、C、D
                  </div> -->
                  <div class="bj"><a href="javascript:void(0);" name="${(status.index+1+subject1.subjectNum+subject2.subjectNum)}" onclick="Sign(this)">标记</a></div>
                </div>
            </div><!--单个题目多选-->
                 </c:forEach> 
             
            <!-- <div class="exam-info">
              <div class="title">
                <label id="lbl_4">4</label>、
                <span>[主观题]</span>什么是社交恐怖症？ （40分）
               </div>
               <div class="options">
                  <dl>
                    <dd><textarea name="4"></textarea></dd>
                  </dl>  
                  <div class="ans-analysis" name="result" style="display:;">
                    <div class="ans-right">参考答案：主要是指害怕出现在众人面前,回避与别人谈话,特别是不敢到公共场所,缺乏自信,表现为在人群中害怕，发抖,脸红,出汗或行为笨拙,手足无措,怕跟别人对视, 引起别人的注意.</div>
                  </div>        
                  <div class="bj"><a href="javascript:void(0);" name="4" onclick="Sign(this)">标记</a></div>
                </div>
            </div>单个主观题
             <div class="exam-info">
              <div class="title">
                <label id="lbl_5">5</label>、
                <span>[主观题]</span>什么是社交恐怖症？ （40分）
               </div>
               <div class="options">
                  <dl>
                    <dd><textarea name="5"></textarea></dd>
                  </dl>  
                  <div class="ans-analysis" name="result" style="display:;">
                    <div class="ans-right">参考答案：主要是指害怕出现在众人面前,回避与别人谈话,特别是不敢到公共场所,缺乏自信,表现为在人群中害怕，发抖,脸红,出汗或行为笨拙,手足无措,怕跟别人对视, 引起别人的注意.</div>
                  </div>        
                  <div class="bj"><a href="javascript:void(0);" name="5" onclick="Sign(this)">标记</a></div>
                </div>
            </div>单个主观题
             <div class="exam-info">
              <div class="title">
                <label id="lbl_6">6</label>、
                <span>[主观题]</span>什么是社交恐怖症？ （40分）
               </div>
               <div class="options">
                  <dl>
                    <dd><textarea name="6"></textarea></dd>
                  </dl>  
                  <div class="ans-analysis" name="result" style="display:;">
                    <div class="ans-right">参考答案：主要是指害怕出现在众人面前,回避与别人谈话,特别是不敢到公共场所,缺乏自信,表现为在人群中害怕，发抖,脸红,出汗或行为笨拙,手足无措,怕跟别人对视, 引起别人的注意.</div>
                  </div>        
                  <div class="bj"><a href="javascript:void(0);" name="6" onclick="Sign(this)">标记</a></div>
                </div>
            </div>单个主观题 -->
            
         </div><!--/left-->
        
        
         <!--right-->
         <div class="nyexam-content-right" id="divResultMenu">
            <div id="resultmenu">
             <c:if test="${subject1.totalScore>0}">
             <div class="exam-qus">
             <div class="exam-type">单选题（共${subject1.totalScore}分）</div>
               <ul>
                <c:forEach items="${hwTest1}" var="hw" varStatus="status">
                <li><a href="#lbl_1" name="a_${(status.index+1)}">${(status.index+1)}</a></li>
               </c:forEach>
              </ul>
            </div>
          </c:if>
            
          <c:if test="${subject2.totalScore>0}">
           <div class="exam-qus">
              <div class="exam-type">判断题（共${subject2.totalScore}分）</div>
              <ul>
                <c:forEach items="${hwTest2}" var="hw" varStatus="status">
                <li><a href="#lbl_2" name="a_${(status.index+1+subject1.subjectNum)}">${(status.index+1+subject1.subjectNum)}</a></li>
               </c:forEach>
              </ul>
            </div>
          </c:if>
           
            <c:if test="${subject3.totalScore>0}">
             <div class="exam-qus">
              <div class="exam-type">多选题（共${subject3.totalScore}分）</div>
              <ul>
                <c:forEach items="${hwTest3}" var="hw" varStatus="status">
                <li><a href="#lbl_2" name="a_${(status.index+1+subject1.subjectNum+subject2.subjectNum)}">${(status.index+1+subject1.subjectNum+subject2.subjectNum)}</a></li>
               </c:forEach>
              </ul>
            </div>
          </c:if>
            
    <!--         <div class="exam-qus">
              <div class="exam-type">主观题（共40分）</div>
              <ul>
               <li><a href="#lbl_4" name="a_4">4</a></li>
               <li><a href="#lbl_5" name="a_5">5</a></li>
               <li><a href="#lbl_6" name="a_6">6</a></li>
              </ul>
            </div>
          </div>resultmenu end -->
          <a href="javascript:void(0);" class="btn-subexam">已提交</a>
          <div class="exam-tps">
              <div class="yz"> 已做</div>
              <div class="bj">标记</div>
              <div class="wz">未做</div>
          </div>
         </div><!--right end-->
      </div><!--content-main_exam end-->
   </div>

<script type="text/javascript">

$(function(){
	setStuAnswer();
})
             
$(document).ready(function (e) {
    //右侧跟随滑动特效
    var ie6 = ! -[1, ] && !window.XMLHttpRequest;
    $(window).scroll(function () {
        var s = $(window).scrollTop();
        if (s >= 210) {
            $("#exam-opts,#divResultMenu").addClass('exam-opts-fix');
            if (ie6) {
                $("#exam-opts,#divResultMenu").addClass('exam-opts-fixie');
            }
        } else {
            $("#exam-opts,#divResultMenu").removeClass('exam-opts-fix');
            $("#exam-opts,#divResultMenu").removeClass('exam-opts-fixie');
        }
    })

});
//完成题型标注
function SignComplete(obj, type) {
  var name = $(obj).attr("num");
  switch (type) {
      case 'single':
      case 'judge':
          $("[name='a_" + name + "']").parent().addClass("f");
          break;
      case 'fill':
          var isCheck = 0;
          $.each($("input[num='" + name + "']"), function (i, v) {
              if ($(v).val() != "") {
                  isCheck += 1;
              }
          });

          if (isCheck > 0)
              $("[name='a_" + name + "']").parent().addClass("f");
          else
              $("[name='a_" + name + "']").parent().removeClass("f");

          break;
      case 'multi':
          var ckName = $(obj).attr("num");
          if ($("input[num='" + ckName + "']:checked").length > 0)
              $("[name='a_" + ckName + "']").parent().addClass("f");
          else
              $("[name='a_" + ckName + "']").parent().removeClass("f");
          break;
  }
}

//标记
function Sign(obj) {
    var name = $(obj).attr("name");
    var parent = $(obj).parent();
    if (parent.hasClass("bj-click")) {
        parent.removeClass("bj-click");
        $("[name='a_" + name + "']").parent().removeClass("bj");
    } else {
        parent.addClass("bj-click");
        $("[name='a_" + name + "']").parent().addClass("bj");
    }
}

//还原学生选择
function setStuAnswer(){
	$('.options').each(function(){
		var flag = false;
		var ulObj = $(this);
		var subjectId = ulObj.attr("id");
		var strs="";
		var str="";
		ulObj.children('dl').children('dt').children('input').each(function(){
					 str=$("#stuAnswers_"+subjectId+"").val()
					if($(this).attr('type')=='radio'){
						$("input[name='stuAnswers_"+subjectId+"'][value='"+str+"']").attr("checked",true);
						flag = true;
					}else if($(this).attr('type')=='checkbox'){
						for (i=0 ; i < str.length ; i++ ){
							 strs=str.substr(i,1);
							$("input[name='stuAnswers_"+subjectId+"'][value='"+strs+"']").attr("checked",true);
						}
						flag = true;
					}
				
					
		});
		
	})
}

$(".btn-subexam").click(function(){
	 layer.alert("已提交，是否关闭窗口",{icon:3},function(){
		 window.opener=null;window.close();
	  });
})
 
  

  

</script>
</body>
</html>

   