<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>	
<html>
	<head>
		<meta charset="UTF-8">
		<title>风控系统</title>
		<link rel="stylesheet" href="css/reset.css">
	   	<link rel="stylesheet" href="font-awesome/css/iconfont.css"/>
		<link rel="stylesheet" href="font-awesome/css/font-awesome.css"/>
		<link rel="stylesheet" href="font-awesome/font/iconfont.css">
		<link rel="stylesheet" href="css/login3-fengkong.css" />
	</head>
	<body>
		<div id="wrapper">
			<section class="login-area">
				<form action="<%=path%>/login" method="post" class="login">
					<a href="javascript:void(0);"><i class="fa hfq-fengkong"></i><span class="fa hfq-fengkongxt"></span></a>
					<p style="position: absolute; left: 0; top: 74px; width: 100%; text-align: center; color: red;"><b class="checkout color-false">${message_login}</b></p>
					<div class="main-content">
						<div>
							<input class="border-bottom0" type="text" name="username" autocomplete="off" placeholder="请输入您的账号" />
						</div>
						<div>
							<input type="password" name="password" maxlength="22" datatype="/[_a-zA-Z0-9]{6,20}/" placeholder="请输入您的密码" />
						</div>
						<p class="clearfix"><label><input type="checkbox" />记住密码</label></p>
						<input class="submit-btn" type="submit" value="登录" />
					</div>
				</form>
			</section>
		</div>
	</body>
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/jquery.particleground.min.js"></script>
	<script src="js/login3-fengkong.js"></script>
</html>