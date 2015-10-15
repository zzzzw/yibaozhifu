<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

		<!-- 引入自己的js/css -->
		<link href="<%=basePath%>/12306/css/style.css" rel="stylesheet">
		


	</head>

	<body>
   <div class="container">
    
        <h1 class="text-center bg-primary">
			车票查询页面
		</h1>
		<h3 class="text-right">
			客服热线：12306
		</h3>
   
   <form class="form-horizontal" role="form" action="dd!cp.action">
   <div class="form-group">
      <label for="sfz" class="col-sm-2 control-label">始发站：</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="sfz" name="sfz"
            placeholder="请输入始发站">
      </div>
   </div>
   <div class="form-group">
      <label for="ddz" class="col-sm-2 control-label">到达站：</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="ddz" name="ddz"
            placeholder="请输入到达站">
      </div>
   </div>
  
   <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
         <button type="submit" class="btn btn-primary btn-lg">查询</button>
      </div>
   </div>
</form>
		 </div>
	</body>
</html>
