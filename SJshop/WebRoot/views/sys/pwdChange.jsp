<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
<head>
<link rel="stylesheet" href="<%=basePath%>css/changePass.css">
<script type="text/javascript">
    $(function () {
        $('.valid').Validform({
            tiptype: function (msg, o, cssctl) {
                var objtip = $("<span class='formTip'></span>");
                switch (o.type) {
                    case 2:
                        o.obj.css('borderColor', '#dfdfdf');
                        o.obj.nextAll('.formTip').remove();
                        break;
                    case 3:
                        o.obj.nextAll('.formTip').remove();
                        o.obj.css('borderColor', '#f00').after(objtip);
                        break;
                }
                cssctl(objtip, o.type);
                objtip.html("<i class='iconfont icon-warn'></i>" + msg);
            },
            showAllError: false
        });
    });
</script>
</head>
<body>
	<%@include file="/views/commons/commonBegin.jsp"%>
	<br>
	<div class="applicant">
		<form action="<%=basePath%>userinfo/changePwd" method="post"
			class="validFrom valid">
			<div class="formBody">
				<div class="formItems">
					<input id="userId" name="userId" type="hidden" value="${userId }" />
					<div class="formItem">
						<label for="oldPassword">原始密码</label><i class="iconfont icon-lock"></i>
						<input class="input" type="password" id="oldPassword"
							ajaxurl="<%=basePath %>userinfo/checkPwdForPlugin" datatype="*"
							nullmsg="原始密码不能为空！" />
					</div>
					<div class="formItem">
						<label for="newPassword">新密码</label><i class="iconfont icon-lock"></i>
						<input class="input" type="password" id="newPassword"
							name="newPassword" datatype="/[_a-zA-Z0-9]{6,20}/"
							errormsg="密码范围在6~15位之间的非特殊字符" nullmsg="密码不能为空！"
							placeholder="请填写密码（必填）" />
					</div>
					<div class="formItem">
						<label for="newPasswordAgain">重复新密码</label><i
							class="iconfont icon-lock"></i> <input class="input"
							type="password" id="newPasswordAgain" name="newPasswordAgain"
							recheck="newPassword" datatype="/[_a-zA-Z0-9]{6,20}/"
							errormsg="两次输入密码不一致" nullmsg="确认密码不能为空！" placeholder="请填写密码（必填）" />
					</div>
					<br>
					<div class="formItem" style="text-align: left;padding-bottom: 20px;">
						<button class="btn btn-w-m btn-success" style="width: 50px;margin-left: 150px;">修改密码</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>