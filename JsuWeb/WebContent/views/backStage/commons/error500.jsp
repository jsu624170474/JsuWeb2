<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/static/backStage/img/favicon.html">

    <title>500</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/static/backStage/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/backStage/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=request.getContextPath()%>/static/backStage/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/static/backStage/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/backStage/css/style-responsive.css" rel="stylesheet" />

</head>

  <body class="body-500">
    <div class="container">
      <section class="error-wrapper">
          <i class="icon-500"></i>
          <<!-- h1>Ouch!</h1> -->
          <h2>500 Page Error</h2>
          <p class="page-500">服务器异常... <a href="<%=request.getContextPath()%>/backStage/home">返回首页</a></p>
      </section>
    </div>
  </body>
</html>


