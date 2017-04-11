<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/page.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/telListsPage.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/alertBox.css"/>
    <script src="<%=basePath%>js/index.js"></script>
    <script src="<%=basePath%>js/check_idnumber.js"></script>
    <script src="<%=basePath%>js/vendor/jquery.ellipsis.js"></script>
    <script src="<%=basePath%>js/commonList.js"></script>
    <style type="text/css">
    	.img_hold {
			cursor: pointer;
			width : 16px;
			height : 16px; 
			border : 0px; 
		}
    </style>
</head>
<body>
<%@include file="/views/commons/commonBegin.jsp"%>
    <form id="queryform" name="orgform" action="<%=basePath%>goods/type/list" method="POST">
       <div class="ibox-title">
       		<input name ="name" type="text" value="${name}"  placeholder="商品类型名称" class="form-control search-input margin-right10"/>
            <button type="submit" class="bg-red btn" >查询</button>
            <button onclick="toAddGoodsType()" modal="modal-3" type="button" class="bg-blue btn">添加</button>
        </div>
        <div class="ibox-content">
			<table class="table table-striped">
				<tbody>
	                <tr>
	                    <td><strong>编号</strong></td>
	                    <td><strong>商品类型名称</strong></td>
	                    <td><strong>说明</strong></td>
	                    <td><strong>操作</strong></td>
	                </tr>
		            <c:forEach items="${list}" var="li" varStatus="status">
		                <tr>
		                    <td>${li.id}</td>
		                    <td>${li.name}</td>
		                    <td>${li.remark}</td>
							<td>
								<img onclick="editGoodsType('${li.id}','${li.name}','${li.remark}')" src="<%=path%>/img/icon/icon_edit.gif" title="修改" class="img_hold" />
							</td>
	                    </tr>
	                </c:forEach>
            </tbody>
			</table>
		</div>
            <!-- 分页标签开始  -->
            <div class="">
                <paginator:page name="paginator" form="orgform" action="/goods/type/list" />
            </div>
            <!-- 分页标签结束 -->
        </form>
       
       
     <div id="addCooperatAlert" class="alertBox" style="display: none;">
        <div class="alertContent" style="width: 400px;">
            <h1 id="title" class="alert-title">添加商品类型</h1>
            <ul class="form-list">
	            <input id="id" type="hidden"/>
	            <li class="form-list_item">
	                <label>
	                    <span>商户类型名称</span>
	                    <input id="name" type="text" style="width: 260px;">
	                </label>
	            </li>
	            <li class="form-list_item">
	                <label>
	                    <span>说明</span>
	                    <textarea rows="4" cols="25" id="remark" style="vertical-align: top;"></textarea>
	                </label>
	            </li>
            </ul>
            <div class="ctrlBox">
                <a id="close-msg" href="#" class="btn btn-white">关闭</a>
                <button type="button" onclick="submitdata()" class="btn btn-orange" >确定</button>
            </div>
	    </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#close-msg").click(function(){
	            $("#addCooperatAlert").hide();
	        });
		});
		
		function toAddGoodsType(){
			$("#addCooperatAlert").show();
		}
		
		function editGoodsType(id, name, remark){
			$("#id").val(id);
			$("#name").val(name);
			$("#remark").val(remark);
			$("#title").html("修改商品类型信息");
			$("#addCooperatAlert").show();
		}
		
		function submitdata(){
			var dataparam = {
	         	"id" : $.trim($("#id").val()),
	         	"name" : $.trim($("#name").val()),
	         	"remark" : $.trim($("#remark").val())
	         };
	         $.ajax({
	             type:"post",
	             data:dataparam,
	             url:"<%=basePath%>goods/type/save",
	             success:function(data) {
	             	 if (data == 'S') {
						window.location.reload(true);
					 }else{
		                layer.alert("保存失败，请联系管理员！",{icon: 2,skin: 'layer-ext-moon'});
		             }
		         },
		         error:function(){
		             layer.alert("保存异常，请联系管理员！",{icon: 2,skin: 'layer-ext-moon'});
	             }
	         });
		}
	</script>
<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>