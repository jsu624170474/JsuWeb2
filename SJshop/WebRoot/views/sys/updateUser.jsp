<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<head>
    <link rel="stylesheet" href="<%=basePath%>css/changePass.css">
    <link rel="stylesheet" href="<%=basePath%>css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script src="<%=basePath%>js/index.js"></script>
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
                "zh2-25": /^[\u4E00-\u9FA5\uf900-\ufa2d]{2,25}$/
            }
        });
    </SCRIPT>
    <style type="text/css">
        .validFrom .formItems .formItem input {
            width: 200px;
            height: 34px;
            border: 1px solid #dfdfdf;
            border-radius: 2px;
            padding-left: 3px;
            margin-right: 5px;
        }

        .checkApply .homePage {
            color: #3f4753;
            background: #fff;
        }
    </style>
</head>

<body>
<%@include file="/views/commons/commonBegin.jsp"%>
<!-- 网页正文内容 -->
<div class="checkApply">
    <div class="homePage" style="padding-left: 20px;padding-right: 20px;padding-top: 10px;">
        <div class="applicant">
            <form action="<%=basePath%>/userinfo/update" method="post" class="validFrom valid" id="from1" name="from1">
                <input type="hidden" name="userId" value="${userInfo.userId}">
                <div class="formBody">
                    <div class="formItems">
                        <div class="formItem">
                            <label>登录账号：</label>
                            <input class="input" type="text" value="${userInfo.userName }"
                                   disabled="disabled"/>
                        </div>
                        <div class="formItem">
                            <label>姓名：</label>
                            <input class="input" type="text" name="trueName" value="${userInfo.trueName }"
                                   datatype="zh2-25"
                                   errormsg="名字不能超过25个汉字" nullmsg="姓名不能为空！" placeholder="请填写姓名（必填、纯汉字、25字以内）"/>
                        </div>
                        <div class="formItem">
                            <label>联系电话：</label>
                            <input class="input" type="text" name="phone" value="${userInfo.phone }" datatype="m"
                                   errormsg="请填写正确的手机号码" nullmsg="联系电话不能为空！" placeholder="请填写电话（必填）"/>
                        </div>
                        <div class="formItem">
                            <label>电子邮箱：</label>
                            <input class="input" datatype="e" ignore="ignore" maxlength="50" errormsg="请填写正确的电子邮箱"
                                   type="text" name="email" value="${userInfo.email }"/>
                        </div>
                    </div>
                <div class="formItems">
                    <div class="formItem" style="padding-left: 40px;">
                     	<h1 style="font-size: 20px;"> 菜单权限：</h1>
                        <ul id="treeDemo" class="ztree"></ul>
                        <input type="hidden" id="content" name="content"/>

                    </div>
				</div>
					<div class="formItem" style="text-align: left;padding-bottom: 20px;">
						<button id="submit" class="btn btn-w-m btn-success" style="width: 50px;margin-left: 150px;">保存修改</button>
					</div>
                    <!-- <div class="formFooter">
                        <button id="submit" class="btn">保存修改</button>
                    </div> -->
                </div>
            </form>
        </div>
     </div>
</div>
<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>