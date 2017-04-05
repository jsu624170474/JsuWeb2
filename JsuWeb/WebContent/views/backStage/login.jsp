<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>后台管理平台</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=path%>/static/backStage/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/static/backStage/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <%-- <link href="<%=path%>/static/backStage/assets/font-awesome/css/font-awesome.css" rel="stylesheet" /> --%>
    <!-- Custom styles for this template -->
    <link href="<%=path%>/static/backStage/css/style.css" rel="stylesheet">
    <link href="<%=path%>/static/backStage/css/style-responsive.css" rel="stylesheet" />
    
    <script src="<%=request.getContextPath()%>/static/backStage/js/jquery.js"></script>
    
    <script type="text/javascript">
		function check(){
			var username = $("#username").val();
			var password = $("#password").val();
			
			if(username==null || username==""){
				$("#messageID").html("请输入[账号]");
				return false;
			}
			if(username==null || password==""){
				$("#messageID").html("请输入[密码]");
				return false;
			}
			
			return true;
		}
	</script>
</head>

  <body class="login-body">
    <div class="container">
      <form class="form-signin" action="<%=path%>/backStage/login/check" method="post" onsubmit="return check()">
        <h2 class="form-signin-heading">后台管理平台</h2>
        <div class="login-wrap">
            <input type="text" id="username" name="username" class="form-control" placeholder="账号" autofocus>
            <input type="password" id="password" name="password" class="form-control" placeholder="密码" nullmsg="请输入密码！">
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> 记住密码 
                <label id="messageID" style="color: red;float: right;">${message }</label> 
            </label>
            <button class="btn btn-lg btn-login btn-block" type="submit">登录</button>
        </div>
      </form>
    </div>
  </body>
</html>

