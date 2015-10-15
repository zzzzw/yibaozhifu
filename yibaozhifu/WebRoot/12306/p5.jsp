<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'p5.jsp' starting page</title>
    
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
     <h1 class="text-center bg-primary">付款页</h1>
     <h3>应付金额为：<strong class="text-danger">${zonge}</strong></h3>
     <table class="table table-striped table-bordered table-condensed text-center">
     <tr>
      <td colspan="4">
       请选择付款方式：
      </td>
      </tr>
     <tr>
     <td>
      <input type="radio" value="" name="fkfs" checked/>支付宝
     </td>
      <td>
      <input type="radio" value="" name="fkfs"/>中国银行
     </td>
      <td>
      <input type="radio" value="" name="fkfs"/>工商银行
     </td>
      <td>
      <input type="radio" value="" name="fkfs"/>建设银行
     </td>
     </tr>
     
      <tr>
      <td colspan="4">
      <a  onclick="tk();" class="btn btn-success">点击付款</a>
      </td>
      </tr>
     </table>
     </div>
  </body>
</html>
