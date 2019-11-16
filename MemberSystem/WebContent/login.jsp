<%@ page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="com.atlantis.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />
<link href="static/css/login.css" rel="stylesheet" type="text/css" />
<script src="lib/jquery/1.9.1/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		//得到焦点
		$("#password").focus(function() {
			$("#left_hand").animate({
				left : "110",
				top : " -38"
			}, {
				step : function() {
					if (parseInt($("#left_hand").css("left")) > 100) {
						$("#left_hand").attr("class", "left_hand");
					}
				}
			}, 2000);
			$("#right_hand").animate({
				right : "-24",
				top : "-38px"
			}, {
				step : function() {
					if (parseInt($("#right_hand").css("right")) > -30) {
						$("#right_hand").attr("class", "right_hand");
					}
				}
			}, 2000);
		});
		//失去焦点
		$("#password").blur(function() {
			$("#left_hand").attr("class", "initial_left_hand");
			$("#left_hand").attr("style", "left:60px;top:-12px;");
			$("#right_hand").attr("class", "initial_right_hand");
			$("#right_hand").attr("style", "right:-72px;top:-12px");
		});
	});

	//校验用户是否输入合法
	function validate() {
		var inputName = document.getElementById("name").value;
		var inputPassword = document.getElementById("password").value;
		if (inputName <= 0) {
			alert("请输入用户名或账号！");
			return false;
		} else if (inputPassword <= 0) {
			alert("请输入密码！");
			return false;
		} else { 
			//输入正确时
		}
	}	

	//功能未开放提示信息
	function Message() {
		alert("Sorry,该功能暂未开放！");
		return false;
	}
</script>
</head>
<body>
	<%
		request.getSession().invalidate();
		// 获取Cookie里的账号密码
		String name = "";
		String password = "";
		String remember = "";
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (int i = 0; i < cookies.length; i++) {
				//cookies[i].getValue().contains("-")
				if (cookies[i].getName().equals("member")) {
					name = cookies[i].getValue().split("-")[0];
					password = cookies[i].getValue().split("-")[1];
					remember = cookies[i].getValue().split("-")[2];
				} else {
					continue;
				}
			}
			pageContext.setAttribute("admin", new Admin(name, password));
			if ("yes".equals(remember)) {
				pageContext.setAttribute("remember", 1);
			}
		}
	%>

	<form action="login" method="post" onsubmit="return validate()">
		<div class="top_div"></div>
		<div class="background">
			<div style="width: 165px; height: 96px; position: absolute;">
				<div class="tou"></div>
				<div class="initial_left_hand" id="left_hand"></div>
				<div class="initial_right_hand" id="right_hand"></div>
			</div>
			<p style="padding: 30px 0px 10px; position: relative;">
				<span class="u_logo"></span>
				<input class="ipt" type="text" placeholder="请输入用户名或账号" id="name" name="name" value="${admin.name }" />
			</p>
			<p style="position: relative;">
				<span class="p_logo"></span>
				<input class="ipt" id="password" name="password" type="password" placeholder="请输入密码" value="${admin.password }" />
			</p>
			<input class="login" type="submit" value="登录" />
			<div class="line">
				<p style="margin: 5px 35px 20px 35px;">
					<span style="float: left; color: #008ead;">
						<input style="margin-top: 10px;" type="checkbox" name="remember" value="remember-me" ${remember==1?'checked':''}>
					</span>
					<span style="float: left; color: #008ead;">
						<label>&nbsp;记住我</label>
					</span>
					<span style="float: right;">
						<a style="color: #008ead;" href="" onclick="Message()">忘记密码? </a>
						<a style="color: #008ead;" href="" onclick="Message()">&nbsp;|&nbsp;&nbsp;注册新用户</a>
					</span>
				</p>
			</div>
		</div>
	</form>
</body>
<!-- 用户名和密码输入错误提示框 -->
<%
	String errorInfo = (String) request.getAttribute("error"); //获取错误属性
	if (errorInfo != null) {
%>
<script type="text/javascript">
	alert("<%=errorInfo%>");
	window.location = 'login.jsp';
</script>
<%
	}
%>
</html>