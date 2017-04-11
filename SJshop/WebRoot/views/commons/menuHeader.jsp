<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!--左侧导航栏开始-->
<nav class="navbar-default navbar-static-side" role="navigation">
	<!--导航头部开始-->
	<ul class="navbar-head" id="index-word">
		<li><a href="<%=request.getContextPath()%>/homePage" class="clearfix"><i
				class="fa hfq-fengkong"></i><span
				class="fa hfq-fengkongxt color-333"></span></a></li>
	</ul>
	<!--导航头部结束-->
	<div class="sidebar-collapse">
		<!--侧边栏主体部分开始-->
		<ul class="nav" id="side-menu">

			<!-- 系统自动菜单 -->
			<c:forEach items="${menuList}" var="menu" varStatus="status">
				<li class="${menu.thisclass}">

				<a href="<%=request.getContextPath()%>/${menu.linkUrl}"><i
					class="fa ${menu.dispImage}" data-active="${menu.dispImage}1"></i> <span
					class="nav-label">${menu.menuName}</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<c:forEach items="${menu.melist}" var="menuSecond"
						varStatus="statu">
						<li class="${menuSecond.thisclass}">
							<c:if test="${menuSecond.melist.size()!=0}">
								<a href="<%=request.getContextPath()%>/${menuSecond.linkUrl }">${menuSecond.menuName}<span class="fa arrow"></span></a>
								<ul class="nav nav-third-level">
									<c:forEach items="${menuSecond.melist}" var="menuThird" varStatus="statu">
										<li class="${menuThird.thisclass}">
											<a href="<%=request.getContextPath()%>/${menuThird.linkUrl }">${menuThird.menuName }</a>
										</li>
									</c:forEach>
								</ul>
							</c:if>
							<c:if test="${menuSecond.melist.size()==0}">
								<a href="<%=request.getContextPath()%>/${menuSecond.linkUrl }">${menuSecond.menuName}</a>
							</c:if>
						</li>
					</c:forEach>
				</ul>
				</li>
			</c:forEach>
		</ul>
		<!--侧边栏主体部分结束-->
	</div>
</nav>
<!--左侧导航结束-->

<!--右侧内容部分开始-->
<div id="page-wrapper" class="gray-bg dashbard-1">
	<!--内容部分头部开始-->
	<div class="row border-bottom">
		<nav class="navbar navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<!--导航栏收缩按钮开始-->
				<div class="head-title navbar-minimalize"> <i class="fa fa-bars"></i>
				</div>
				<!--导航栏收缩按钮结束-->

				<!--退出按钮开始-->
				<div class="exit-btn btn-normal">
					<a href="<%=request.getContextPath()%>/logout"> <i
						class="glyphicon glyphicon-off"></i>
					</a>
				</div>
				<!--退出按钮结束-->

				<!--登录状态显示开始-->
				<div class="float-right">
					<p class="login-state">
						您好，<i class="user-name">${currentUser.userName}</i>，欢迎您的光临 !
					</p>
				</div>
				<!--登录状态显示结束-->
			</div>
		</nav>
	</div>
	<!--内容部分头部结束-->