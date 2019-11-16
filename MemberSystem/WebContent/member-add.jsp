<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="_meta.jsp"%>
<script type="text/javascript">
	// 去收尾空格
	function trimStr(str) {
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}

	//校验验证码与用户是否输入合法
	function validate() {
		var initTel = /^[1][3,4,5,7,8][0-9]{9}$/; //手机号验证
		var initInt = /(^[0-9]*[1-9][0-9]*$)/; //正整数验证
		var memberId = trimStr(document.getElementById("memberId").value);
		var memberTel = trimStr(document.getElementById("memberTel").value);
		var memberName = trimStr(document.getElementById("memberName").value);
		var memberMoney = trimStr(document.getElementById("memberMoney").value);

		if (memberId <= 0 || memberName <= 0 || memberTel <= 0) {
			alert("请输入完整的会员信息！");
			return false;
		} else if (!initTel.test(memberTel)) {
			alert("请输入合法的11位手机号！");
			return false;
		} else if (!initInt.test(memberId)) {
			alert("会员卡号由数字组成且大于0！");
			return false;
		} else if (memberMoney == '') {
			alert("会员初始余额不能为空！");
			return false;
		}
	}

	//判断输入的金额是否为float类型
	function checkInputFloat(oInput) {
		if ('' != oInput.value.replace(/\d{1,}\.{0,1}\d{0,}/, '')) {
			oInput.value = oInput.value.match(/\d{1,}\.{0,1}\d{0,}/) == null ? '0.0'
					: oInput.value.match(/\d{1,}\.{0,1}\d{0,}/);
		}
	}
</script>
</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<%@ include file="_header.jsp"%>
	<!--_menu 作为公共模版分离出去-->
	<%@ include file="_menu.jsp"%>

	<section class="Hui-article-box"> <nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 会员管理 <span class="c-gray en">&gt;</span> 添加会员<a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
		<i class="Hui-iconfont">&#xe68f;</i>
	</a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
		<form action="addMember" method="post" onsubmit="return validate()" class="form form-horizontal">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					会员卡号：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" value="${memberId }" readonly="readonly" id="memberId" name="memberId">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					会员名称：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" value="" placeholder="请输入会员名称" id="memberName" name="memberName">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					性别：
				</label>
				<div class="formControls col-xs-4 col-sm-5 skin-minimal">
					<div class="radio-box">
						<input name="memberSex" type="radio" id="sex-1" value="男">
						<label for="sex-1">男</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-2" name="memberSex" value="女">
						<label for="sex-2">女</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-3" name="memberSex" value="保密" checked>
						<label for="sex-3">保密</label>
					</div>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					联系方式/手机：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" value="" placeholder="请输入11位手机号" id="memberTel" name="memberTel">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">初始余额：</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" value="0.0" onkeyup="checkInputFloat(this);" name="memberMoney" id="memberMoney">
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">
					<a href="javascript:history.back()" class="btn btn-primary radius">&nbsp;&nbsp;返回&nbsp;&nbsp;</a>
				</div>
			</div>
		</form>
		</article>
	</div>
	</section>

	<!--_footer 作为公共模版分离出去-->
	<%@ include file="_footer.jsp"%>
</body>
</html>