<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'p4.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">


		<!--js框架--引入jquery，因为bootstrap使用了jquery，所以要在它前面引入-->
		<script src="<%=basePath%>/resource/jquery/jquery1.11.3.min.js"></script>
		<!--css框架--引入bootstrap-->
		<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js"></script>
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

		<!-- 引入自己的js/css -->
		<link href="<%=basePath%>/12306/css/style.css" rel="stylesheet">
		<script src="<%=basePath%>/12306/js/main.js"></script>


	</head>

	<body>
	<div class="container">
		<h1 class="text-center bg-primary">
			确认订单页
		</h1>
		<h3>
			你当前选择的车次是：<strong class="text-danger">${checi}</strong>
		</h3>
		<table class="table table-striped table-bordered table-condensed text-center">
			<tr >
				<td>
					姓名
				</td>
				<td>
					席别
				</td>
				<td>
					席位号
				</td>
				<td>
					票价（元）
				</td>
			</tr>


			<!-- 遍历选择的用户信息 -->

			<s:iterator value="qdlist" var="u">


				<tr>
					<td>
						<s:property value="#u[0]" />
					</td>
					<td>
						<s:property value="#u[1]" />
					</td>
					<td>
						<s:property value="#u[2]" />
					</td>
					<td>
						<s:property value="#u[3]" />
						<input type="hidden" value="<s:property value="#u[3]"/>" name="a">
					</td>
				</tr>
			</s:iterator>


			<tr>
				<td colspan="4" class="text-right">
					总票价为：
					<a  id="zpj"  style="color: #D14;font-weight:bold">100000</a>元
				</td>
			</tr>

			<tr>
				<td colspan="4" class="text-center">
					<a onclick="zf();" class="btn btn-success">网上支付</a>
				</td>
			</tr>

		</table>

  </div>

	</body>
</html>
