<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<!--_menu 作为公共模版分离出去-->
	<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe625;</i>
				我的桌面
				<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li>
						<a href="index" title="信息统计">信息统计</a>
					</li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe60d;</i>
				会员管理
				<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li>
						<a href="member" title="会员列表">会员列表</a>
					</li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-record">
			<dt>
				<i class="Hui-iconfont">&#xe627;</i>
				记录管理
				<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li>
						<a href="record" title="记录列表">记录列表</a>
					</li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-system">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i>
				系统管理
				<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li>
						<a href="change-password.jsp" title="修改密码">修改密码</a>
					</li>
					<li>
						<a href="showSystemLog" title="系统日志">系统日志</a>
					</li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-loginout" onclick="location.href='exit'">
			<dt>
				<i class="Hui-iconfont">&#xe6f7;</i>
				退出登陆
			</dt>
		</dl>
	</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
	</div>
	<!--/_menu 作为公共模版分离出去-->
</body>
</html>