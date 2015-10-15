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

		<title>12306Demo</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<!--js框架--引入jquery，因为bootstrap使用了jquery，所以要在它前面引入-->
		<script src="<%=basePath%>/resource/jquery/jquery1.11.3.min.js"></script>
		<!--css框架--引入bootstrap-->
		<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js"></script>
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css"
			rel="stylesheet">

		<!-- 引入自己的js/css -->
		<link href="<%=basePath%>/12306/css/style.css" rel="stylesheet">
		<script src="<%=basePath%>/12306/js/main.js"></script>

	</head>

	<body>
		<div class="container">
			<h1 class="text-center bg-primary">
				选择乘客信息
			</h1>
			<h3>
				你当前选择的车次是：
				<strong class="text-danger">${checi}</strong>
			</h3>

			<form action="dd!qd.action">
				<input type="hidden" value="${checi}" name="checi" />
				<table
					class="table table-striped table-bordered table-condensed text-center">




					<!-- 遍历显示乘客信息 ,每四个人换行-->
					<tr>
						<td>
							<h4>
								请选择乘客：
							</h4>
							<br />
							<s:iterator value="cklist" var="ck" status="st">

								<input type="checkbox" value="<s:property value="#ck" />"
									name="gxck" />
								<s:property value="#ck" />
								<s:if test="(#st.index+1)%4 == 0">
									<br />
									<br />
								</s:if>

							</s:iterator>


						</td>
					</tr>

					<tr>
						<td>
							<input type="submit" value="提交订单" class="btn btn-success"/>
						</td>
					</tr>
				</table>

			</form>
		</div>
	</body>
</html>
