<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<section class="Hui-article-box"> <nav class="breadcrumb"> <i class="Hui-iconfont"></i> <a href="/" class="maincolor">首页</a> <span class="c-999 en">&gt;</span> <span class="c-666">空白页</span> </nav>
	<div class="Hui-article">
		<article class="cl pd-20"> <section class="page-404 minWP text-c">
		<p class="error-title">
			<i class="Hui-iconfont va-m" style="font-size: 80px">&#xe656;</i>
			<span class="va-m"> 404</span>
		</p>
		<p class="error-description">不好意思，您访问的页面不存在~</p>
		<p class="error-info">
			您可以：
			<a href="javascript:;" onclick="history.go(-1)" class="c-primary">&lt; 返回上一页</a>
			<span class="ml-20">|</span>
			<a href="index.jsp" class="c-primary ml-20">去首页 &gt;</a>
		</p>
		</section> </article>
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