<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="_meta.jsp"%>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		var pageSize = "${pageInfo.pageSize}";
		var pageNumber = "${pageInfo.pageNumber}";
		var total = "${pageInfo.total}";
		var memberid = "${pageInfo.memberid}";

		/* 点击首页 */
		$("#home_page").click(
				function() {
					location.href = "memberView?pageSize=" + pageSize
							+ "&pageNumber=1&memberid=" + memberid;
					return false;
				});

		/* 点击尾页 */
		$("#tail_page").click(
				function() {
					location.href = "memberView?pageSize=" + pageSize
							+ "&pageNumber=" + total + "&memberid=" + memberid;
					return false;
				});

		/* 点击上一页 */
		$("#up_page").click(
				function() {
					pageNumber = parseInt(pageNumber) - 1;
					if (pageNumber >= 1) {
						location.href = "memberView?pageSize=" + pageSize
								+ "&pageNumber=" + pageNumber + "&memberid="
								+ memberid;
					} else {
						pageNumber = 1;
					}
					return false;
				});

		/* 点击下一页 */
		$("#down_page").click(
				function() {
					pageNumber = parseInt(pageNumber) + 1;
					if (pageNumber <= total) {
						location.href = "memberView?pageSize=" + pageSize
								+ "&pageNumber=" + pageNumber + "&memberid="
								+ memberid;
					} else {
						pageNumber = total;
					}
					return false;
				});

		/* 每页显示数量下拉框点击事件 */
		$("#selectPageSize").change(
				function() {
					var checkValue = $("#selectPageSize").val();
					location.href = "memberView?pageSize=" + checkValue
							+ "&pageNumber=1&memberid=" + memberid;
				});
	});

	function RecordDelete(recordId,memberId) {
		if (confirm("确定要删除吗？删除后该记录的金额将会返还到会员余额中！")) {
			window.location = "delRecord?recordId=" + recordId + "&memberId="+memberId;
		}
	}
</script>
</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<%@ include file="_header.jsp"%>
	<!--_menu 作为公共模版分离出去-->
	<%@ include file="_menu.jsp"%>


	<section class="Hui-article-box"> <nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 会员管理 <span class="c-gray en">&gt;</span> 会员信息<a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
		<i class="Hui-iconfont">&#xe68f;</i>
	</a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
		<div class="mt-10">
			<table class="table table-border table-bordered table-bg mt-20" style="margin-top: 10px; margin-bottom: 15px;">
				<thead>
					<tr>
						<th colspan="2" scope="col">
							会员信息&nbsp;&nbsp;
							<a style="color: blue;" href="javascript:window.location='member'">&lt;&lt;点击返回会员界面</a>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th width="15%">会员卡号</th>
						<td>
							<span id="lbServerName">${member.id }</span>
						</td>
					</tr>
					<tr>
						<td>会员名称</td>
						<td>${member.name }</td>
					</tr>
					<tr>
						<td>性别</td>
						<td>${member.sex }</td>
					</tr>
					<tr>
						<td>手机号</td>
						<td>${member.tel }</td>
					</tr>
					<tr>
						<td>可用余额</td>
						<td style="color: blue; font-size: 14px;">${member.money }元
							<c:if test="${member.money < 0 }">
								<span style="margin-left: 10px; font-size: 14px;" class="label label-danger radius">该会员已欠费，请及时充值！</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>注册时间</td>
						<td>
							<fmt:formatDate value="${member.date }" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
					</tr>
					<tr>
						<td>会员操作</td>
						<td>
							<div>
								<input class="btn radius btn-success" type="button" onclick="javascript:window.location='preAddRecord?type=0&memberid=${member.id}'" value="充值余额" />
								<input style="margin-left: 10px;" class="btn btn-warning radius" type="button" onclick="javascript:window.location='preAddRecord?type=1&memberid=${member.id}'" value="添加消费" />
								<input style="margin-left: 10px;" class="btn radius btn-secondary" type="button" onclick="javascript:window.location='preMemberUpdate?memberid=${member.id }'" value="修改信息" />
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="mt-10">
			<span style="float: left; font-size: 16px; margin-bottom: 8px;">
				显示
				<select id="selectPageSize" style="width: 50px; font-size: 14px;">
					<option value="5" <c:if test="${pageInfo.pageSize=='5'}"> selected </c:if>>5</option>
					<option value="10" <c:if test="${pageInfo.pageSize=='10'}"> selected </c:if>>10</option>
					<option value="15" <c:if test="${pageInfo.pageSize=='15'}"> selected </c:if>>15</option>
				</select>
				条数据
			</span>
			<table class="table table-border table-bordered table-bg mt-20" style="margin-bottom: 10px;">
				<thead>
					<tr class="text-c">
						<th width="10%">记录编号</th>
						<th width="10%">记录类型</th>
						<th width="10%">金额变动/元</th>
						<th width="20%">操作时间</th>
						<th width="30%">备注</th>
						<th width="20%">操作</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${pageInfo.list.size() > 0 }">
						<c:forEach var="r" items="${pageInfo.list }">
							<tr class="text-c">
								<td>${r.id }</td>
								<td>${r.recordtype }</td>
								<td>
									<c:if test="${r.recordtype == '充值'}">
										<span style="width: 50px;" class="label label-success radius">${r.recordtype eq "充值"?'+':'-'}${r.changemoney }</span>
									</c:if>
									<c:if test="${r.recordtype == '消费'}">
										<span style="width: 50px;" class="label label-warning radius">${r.recordtype eq "充值"?'+':'-'}${r.changemoney }</span>
									</c:if>
								</td>
								<td>
									<fmt:formatDate value="${r.recorddate }" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>${r.remarks }</td>
								<td>
									<a href="javascript:;" onclick="location.href='preRecordUpdate?recordid=${r.id }'">修改</a>
									<a href="javascript:;" onclick="RecordDelete(${r.id},${r.memberid})">删除</a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="text-c">
							<td colspan="7">该会员无记录信息！</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<div class="mt-10">
				<!-- 首页 按钮 -->
				<button id="home_page" class="btn btn-secondary-outline size-S radius">首页</button>

				<!-- 上一页 按钮 -->
				<c:choose>
					<c:when test="${pageInfo.pageNumber != 1}">
						<button id="up_page" class="btn btn-secondary-outline size-S radius">上一页</button>
					</c:when>
					<c:otherwise>
						<!-- 当处于首页时，禁用上一页按钮 -->
						<button disabled="disabled" class="btn btn-secondary-outline size-S radius disabled">上一页</button>
					</c:otherwise>
				</c:choose>
				<!-- 下一页 按钮 -->
				<c:choose>
					<c:when test="${pageInfo.pageNumber != pageInfo.total}">
						<button id="down_page" class="btn btn-secondary-outline size-S radius">下一页</button>
					</c:when>
					<c:otherwise>
						<!-- 当处于尾页时，禁用下一页按钮 -->
						<button disabled="disabled" class="btn btn-secondary-outline size-S radius disabled">下一页</button>
					</c:otherwise>
				</c:choose>
				<!-- 尾页 按钮 -->
				<button id="tail_page" class="btn btn-secondary-outline size-S radius">尾页</button>
				<span style="float: right; font-size: 16px;"> 当前显示第&nbsp;${pageInfo.pageNumber}&nbsp;页，共&nbsp;${pageInfo.total}&nbsp;页&nbsp;${pageInfo.count}&nbsp;条数据</span>
			</div>
		</div>
		</article>
	</div>
	</section>

	<!--_footer 作为公共模版分离出去-->
	<%@ include file="_footer.jsp"%>

</body>
</html>