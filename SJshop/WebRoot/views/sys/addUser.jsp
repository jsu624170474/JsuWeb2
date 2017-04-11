<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<head>
    <script src="<%=basePath%>js/index.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>css/changePass.css">
    <script type="text/javascript" src="<%=basePath%>js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
    <SCRIPT type="text/javascript">
        var zTreeObj;
        var zNodes;
        var setting = {
            check: {
                enable: true,
                chkStyle: "checkbox"
            },
            data: {
                key: {
                    name: "menuName"
                },
                simpleData: {
                    enable: true,
                    idKey: "menuId",
                    pIdKey: "superiorId"
                }
            },
            view: {
                fontCss: {
                    color: "#656565",
                    fontSize: "12px"
                }
            }
        };
        $(document).ready(function () {
            $.ajax({
                type: "Get",
                url: '<%=basePath %>userinfo/getMenuTree',
                data: 'userId=${userId}',
                dataType: "text",
                global: false,
                async: false,
                success: function (strReult) {
                    zNodes = eval(strReult);	//把获取的数据转换成json对象在赋值给zNodes
                },
                error: function () {
                    alert("Ajax请求数据失败!");
                }
            });
            zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);	//初始化树，传进三个参数，分别是 html对象，setting树属性，zNodes json数据
            $('#submit').click(function () {
                var nodes = zTreeObj.getCheckedNodes();
                var array = new Array();
                for (var i = 0; i < nodes.length; i++) {   //遍历选中的节点，为array赋值
                    array[i] = nodes[i].menuId;
                }
                $("#content").val(array);
            });

            $('#checkUserName').on('blur', function () {
                var _this = $(this);
                $.ajax({
                    type: "Get",
                    url: '<%=basePath %>userinfo/checkUserName',
                    data: 'userName=' + _this.val(),
                    dataType: "text",
                    global: false,
                    async: false,
                    success: function (strReult) {
                        if (strReult == 1) {
                            _this.after("<div class='input-help'><ul><li>登录名已存在!</li></ul></div>");
                            _this.parent().parent().removeClass("check-success");
                            _this.parent().parent().addClass("check-error");
                        }
                    },
                    error: function () {
                        alert("Ajax请求数据失败!");
                    }
                });
            });
        });

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
            showAllError: false,
            datatype: {
                "zh2-25": /^[\u4E00-\u9FA5\uf900-\ufa2d]{2,25}$/,
                "account": /^[a-zA-Z][0-9a-zA-Z_]{5,19}$/,
                "pwd": /^[a-zA-Z][0-9a-zA-Z_]{5,14}$/
            }
        });
    </SCRIPT>
</head>

<body>
<%@include file="/views/commons/commonBegin.jsp"%>
<!-- 网页正文内容 -->
        <div class="applicant">
            <form action="<%=basePath %>userinfo/doAddUser" method="post" class="validFrom valid" id="from1"
                  name="from1">
                <div class="formBody">
                    <div class="formItems">
                        <div class="formItem">
                            <label>登录账号：</label>
                            <input id="checkUserName" class="input" type="text" name="userName" datatype="account"
                                   errormsg="以英文字母开头，数字、下划线组合；且长度在6-20之间" nullmsg="账号不能为空！" placeholder="请填写登录帐号（必填）"/>
                            <p style="color: #666;margin-left:135px;">以英文字母开头，数字、下划线组合；且长度在6-20之间</p>
                        </div>
                        <div class="formItem">
                            <label>登录密码：</label>
                            <input class="input" type="text" name="password" datatype="pwd"
                                   errormsg="英文字母、数字、下划线组合；且长度在6-15之间" nullmsg="密码不能为空！" placeholder="请填写密码（必填）"/>
                            <p style="color: #666;margin-left:135px;">以英文字母、数字、下划线组合；且长度在6-15之间</p>
                        </div>
                        <div class="formItem">
                            <label>姓名：</label>
                            <input class="input" type="text" name="trueName" datatype="zh2-25"
                                   errormsg="名字不能超过25个汉字" nullmsg="姓名不能为空！" placeholder="请填写姓名（必填、纯汉字、25字以内）"/>
                        </div>
                        <div class="formItem">
                            <label>联系电话：</label>
                            <input class="input" type="text" name="phone" datatype="m"
                                   errormsg="请填写正确的手机号码" nullmsg="联系电话不能为空！" placeholder="请填写联系电话（必填）"/>
                        </div>
                        <div class="formItem">
                            <label>电子邮箱：</label>
                            <input class="input" type="text" name="email" datatype="e" ignore="ignore" maxlength="50"
                                   errormsg="请填写正确的电子邮箱(如：******@163.com)"/>
                        </div>
                        <div class="formItem" style="margin-left:40px;">
                            <h1>
                                菜单权限：
                            </h1>
                            <ul id="treeDemo" class="ztree"></ul>
                            <input type="hidden" id="content" name="content"/>
                        </div>
                    </div>
                </div>
					<div class="col-sm-4 col-sm-offset-3">
                         <button id="submit" class="btn btn-w-m btn-success" type="submit" 
                         	style="width: 100px;">确认添加</button>
                     </div>
            </form>
        </div>

<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>