<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '??.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form method="post" action="order!ybpayment.action">
      <table
										class="table table-striped table-bordered table-condensed text-center">
										<tr>
											<td colspan="4">
												<b>请选择付款方式：</b>
											</td>
										</tr>
										<tr>
											<td>										
												<input type="radio" value="CMBCHINA-NET" name="pd_FrpId" />
												
												<img  src="<%=basePath %>/BacksAdmin/flight/img/招商银行.jpg" alt="..."/>
											</td>
											<td>
												<input type="radio" value="ICBC-NET" name="pd_FrpId" />
											
												<img  src="<%=basePath %>/BacksAdmin/flight/img/工商银行.jpg" alt="..."/>
											</td>
											<td>
												<input type="radio" value="ABC-NET" name="pd_FrpId" />
												<img  src="<%=basePath %>/BacksAdmin/flight/img/中国银行.jpg" alt="..."/>
											</td>
											<td>
												<input type="radio" value="CCB-NET" name="pd_FrpId" />
										    	<img  src="<%=basePath %>/BacksAdmin/flight/img/建设银行.jpg" alt="..."/>
											</td>
										</tr>
										
										
						
										<tr>
											<td colspan="4">
												<%--<a onclick="tk();" class="bg-success"">点击付款</a>
												--%>
												<input type="submit" value="点击付款" class="btn btn-success"/>
											</td>
										</tr>
									</table>
    </form>
  </body>
</html>
