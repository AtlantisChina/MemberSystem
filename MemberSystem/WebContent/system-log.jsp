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

	<form action="delSomeLog" method="post">
		<section class="Hui-article-box"> <nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 系统日志 <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a> </nav>
		<div class="Hui-article">
			<article class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray mt-10">
				<span class="l">
					<button type="submit" class="btn btn-danger radius">
						<i class="Hui-iconfont">&#xe6e2;</i>
						批量删除
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
				<table class="table table-border table-bordered table-bg table-hover">
					<thead>
						<tr class="text-c">
							<th width="5%">
								<input type="checkbox" name="" value="">
							</th>
							<th width="10%">日志ID</th>
							<th width="15%">类型</th>
							<th width="20%">内容</th>
							<th width="10%">操作者</th>
							<th width="15%">客户端IP</th>
							<th width="15%">时间</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${pageInfo.list.size() > 0 }">
								<c:forEach var="log" items="${pageInfo.list }">
									<tr class="text-c">
										<td>
											<input type="checkbox" value="${log.id }" name="ids">
										</td>
										<td>${log.id }</td>
										<td>
											<c:if test="${log.type == '信息'}">
												<span class="label label-default radius">${log.type}</span>
											</c:if>
											<c:if test="${log.type == '警告'}">
												<span class="label label-warning radius">${log.type}</span>
											</c:if>
											<c:if test="${log.type == '危险'}">
												<span class="label label-danger radius">${log.type}</span>
											</c:if>
										</td>
										<td>${log.content }</td>
										<td>${log.operator }</td>
										<td>${log.ip }</td>
										<td>${log.date }</td>
										<td>
											<a title="删除" href="javascript:;" onclick="LogDelete(${log.id})" class="ml-5" style="text-decoration: none">
												<i class="Hui-iconfont">&#xe6e2;</i>
											</a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr align="center">
									<td colspan="8">查询的系统日志信息不存在！</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
	</form>

	<div class="mt-10">
		<!-- 首页 按钮 -->
		<button id="home_page" class="btn btn-primary-outline size-S radius">首页</button>

		<!-- 上一页 按钮 -->
		<c:choose>
			<c:when test="${pageInfo.pageNumber != 1}">
				<button id="up_page" class="btn btn-primary-outline size-S radius">上一页</button>
			</c:when>
			<c:otherwise>
				<!-- 当处于首页时，禁用上一页按钮 -->
				<button disabled="disabled" class="btn btn-primary-outline size-S radius disabled">上一页</button>
			</c:otherwise>
		</c:choose>
		<!-- 下一页 按钮 -->
		<c:choose>
			<c:when test="${pageInfo.pageNumber != pageInfo.total}">
				<button id="down_page" class="btn btn-primary-outline size-S radius">下一页</button>
			</c:when>
			<c:otherwise>
				<!-- 当处于尾页时，禁用下一页按钮 -->
				<button disabled="disabled" class="btn btn-primary-outline size-S radius disabled">下一页</button>
			</c:otherwise>
		</c:choose>
		<!-- 尾页 按钮 -->
		<button id="tail_page" class="btn btn-primary-outline size-S radius">尾页</button>
		<span style="float: right; font-size: 16px;"> 当前显示第&nbsp;${pageInfo.pageNumber}&nbsp;页，共&nbsp;${pageInfo.total}&nbsp;页，&nbsp;${pageInfo.count}&nbsp;条数据</span>
	</div>
	</div>
	<div id="pageNav" class="pageNav"></div>
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

			/* 点击首页 */
			$("#home_page").click(
					function() {
						location.href = "showSystemLog?pageSize=" + pageSize
								+ "&pageNumber=1";
						return false;
					});

			/* 点击尾页 */
			$("#tail_page").click(
					function() {
						location.href = "showSystemLog?pageSize=" + pageSize
								+ "&pageNumber=" + total;
						return false;
					});

			/* 点击上一页 */
			$("#up_page").click(
					function() {
						pageNumber = parseInt(pageNumber) - 1;
						if (pageNumber >= 1) {
							location.href = "showSystemLog?pageSize="
									+ pageSize + "&pageNumber=" + pageNumber;
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
							location.href = "showSystemLog?pageSize="
									+ pageSize + "&pageNumber=" + pageNumber;
						} else {
							pageNumber = total;
						}
						return false;
					});

			/* 每页显示数量下拉框点击事件 */
			$("#selectPageSize").change(
					function() {
						var checkValue = $("#selectPageSize").val();
						location.href = "showSystemLog?pageSize=" + checkValue
								+ "&pageNumber=1";
					});
		});
		
		function LogDelete(logId) {
				window.location = "delLog?logId=" + logId;
		}
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>