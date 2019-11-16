<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="_meta.jsp"%>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript">
	$("#recordDate").click(function() {
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
		<form action="recordUpdate" method="post" class="form form-horizontal" id="form-member-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					记录编号：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="recordId" id="recordId" readonly="readonly" value="${record.id }" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					记录类型：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="recordType" id="recordType" value="${record.recordtype}" readonly="readonly" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>
					会员卡号：
				</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="memberId" id="userId" value="${record.memberid }" readonly="readonly" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">余额变动：</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="changeMoney" id="changeMoney" value="${record.changemoney }" readonly="readonly" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">操作时间：</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input id="recordDate" class="input-text" name="recordDate" class="Wdate" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" value="<fmt:formatDate value="${record.recorddate }" pattern="yyyy-MM-dd HH:mm:ss" />" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">备注：</label>
				<div class="formControls col-xs-4 col-sm-5">
					<input type="text" class="input-text" name="remarks" id="remarks" value="${record.remarks }" />
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