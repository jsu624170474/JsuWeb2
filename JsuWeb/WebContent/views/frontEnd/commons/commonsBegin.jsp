<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String pathBegin = request.getContextPath();
%>
	<!-- start header -->
	<header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<%=pathBegin%>/"><img src="<%=pathBegin%>/static/frontEnd/image/Logo.jpeg" alt="logo"></a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="<%=pathBegin%>/">首页</a></li> 
						<li><a href="<%=pathBegin%>/aboutus">关于我们</a></li>
						<li><a href="<%=pathBegin%>/service">服务</a></li>
                        <li><a href="<%=pathBegin%>/gallery">Gallery</a></li>
                        <li><a href="<%=pathBegin%>/pricing">定价</a></li>
                        <li><a href="<%=pathBegin%>/contactus">联系我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
	</header>
	<!-- end header -->