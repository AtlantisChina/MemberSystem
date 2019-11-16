<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<section class="Hui-article-box"> <nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 记录管理 <span class="c-gray en">&gt;</span> 记录列表<a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
		<i class="Hui-iconfont">&#xe68f;</i>
	</a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
		<div class="cl pd-5 bg-1 bk-gray mt-10">
			<span style="text-align: center; display: block;">
				记录类型：
				<select id="searchText" class="input-text" style="width: 100px;">
					<option value="" <c:if test="${pageInfo.searchText==''}"> selected </c:if>>-请选择-</option>
					<option value="1" <c:if test="${pageInfo.searchText=='充值'}"> selected </c:if>>充值记录</option>
					<option value="0" <c:if test="${pageInfo.searchText=='消费'}"> selected </c:if>>消费记录</option>
				</select>
				日期范围：
				<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" name="dateMin" class="input-text Wdate" style="width: 120px;">
				-
				<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" name="dateMax" class="input-text Wdate" style="width: 120px;">
				<button type="button" class="btn btn-success radius" id="btnSearch" name="btnSearch">
					<i class="Hui-iconfont">&#xe665;</i>
					搜记录
				</button>
			</span>
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

			<table class="table table-border table-bordered table-hover table-bg">
				<thead>
					<tr class="text-c">
						<th width="5%">
							<input type="checkbox" name="" value="">
						</th>
						<th width="10%">记录编号</th>
						<th width="12%">记录类型</th>
						<th width="10%">会员名称</th>
						<th width="10%">金额变动/元</th>
						<th width="18%">操作时间</th>
						<th width="20%">备注</th>
						<th width="15%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${pageInfo.list.size() > 0 }">
							<c:forEach var="r" items="${pageInfo.list }">
								<tr class="text-c">
									<td>
										<input type="checkbox" value="1" name="">
									</td>
									<td>${r.id }</td>
									<td>${r.recordtype }</td>
									<td style="cursor: pointer;" onclick="javascript:window.location='memberView?memberid=${r.memberid }'">${r.member.name }</td>
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
									<td class="td-manage">
										<a title="编辑" href="javascript:;" onclick="location.href='preRecordUpdate?recordid=${r.id }'" class="ml-5" style="text-decoration: none">
											<i class="Hui-iconfont">&#xe60c;</i>
										</a>
										<a title="删除" href="javascript:;" onclick="RecordDelete(${r.id},${r.memberid})" class="ml-5" style="text-decoration: none">
											<i class="Hui-iconfont">&#xe6e2;</i>
										</a>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="text-c">
								<td colspan="8">查询的记录信息不存在！</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
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

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		$(function() {
			var pageSize = "${pageInfo.pageSize}";
			var pageNumber = "${pageInfo.pageNumber}";
			var total = "${pageInfo.total}";
			var stext = "${pageInfo.searchText}";
			var dateMin = "${pageInfo.dateMin}";
			var dateMax = "${pageInfo.dateMax}";

			/* 对查询日期设置值 */
			$(":text[name='dateMin']").val(dateMin);
			$(":text[name='dateMax']").val(dateMax);

			/* 查询按钮点击事件 */
			$("#btnSearch").click(
					function() {
						location.href = "record?pageSize=" + pageSize
								+ "&pageNumber=1&searchText="
								+ $('#searchText option:selected').val()
								+ "&dateMin="
								+ $(":text[name='dateMin']").val()
								+ "&dateMax="
								+ $(":text[name='dateMax']").val();
					});

			/* 点击首页 */
			$("#home_page").click(
					function() {
						location.href = "record?pageSize=" + pageSize
								+ "&pageNumber=1&searchText="
								+ $('#searchText option:selected').val()
								+ "&dateMin="
								+ $(":text[name='dateMin']").val()
								+ "&dateMax="
								+ $(":text[name='dateMax']").val();
						return false;
					});

			/* 点击尾页 */
			$("#tail_page").click(
					function() {
						location.href = "record?pageSize=" + pageSize
								+ "&pageNumber=" + total + "&searchText="
								+ $('#searchText option:selected').val()
								+ "&dateMin="
								+ $(":text[name='dateMin']").val()
								+ "&dateMax="
								+ $(":text[name='dateMax']").val();
						return false;
					});

			/* 点击上一页 */
			$("#up_page").click(
					function() {
						pageNumber = parseInt(pageNumber) - 1;
						if (pageNumber >= 1) {
							location.href = "record?pageSize=" + pageSize
									+ "&pageNumber=" + pageNumber
									+ "&searchText="
									+ $('#searchText option:selected').val()
									+ "&dateMin="
									+ $(":text[name='dateMin']").val()
									+ "&dateMax="
									+ $(":text[name='dateMax']").val();
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
							location.href = "record?pageSize=" + pageSize
									+ "&pageNumber=" + pageNumber
									+ "&searchText="
									+ $('#searchText option:selected').val()
									+ "&dateMin="
									+ $(":text[name='dateMin']").val()
									+ "&dateMax="
									+ $(":text[name='dateMax']").val();
						} else {
							pageNumber = total;
						}
						return false;
					});

			/* 每页显示数量下拉框点击事件 */
			$("#selectPageSize").change(
					function() {
						var checkValue = $("#selectPageSize").val();
						location.href = "record?pageSize=" + checkValue
								+ "&pageNumber=1&searchText="
								+ $('#searchText option:selected').val()
								+ "&dateMin="
								+ $(":text[name='dateMin']").val()
								+ "&dateMax="
								+ $(":text[name='dateMax']").val();
					});
		});
		function RecordDelete(recordId, memberId) {
			if (confirm("确定要删除吗？删除后该记录的金额将会返还到会员余额中！")) {
				window.location = "delRecord?recordId=" + recordId
						+ "&memberId=" + memberId;
			}
		}
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>