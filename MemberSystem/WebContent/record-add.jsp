<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="_meta.jsp"%>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript">
	//去收尾空格
	function trimStr(str) {
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}

	//校验验证码与用户是否输入合法
	function validate() {
		var changeMoney = trimStr(document.getElementById("changeMoney").value);
		if (changeMoney <= 0) {
			alert("输入金额必须大于0！请重新输入...");
			return false;
		} else {
			//输入正确时
		}
	}

	//判断输入的金额是否为float类型
	function checkInputIntFloat(oInput) {
		if ('' != oInput.value.replace(/\d{1,}\.{0,1}\d{0,}/, '')) {
			oInput.value = oInput.value.match(/\d{1,}\.{0,1}\d{0,}/) == null ? ''
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

	<section class="Hui-article-box"> <nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 记录管理 <span class="c-gray en">&gt;</span> 添加记录 <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
		<i class="Hui-iconfont">&#xe68f;</i>
	</a> </nav>
	<div class="Hui-article">
		<article class="cl pd-20">
		<form action="addRecord" method="post" class="form form-horizontal" id="form-member-add" onsubmit="return validate()">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					记录类型：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="recordType" id="recordType" readonly="readonly" value="${recordType eq '1'?'消费':'充值' }" />
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					会员卡号：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="memberid" id="memberid" readonly="readonly" value="${member.id}" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					会员名称：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="memberName" id="memberName" readonly="readonly" value="${member.name}" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					联系方式/手机：：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="memberTel" id="memberTel" readonly="readonly" value="${member.tel}" />
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">余额变动：</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="changeMoney" id="changeMoney" onkeyup="checkInputIntFloat(this);" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">备注：</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="remarks" id="remarks" />
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