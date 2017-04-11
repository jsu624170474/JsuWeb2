<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
<head>
	<link rel="stylesheet" href="<%=path%>/css/tabPage.css">
</head>
<body>
	<%@include file="/views/commons/commonBegin.jsp"%>
	
	<div id="virtuals-2014" class="m _520_a_lifeandjourney_1 hover" data-ui="u-tab|&amp;|current" style="width: 100%;height: 100%">
	    <div class="mt"  style="width: 100%;height: 100%">
	        <ul class="fore1 lh">
	            <li data-ui="tab-nav" class="current">
	            	<a onclick="changeTab(this,'basePage')"><s></s>基本信息<i></i></a>
	            </li>
	            <li data-ui="tab-nav" class="">
	            	<a onclick="changeTab(this,'picPage')"><s></s>相关图片<i></i></a>
	            </li>
	        </ul>
	    </div>
	    <div class="mc"  style="width: 100%;height: 100%">
	        <div id="basePage" data-ui="tab-content" class="virtuals-iframes">
	            <iframe width="100%" height="139px" frameborder="0" scrolling="no" src="<%=basePath %>goods/detail?id=${id}"></iframe>
	        </div>
	        <div id="picPage" data-ui="tab-content" class="virtuals-iframes hide">
	            <iframe width="100%" height="139px" frameborder="0" scrolling="no" src="./tab_iframe_files/saved_resource.html"></iframe>
	        </div>
	    </div>
	</div>
	
	<script type="text/javascript">
		function changeTab(obj, tabFlag){
			var liObj = $(obj).parent();
			var ulObj = liObj.parent();
			ulObj.children().attr('class','');
			liObj.attr('class','current');
			
			// 显示内容
			var tabParent = $("#"+tabFlag).parent();
			tabParent.children().attr('class','virtuals-iframes hide');
			$("#"+tabFlag).attr('class','virtuals-iframes');
		}
	</script>
	
	
	<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>