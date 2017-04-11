<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
<head>
<script type="text/javascript">
    function deleteUser(userId) {
        var r = confirm("确认要删除？");
        if (r == true) {
        	window.location.href = "<%=basePath%>userinfo/deleteUser?userId=" + userId;
            // $(obj).attr("href", "<%=basePath%>userinfo/deleteUser?userId=" + userId).removeAttr("onclick").click();
        }
    }

    function toAddUser() {
        window.location.href = "<%=basePath %>userinfo/toAddUser";
    }
    
    function editUser(userId){
    	window.location.href = "<%=basePath %>userinfo/updateUser?userId="+userId;
    }
</script>
</head>
<body>
	<%@include file="/views/commons/commonBegin.jsp"%>

	<!--头部搜索添加操作开始-->
	<form action="<%=basePath%>sys/user" method="POST" name="roleform">
		<div class="ibox-title">
            <input name ="trueName" type="text" value="${trueName}"  placeholder="真实姓名" class="form-control search-input margin-right10" />
            <input name ="phone" type="text" value="${phone}"  placeholder="电话" class="form-control search-input margin-right10" />
            <button type="submit" class="bg-red btn">查询</button>
            <button type="button" class="bg-blue btn" onclick="toAddUser();">添加用户</button>
        </div> 
		<br>
		<!--头部搜索添加操作结束-->
		<!--表格主题部分开始-->
		<div class="ibox-content">
			<table class="table table-striped">
				<tbody>
					<!--表格头部开始-->
					<tr>
						<td><strong>用户名</strong></td>
                        <td><strong>真实姓名</strong></td>
                        <td><strong>手机号</strong></td>
                        <td><strong>电子邮箱</strong></td>
                        <td><strong>注册时间</strong></td>
                        <td><strong>操作</strong></td>
					</tr>
					<!--表格头部结束-->
					<c:forEach items="${list }" var="user" varStatus="s">
						<tr>
							<td>${user.userName }</td>
                            <td>${user.trueName }</td>
                            <td>${user.phone }</td>
                            <td>${user.email }</td>
                            <td><fmt:formatDate value="${user.createTime }" type="both"
                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td class="operation-td">
                            	<span class="revise-btn btn" onclick="editUser(${user.userId})">修改<i class="fa fa-pencil"></i></span>
                                <span class="delete-btn btn" onclick="deleteUser(${user.userId})">删除<i class="fa fa-trash"></i></span>
                            </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--表格主题部分结束-->
		<!--分页器部分开始-->
		<div class="">
			<paginator:page name="paginator" form="roleform" action="/sys/user" />
		</div>
		<!--分页器部分结束-->
	</form>

	</div>
	<!--内容部分主体结束（切换的主要内容结束）-->
	</div>
	<!--右侧内容部分结束-->

	<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>