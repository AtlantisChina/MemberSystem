<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="_meta.jsp"%>
</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<%@ include file="_header.jsp"%>
	<!--_menu 作为公共模版分离出去-->
	<%@ include file="_menu.jsp"%>

	<section class="Hui-article-box"> <nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-999 en">&gt;</span> 系统管理<span class="c-gray en">&gt;</span>修改密码 </nav> <article class="cl pd-20">
	<form action="editPwd" method="post" class="form form-horizontal" id="form-change-password" onsubmit="return validate()">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">
				<span class="c-red">*</span>
				账号：
			</label>
			<div class="formControls col-xs-4 col-sm-3">
				<input type="text" class="input-text" value="${currentAdmin }" name="name" id="name" readonly="readonly">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">
				<span class="c-red">*</span>
				旧密码：
			</label>
			<div class="formControls col-xs-4 col-sm-3">
				<input type="password" class="input-text" autocomplete="off" placeholder="请输入旧密码" name="password" id="password">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">
				<span class="c-red">*</span>
				新密码：
			</label>
			<div class="formControls col-xs-4 col-sm-3">
				<input type="password" class="input-text" autocomplete="off" placeholder="请输入新密码" name="newPassword" id="newPassword">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">
				<span class="c-red">*</span>
				确认密码：
			</label>
			<div class="formControls col-xs-4 col-sm-3">
				<input type="password" class="input-text" autocomplete="off" placeholder="确认新密码" name="reNewPassword" id="reNewPassword">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<a href="javascript:history.back()" class="btn btn-primary radius">&nbsp;&nbsp;返回&nbsp;&nbsp;</a>
			</div>
		</div>
	</form>
	</article> </section>

	<!--_footer 作为公共模版分离出去-->
	<%@ include file="_footer.jsp"%>

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
		//校验两次密码是否一致
		function validate() {
			var oldPassword = document.getElementById("password").value;
			var newPassword = document.getElementById("newPassword").value;
			var reNewPassword = document.getElementById("reNewPassword").value;
			if (oldPassword <= 0) {
				alert("请输入完整信息，不能为空！");
				return false;
			} else if (newPassword <= 0) {
				alert("请输入完整信息，不能为空！");
				return false;
			} else if (reNewPassword <= 0) {
				alert("请输入完整信息，不能为空！");
				return false;
			} else if (newPassword != reNewPassword) {
				alert("输入的两次密码不一致,请重新输入！");
				return false;
			} else { //输入正确时

			}
		}
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
<!-- 错误提示框 -->
<%
	String errorInfo = (String) request.getAttribute("error"); //获取错误属性
	if (errorInfo != null) {
%>
<script type="text/javascript">
		alert("<%=errorInfo%>");
</script>
<%
	}
%>
</html>