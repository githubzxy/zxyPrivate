<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="res" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>编辑权限组</title>
		<link href="${res}/css/roleStyle/add.css?t=1" type="text/css" rel="stylesheet" />
		<script src="${res}/js/jquery-1.8.3.min.js?t=90" type="text/javascript" ></script>
<script src="${res}/js/jquery.form.js?t=90" type="text/javascript"></script>
<script type="text/javascript" src="${res}/plugin/layer/layer/layer.js"></script><!--弹窗-->
<script src="${res}/js/jquery-validation/1.10.0/jquery.validate.min.js?t=90" type="text/javascript"></script>
<script src="${res}/js/jquery-validation/1.10.0/messages_bs_zh.js?t=90" type="text/javascript"></script>
		
<style>
table tr td{text-align:center;height:25px;border:1px solid #eee;}
.save_submit{border:none;margin:10px 0 0 180px;width:80px;height:30px;line-height:30px;font-size:14px;color:#fff;background:#125caa;border-radius:5px;cursor:pointer;text-align:center;}
</style>
	</head>

	<body>
		<!-- Container -->
		<div id="container">
			<div class="shell">
				<!-- Small Nav -->
				<div class="tit_bg">
					当前位置：编辑权限组
					<a href="javascript:history.go(-1);">[返回]</a>
				</div>
				<!-- End Small Nav -->
				<input name="roleId" value="${roleId}" type="hidden"/>
				<!-- Box -->
				<div class="box">
					<form action="/admin/role/set/${roleId}.html" method="post" id="addResForm" class="x-form" >
						<div id="error_div" class="x-formfield" style="display:none" >
							<label class="x-formfield-label">&nbsp;</label>
							<span id="error_text" style="color:#ff0000"></span>
						</div>
						
						<div class="x-formfield">
							<label class="x-formfield-label">
								权限组名称
							</label>
							<div class="x-formfield-container">
								<input type="text"  id="groupName" name="roleName" value="${roleName }" maxlength="50"/>
								&nbsp;
								<span>*</span>
							</div>
						</div>
						<div class="x-formfield">
							<label class="x-formfield-label">
								资源权限
							</label>
							<div class="x-formfield-container">
								<table cellspacing="0" cellpadding="0" class="table4_da">
									<thead>
										<tr>
											<td style='width:150px;'>导航菜单</td>
											<td style='width:150px;'>应用模块</td>
											<td>子模块</td>
											<td>操作权限</td>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${reslist}" var="con" varStatus="index">
										<tr>
											<td>
												<input type="checkbox" name="controllerId" cindex="1" cflag="${con.id }" value="${con.id }"<c:if test="${con.flag == 1 }">checked</c:if> />
												${con.conName }
											</td>
											<td colspan ='4'>&nbsp;</td>
										</tr>
										<c:forEach items="${con.children }" var="child1">
											<tr>
												<td>&nbsp;</td>
												<td>
													<input type="checkbox" name="controllerId" cindex="2" cflag="${con.id}_${child1.id}" value="${child1.id }"<c:if test="${child1.flag == 1 }">checked</c:if> />
													${child1.conName }
												</td>
												<td colspan="3">&nbsp;</td>
											</tr>
											<c:forEach items="${child1.children }" var="child2">
												<tr>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>
														<input type="checkbox" class="controllerId_child3" name="controllerId" cindex="3" cflag="${con.id}_${child1.id}_${child2.id }" value="${child2.id }"<c:if test="${child2.flag == 1 }">checked</c:if> />
														${child2.conName }
													</td>
													<td>
														<c:forEach items="${child2.children }" var ="child3">
															<input type="checkbox" name="controllerId"  cindex="4" cflag="${con.id}_${child1.id}_${child2.id }_${child3.id }" value="${child3.id }"<c:if test="${child3.flag == 1 }">checked</c:if> />
															${child3.conName }
														</c:forEach>
													</td>
												</tr>
											</c:forEach>
										</c:forEach>
									</c:forEach>
									</tbody>
								</table>
								<span></span>
							</div>
						</div>
						<div>
							<input type="button" value="保存提交"  class="save_submit" onclick="addRes()"/>
						</div>
					</form>
					<div style="clear: both"></div>
				</div>
				<!-- End Box -->

			</div>
		</div>
		<!-- End Container -->
<script type="text/javascript">
	$("input[name='controllerId']").click(function(obj){
			var pflag = $(this).attr("cflag");
			var cindex = $(this).attr("cindex");
			if($(this).attr("checked")=="checked"){//全选
				$("input[name='controllerId']").each(function(index,obj){
					var cflag = $(this).attr("cflag");
					
					if(cflag.indexOf(pflag)==0){
						$(this).attr("checked","checked");
					}
					var pindex = $(this).attr("cindex");
					if(pindex<cindex){//选中父级
						$(this).attr("checked","checked");
					}
				});
			}else{//全不选
				$("input[name='controllerId']").each(function(index,obj){
					var cflag = $(this).attr("cflag");
					if(cflag.indexOf(pflag)==0){
						$(this).removeAttr("checked");
					}
				});
			}
		});	
	/* var iscommiting = false;
	jQuery(function() {
		$("#isDefault").val("${info.isDefault }");
		$("#addResForm").validate({
			rules: {
				groupName: {required:true},
				ps: {maxlength:1000}
			},
			messages:{
				res_name: {required:"请填写权限组名称!"},
				ps: {maxlength:"权限组说明不能多于1000字!"}
			},
			submitHandler: function(form) {
				if(iscommiting){
					return false;
				}
				iscommiting = true;
				addRes();
			}
		});
	}); */
	function isGo(){
		var children3 = [];
		$(".controllerId_child3").each(function(index,obj){
			if($(this).attr("checked")=="checked"){
				children3.push($(this).val());
			}
		})
		if(children3.length>0){
			return true;
		}else{
			return false;
		}
	}
	//提交系统资源
	function addRes() {
		if(isGo()==true){
			jQuery("#addResForm").ajaxSubmit({
				type: "post",
				dataType:"json",
				contentType: "application/x-www-form-urlencoded;charset=UTF-8",
				timeout:120000,
				success: function(data) {
					if(data.flag==1) {
						/* $.dialog({
							title: '编辑权限组',
							id: "T90" ,
						    time: 3 ,
						    icon: 'succeed' ,
						    content: "编辑权限组成功!" ,
						    close:function(){
						    }
						}); */
						layer.alert("保存成功",{icon: 1, title:'提示'},function(){
							window.location.href = "${ctx}/admin/role/list.html" ;
						})
							/* window.location.href = "${ctx}/admin/role/list.html" ; */
					} else {
						error_show("服务器忙，编辑权限组失败，请稍后再试") ;
						iscommiting = false ;
					}
				},
				error:function(e) {
					iscommiting = false;
					error_show("服务器内部错误，请稍后再试...") ;
				}
			});
		}else{
			layer.alert("确认设置权限为空",{icon: 3, title:'提示'},function(){
				var roleId = $("input[name=roleId]").val();
				$.ajax({
					  type: "POST",
		    		  url: "/admin/role/set/"+roleId+".html",
		    		  processData:true,
		    		  dataType: "json",
		    		  success: function(data){
		    	    		if(1 == data.flag){
		    	    			layer.alert("保存成功",{icon: 1, title:'提示'},function(){
		    	    				window.location.href = "${ctx}/admin/role/list.html" ;
		        			  });
		    	    		}else{
		    	    			layer.alert("保存失败",{icon: 2, title:'提示'});
		    	    		}
		    		  }
		    		 });
			})
		}
		
	}
	
	function error_show(t){
		$("#error_div").show();
		$("#error_text").text(t);
	}
	//选择老师，url：请求路径，teacherIdsInput：显示老师id的控件id，teacherNamesLable：显示老师名称的控件id
	function openDialog(title,url,parentId,parentName){
		var ss = $.dialog.open(url,{
			title:title,
			width:'700px',
			top:'20px',
			height:'500px',
			lock:true,
			background: '#ff0000', // 背景色
			opacity: 0,	// 透明度
			close:function(){
				getDate(parentId,parentName);
			}
		},false);
	}
	//得到数据
	function getDate(parentId,parentName){
		$("#"+parentId).val($.dialog.data('parentId'));
		$("#"+parentName).val($.dialog.data('parentName'));
	}
</script>
	</body>
</html>