<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<div id="wrapper">
	<%@include file="/views/commons/menuHeader.jsp"%>

	<!--内容部分主体开始（切换的主要内容开始）-->
	<div class="row  border-bottom dashboard-header basic-bg">

		<!--显示定位部分开始-->
			<div class="float-left">
				<ol class="breadcrumb">
					<i class="fa fa-map-marker"></i>
					<c:forEach items="${menuList}" var="menu" varStatus="status">
						<c:if test="${menu.thisclass=='active'}">
							<li><strong>${menu.menuName}</strong></li>

							<c:forEach items="${menu.melist}" var="menuSecond"
								varStatus="statu">
								<c:if test="${menuSecond.thisclass=='active'}">
									<li><strong>${menuSecond.menuName }</strong></li>

									<c:if test="${menuSecond.thisclass=='active'}">
										<c:forEach items="${menuSecond.melist}" var="menuThird"
											varStatus="statu">
											<c:if test="${menuThird.thisclass=='active'}">
												<li><strong>${menuThird.menuName }</strong></li>
											</c:if>
										</c:forEach>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</ol>
			</div>
		<!--显示定位部分结束-->

		<!--具体内容开始-->
		<div class="width-col12">
			<div class="ibox float-e-margins" style="font-size: 13px;">