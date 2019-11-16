<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String isSession = (String) session.getAttribute("currentAdmin");
		/* 判断是否存在session，不存在则返回到登录界面  */
		if (null == isSession) {
			response.setHeader("refresh", "0;URL=login.jsp");
		}
	%>
	<!--_header 作为公共模版分离出去-->
	<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="index.jsp">会员管理系统</a>
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v2.0</span>
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
			<ul class="cl">
				<li class="dropDown dropDown_hover">
					<a href="javascript:;" class="dropDown_A">
						<i class="Hui-iconfont">&#xe667;</i>
						快捷操作
						<i class="Hui-iconfont">&#xe6d5;</i>
					</a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li>
							<a href="javascript:;" onclick="location.href='index'">
								<i class="Hui-iconfont">&#xe625;</i>
								信息统计
							</a>
						</li>
						<li>
							<a href="javascript:;" onclick="location.href='preAddMember'">
								<i class="Hui-iconfont">&#xe600;</i>
								添加会员
							</a>
						</li>
						<li>
							<a href="javascript:;" onclick="location.href='member'">
								<i class="Hui-iconfont">&#xe60d;</i>
								会员列表
							</a>
						</li>
						<li>
							<a href="javascript:;" onclick="location.href='record'">
								<i class="Hui-iconfont">&#xe627;</i>
								记录列表
							</a>
						</li>

					</ul>
				</li>
			</ul>
			</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>当前登录用户：</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">
						${currentAdmin }
						<i class="Hui-iconfont">&#xe6d5;</i>
					</a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li>
							<a href="javascript:;" onClick="myselfinfo()">个人信息</a>
						</li>
						<li>
							<a href="exit">切换账户</a>
						</li>
						<li>
							<a href="exit">退出</a>
						</li>
					</ul>
				</li>
				<li id="Hui-skin" class="dropDown right dropDown_hover">
					<a href="javascript:;" class="dropDown_A" title="换肤">
						<i class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i>
					</a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li>
							<a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a>
						</li>
						<li>
							<a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
						</li>
						<li>
							<a href="javascript:;" data-val="green" title="绿色">绿色</a>
						</li>
						<li>
							<a href="javascript:;" data-val="red" title="红色">红色</a>
						</li>
						<li>
							<a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
						</li>
						<li>
							<a href="javascript:;" data-val="orange" title="橙色">橙色</a>
						</li>
					</ul>
				</li>
			</ul>
			</nav>
		</div>
	</div>
	</header>
	<!--/_header 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript">
		/*用户-添加*/
		function member_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}

		/*个人信息*/
		function myselfinfo() {
			layer.open({
				type : 1,
				area : [ '300px', '200px' ],
				fix : false, //不固定
				maxmin : true,
				shade : 0.4,
				title : '查看信息',
				content : '<div>管理员信息</div>'
			});
		}
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>