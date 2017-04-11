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
		<link rel="stylesheet" type="text/css" href="css/reset.css">
	   	<link rel="stylesheet" type="text/css" href="css/login.css" />
	   	<link rel="stylesheet" type="text/css" href="font-awesome/css/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.css"/>
		<link rel="stylesheet" href="font-awesome/font/iconfont.css">
	</head>
	<body>
		<div id="wrapper">
			<header class="clearfix">
				<a class="logo" href="http://www.hfenq.com"><i class="fa hfq-hfqLogo2"></i></a>
				<p><span class="direction">www.hfenq.com</span><span class="company">北京榆钱投资管理有限公司</span></p>
			</header>
			<section>
				<form action="<%=path%>/login" method="post" class="login">
					<h2>风控系统</h2>
					
					<input type="text" name="username" autocomplete="off" placeholder="请输入您的账号" 
					maxlength="22" datatype="*" errormsg="账号格式不正确！" nullmsg="请输入账号！"/>
					
					<input type="password" name="password" maxlength="22" placeholder="请输入您的密码"
					datatype="/[_a-zA-Z0-9]{6,20}/" errormsg="密码格式不正确！"
					nullmsg="请输入密码！" autocomplete="off" />
					
					<p class="remember clearfix"><b class="checkout color-false">${message_login}</b></p>
					
					<input type="submit" value="登录" class="submitbtn btn" />
				</form>
			</section>
		</div>
	</body>
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/login.js"></script>
</html>