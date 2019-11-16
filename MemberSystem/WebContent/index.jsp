<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<section class="Hui-article-box"> <nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-999 en">&gt;</span> 我的桌面<span class="c-gray en">&gt;</span>信息统计 <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
		<i class="Hui-iconfont">&#xe68f;</i>
	</a> </nav>
	<div class="Hui-article">
		<article class="cl pd-20">
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr>
					<th colspan="7" scope="col">信息统计</th>
				</tr>
				<tr class="text-c">
					<th>统计</th>
					<th>会员注册</th>
					<th>消费金额(元)</th>
					<th>消费记录(次)</th>
					<th>充值金额(元)</th>
					<th>充值记录(次)</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-c">
					<td>今日</td>
					<td>${list[0].countMember}</td>
					<td>
						<c:choose>
							<c:when test="${list[0].countRecord1Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[0].countRecord1Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[0].countRecord1}</td>
					<td>
						<c:choose>
							<c:when test="${list[0].countRecord0Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[0].countRecord0Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[0].countRecord0}</td>
				</tr>
				<tr class="text-c">
					<td>昨日</td>
					<td>${list[1].countMember}</td>
					<td>
						<c:choose>
							<c:when test="${list[1].countRecord1Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[1].countRecord1Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[1].countRecord1}</td>
					<td>
						<c:choose>
							<c:when test="${list[1].countRecord0Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[1].countRecord0Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[1].countRecord0}</td>
				</tr>
				<tr class="text-c">
					<td>本周</td>
					<td>${list[2].countMember}</td>
					<td>
						<c:choose>
							<c:when test="${list[2].countRecord1Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[2].countRecord1Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[2].countRecord1}</td>
					<td>
						<c:choose>
							<c:when test="${list[2].countRecord0Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[2].countRecord0Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[2].countRecord0}</td>
				</tr>
				<tr class="text-c">
					<td>本月</td>
					<td>${list[3].countMember}</td>
					<td>
						<c:choose>
							<c:when test="${list[3].countRecord1Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[3].countRecord1Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[3].countRecord1}</td>
					<td>
						<c:choose>
							<c:when test="${list[3].countRecord0Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[3].countRecord0Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[3].countRecord0}</td>
				</tr>
				<tr class="text-c">
					<td>上月</td>
					<td>${list[4].countMember}</td>
					<td>
						<c:choose>
							<c:when test="${list[4].countRecord1Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[4].countRecord1Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[4].countRecord1}</td>
					<td>
						<c:choose>
							<c:when test="${list[4].countRecord0Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[4].countRecord0Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[4].countRecord0}</td>
				</tr>
				<tr class="text-c">
					<td>总数</td>
					<td>${list[5].countMember}</td>
					<td>
						<c:choose>
							<c:when test="${list[5].countRecord1Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[5].countRecord1Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[5].countRecord1}</td>
					<td>
						<c:choose>
							<c:when test="${list[5].countRecord0Money == null}">
							0.0
						</c:when>
							<c:otherwise>
							${list[5].countRecord0Money}
						</c:otherwise>
						</c:choose>
					</td>
					<td>${list[5].countRecord0}</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-border table-bordered table-bg mt-20">
			<thead>
				<tr>
					<th colspan="2" scope="col">服务器信息</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th width="30%">系统当前版本</th>
					<td>
						<span id="lbServerName">MemberSystem_v2.0</span>
					</td>
				</tr>
				<tr>
					<td>协议类型及版本号</td>
					<td>
						<%
							out.println(request.getProtocol());
						%>
					</td>
				</tr>
				<tr>
					<td>服务器主机名</td>
					<td>
						<%
							out.println(request.getServerName());
						%>
					</td>
				</tr>
				<tr>
					<td>服务器端口</td>
					<td>
						<%
							out.println(request.getServerPort());
						%>
					</td>
				</tr>
				<tr>
					<td>请求方式</td>
					<td>
						<%
							out.println(request.getMethod());
						%>
					</td>
				</tr>
				<tr>
					<td>客户端IP地址</td>
					<td>
						<%
							out.println(request.getRemoteAddr());
						%>
					</td>
				</tr>
				<tr>
					<td>客户端主机</td>
					<td>
						<%
							out.println(request.getRemoteHost());
						%>
					</td>
				</tr>
				<tr>
					<td>URL</td>
					<td>
						<%
							out.println(request.getRequestURL());
						%>
					</td>
				</tr>
				<tr>
					<td>Web服务目录</td>
					<td>
						<%
							out.println(request.getServletPath());
						%>
					</td>
				</tr>
			</tbody>
		</table>
		</article>
		<footer class="footer">
		<p>
			感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch
			<br>
			Copyright &copy;2015 H-ui.admin v3.0 All Rights Reserved.
			<br>
			本后台系统由
			<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>
			提供前端技术支持
		</p>
		</footer>
	</div>
	</section>

	<!--_footer 作为公共模版分离出去-->
	<%@ include file="_footer.jsp"%>

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript">
		
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>