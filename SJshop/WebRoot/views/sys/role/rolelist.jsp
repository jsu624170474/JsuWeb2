<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
<head>
</head>
<body>
	<%@include file="/views/commons/commonBegin.jsp"%>

	<!--头部搜索添加操作开始-->
	<form action="<%=basePath %>sys/role" method="GET" name="roleform">
		<!-- <div class="ibox-title">
                     <input type="text" placeholder="姓名" class="form-control search-input" />
                     <button class="bg-red btn">查询 <a href=""></a></button>
                </div> -->
		<br>
		<!--头部搜索添加操作结束-->
		<!--表格主题部分开始-->
		<div class="ibox-content">
			<table class="table table-striped">
				<tbody>
					<!--表格头部开始-->
					<tr>
						<td><strong>角色编号</strong></td>
						<td><strong>角色名</strong></td>
						<td><strong>创建者</strong></td>
						<td><strong>创建时间</strong></td>
						<td><strong>操作</strong></td>
					</tr>
					<!--表格头部结束-->
					<c:forEach items="${list }" var="bean" varStatus="s">
						<tr>
							<td>${s.count}</td>
							<td>${bean['roleName'] }</td>
							<td>${bean['creator'] }</td>
							<td><fmt:formatDate value="${bean['createTime'] }"
									pattern="yyyy-MM-dd hh:mm:ss" /></td>
							<td class="operation-td" style="max-width: 180px; width: 180px;">
								<span class="revise-btn btn"
								onclick="editRole(${bean['roleId'] })"> 修改<i
									class="fa fa-pencil"></i></span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--表格主题部分结束-->
		<!--分页器部分开始-->
		<div class="">
			<paginator:page name="paginator" form="roleform" action="/sys/role" />
		</div>
		<!--分页器部分结束-->
	</form>

	<script type="text/javascript">
	//跳去增加页面
	function toAddRole() {
	    window.location.href = "<%=basePath %>role/toAddRole";
	}
        
	//修改
	function editRole(roleId) {
	    window.location.href = "<%=basePath %>role/toUpdateRole?roleId="+roleId;
	}
</script>

	<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>