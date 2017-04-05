<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
    		request.getServerPort() + path + "/";
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>L'Opéra 歌剧院法式甜点</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- css -->
	<link href="<%=request.getContextPath()%>/static/frontEnd/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/static/frontEnd/css/jquery.fancybox.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/static/frontEnd/css/jcarousel.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/static/frontEnd/css/flexslider.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/static/frontEnd/css/owl.carousel.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/static/frontEnd/css/style.css" rel="stylesheet">
	
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/jquery.easing.1.3.js"></script>
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/jquery.fancybox.pack.js"></script>
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/jquery.fancybox-media.js"></script> 
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/jquery.quicksand.js"></script>
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/setting.js"></script>
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/jquery.flexslider.js"></script>
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/animate.js"></script>
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/static/frontEnd/js/owl.carousel.js"></script>
</head>
