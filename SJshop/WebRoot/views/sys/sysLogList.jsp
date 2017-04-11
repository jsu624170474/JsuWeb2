<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
<head>
</head>
<body>
	<%@include file="/views/commons/commonBegin.jsp"%>

	<!--头部搜索添加操作开始-->
	<form action="<%=basePath%>syslog/list" method="POST" name="roleform">
		<div class="ibox-title">
            <input name ="operUser" type="text" value="${operUser}"  placeholder="用户名" class="form-control search-input margin-right10" />
            <input name ="operName" type="text" value="${operName}"  placeholder="操作类型" class="form-control search-input margin-right10" />
            <button type="submit" class="bg-red btn">查询</button>
        </div> 
		<!--头部搜索添加操作结束-->
		<!--表格主题部分开始-->
		<div class="ibox-content">
			<table class="table table-striped">
				<tbody>
					<!--表格头部开始-->
					<tr>
						<td><strong>序号</strong></td>
                        <td><strong>用户名</strong></td>
                        <td><strong>操作类型</strong></td>
                        <td><strong>访问IP地址</strong></td>
                        <td><strong>状态</strong></td>
                        <td><strong>时间</strong></td>
					</tr>
					<!--表格头部结束-->
					<c:forEach items="${list }" var="sysLog" varStatus="s">
						<tr>
							<td>${sysLog.operId }</td>
                            <td>${sysLog.operUser }</td>
                            <td>${sysLog.operName }</td>
                            <td>${sysLog.operIp }</td>
                            <td>
                            	<c:if test="${sysLog.operStatus=='S'}">成功</c:if>
                            	<c:if test="${sysLog.operStatus!='S'}">失败</c:if>
                            </td>
                            <td>${sysLog.operDt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--表格主题部分结束-->
		<!--分页器部分开始-->
		<div class="">
			<paginator:page name="paginator" form="roleform" action="/syslog/list" />
		</div>
		<!--分页器部分结束-->
	</form>

	<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>