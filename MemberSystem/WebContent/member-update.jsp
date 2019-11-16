<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="_meta.jsp"%>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript">
	//去收尾空格
	function trimStr(str) {
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}

	//校验验证码与用户是否输入合法
	function validate() {
		var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
		var memberTel = trimStr(document.getElementById("memberTel").value);
		var memberName = trimStr(document.getElementById("memberName").value);
		if (memberName <= 0 || memberTel <= 0) {
			alert("请输入完整的会员信息！");
			return false;
		} else if (!myreg.test(memberTel)) {
			alert("请输入合法的11位手机号！");
			return false;
		} else {
			//输入正确时
		}
	}

	$("#memberDate").click(function() {
		WdatePicker({
			el : this, //点击对象id，一般可省略el
			lang : 'auto', //语言选择，一般用auto
			dateFmt : 'yyyy-MM-dd HH:mm:ss', //时间显示格式，年月日 时分秒，年月日就是yyyy-MM-dd
			minDate : '#F{$dp.$D(\'inputstarttime\')}', //最小日期
			maxDate : '%y-%M-%d', //最大日期（当前时间）
			readOnly : true, //是否只读
			isShowClear : true, //是否显示“清空”按钮
			isShowOK : true, //是否显示“确定”按钮
			isShowToday : true, //是否显示“今天”按钮
			autoPickDate : true
		//为false时 点日期的时候不自动输入,而是要通过确定才能输入，为true时 即点击日期即可返回日期值，为null时(推荐使用) 如果有时间置为false 否则置为true
		})
	})
</script>
</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<%@ include file="_header.jsp"%>
	<!--_menu 作为公共模版分离出去-->
	<%@ include file="_menu.jsp"%>

	<section class="Hui-article-box"> <nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 会员管理 <span class="c-gray en">&gt;</span> 修改会员 <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
		<i class="Hui-iconfont">&#xe68f;</i>
	</a> </nav>
	<div class="Hui-article">
		<article class="cl pd-20">
		<form action="memberUpdate" method="post" class="form form-horizontal" id="form-member-add" onsubmit="return validate()">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">不可修改*</span>
					会员卡号：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" value="${member.id }" readonly="readonly" id="memberId" name="memberId">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"> 会员名称： </label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" value="${member.name }" id="memberName" name="memberName">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"> 性别： </label>
				<div class="formControls col-xs-4 col-sm-5 skin-minimal">
					<div class="radio-box">
						<input name="memberSex" type="radio" id="sex-1" value="男" ${member.sex eq '男'?'checked':''}>
						<label for="sex-1">男</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-2" name="memberSex" value="女" ${member.sex eq '女'?'checked':''}>
						<label for="sex-2">女</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-3" name="memberSex" value="保密" ${member.sex eq '保密'?'checked':''}>
						<label for="sex-3">保密</label>
					</div>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"> 联系方式/手机： </label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" value="${member.tel }" id="memberTel" name="memberTel">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">不可修改*</span>
					可用余额：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="memberMoney" readonly="readonly" id="memberMoney" value="${member.money }">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">注册时间：</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input id="memberDate" name="memberDate" class="input-text" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" value="<fmt:formatDate value="${member.date }" pattern="yyyy-MM-dd HH:mm:ss" />" />
				</div>
			</div>

			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit" value="确认修改">
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