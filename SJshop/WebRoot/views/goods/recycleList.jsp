<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
<head>
</head>
<body>
<%@include file="/views/commons/commonBegin.jsp"%>
    <form id="queryform" name="orgform" action="<%=basePath%>goods/recycle/list" method="POST">
       <div class="ibox-title">
       		<input name ="goodsName" type="text" value="${goodsName}"  placeholder="商品名称" class="form-control search-input margin-right10"/>
       		<input name ="goodsTypeName" type="text" value="${goodsTypeName}"  placeholder="商品类型名称" class="form-control search-input margin-right10"/>
            <button type="submit" class="bg-red btn" >查询</button>
        </div>
        <div class="ibox-content">
			<table class="table table-striped">
				<tbody>
	                <tr>
	                    <td><strong>编号</strong></td>
	                    <td><strong>商品名称</strong></td>
	                    <td><strong>商品类型</strong></td>
	                    <td><strong>单价</strong></td>
	                    <td><strong>库存</strong></td>
	                    <!-- <td><strong>状态</strong></td> -->
	                    <td><strong>促销单价</strong></td>
	                    <td><strong>促销开始日期</strong></td>
	                    <td><strong>促销结束日期</strong></td>
	                    <td><strong>操作</strong></td>
	                </tr>
		            <c:forEach items="${list}" var="li" varStatus="status">
		                <tr>
		                    <td>${li.id}</td>
		                    <td>${li.name}</td>
		                    <td>${li.goodsTypeName}</td>
		                    <td>${li.period_amt}</td>
		                    <td>${li.stock}</td>
		                    <%-- <td><c:choose>
								<c:when test="${li.flag == '10'}">上架</c:when>
								<c:when test="${li.flag == '20'}">下架</c:when>
							</c:choose></td> --%>
							 <td>${li.sales_amt}</td>
							 <td>${li.sales_date_begin}</td>
							 <td>${li.sales_date_end}</td>
							<td>
								<a onclick="returnFlag(${li.id})">还原</a>
							</td>
	                    </tr>
	                </c:forEach>
            </tbody>
			</table>
		</div>
            <!-- 分页标签开始  -->
            <div class="">
                <paginator:page name="paginator" form="orgform" action="/goods/recycle/list" />
            </div>
            <!-- 分页标签结束 -->
        </form>
       
	<script type="text/javascript">
		function returnFlag(id){
	    	$.ajax({
                type:"get",
                data:{
                	"id" : id,
                	"flag" : '20'
                },
                async: false,
                url:"<%=basePath%>goods/updateFlag",
                success:function(data) {
                	if(data!='S'){
                		layer.alert("更新商品状态失败："+data,{icon: 2,skin: 'layer-ext-moon'});
                		return false;	
                	}
                	$("#queryform").submit();
                },
                error:function(){
                    layer.alert("更新商品状态异常，请联系管理员！",{icon: 2,skin: 'layer-ext-moon'});
                    return false;
                }
            });
            
            return true;
	    }
	</script>
<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>