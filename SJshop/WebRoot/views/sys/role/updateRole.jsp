<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
<head>
</head>
<body>
	<%@include file="/views/commons/commonBegin.jsp"%>
	<div class="ibox float-e-margins">
		<div class="ibox-content">
			<br>
			<form action="<%=path%>/role/doUpdateRole" method="post" id="from1" name="from1" 
				class="form-horizontal m-t">
				<input type="hidden" name="userId" value="${userInfo.user_id }"/>
                <input type="hidden" name="roleId" value="${roleInfo.roleId }"/>
				<div class="form-group">
					<label class="col-sm-3 control-label">角色名称：</label>
					<div class="col-sm-8">
                        <input type="text" class="form-control" name="roleName" value="${roleInfo.roleName }"
                               datatype="s2-15"
                               errormsg="密码范围在2~15位之间的非特殊字符" nullmsg="角色名称不能为空！"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">描述：</label>
					<div class="col-sm-8">
						<textarea rows="5" cols="30" class="form-control" name="roleDisc" datatype="s0-200"
                            errormsg="密码范围在2~15位之间的非特殊字符" nullmsg="角色名称不能为空！"
                            ignore="ignore">${roleInfo.roleDisc }</textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 col-sm-offset-3">
						<button class="btn btn-w-m btn-success" type="submit">确认修改</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>