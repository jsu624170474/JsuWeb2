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
    <form id="queryform" name="orgform" action="<%=basePath%>goods/list" method="POST">
       <div class="ibox-title">
       		<input name ="goodsName" type="text" value="${goodsName}"  placeholder="商品名称" class="form-control search-input margin-right10"/>
       		<input name ="goodsTypeName" type="text" value="${goodsTypeName}"  placeholder="商品类型名称" class="form-control search-input margin-right10"/>
            <button type="submit" class="bg-red btn" >查询</button>
            <button onclick="toAddGoods()" modal="modal-3" type="button" class="bg-blue btn">添加</button>
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
	                    <td><strong>上架</strong></td>
	                    <td><strong>是否推荐</strong></td>
	                    <td><strong>促销单价</strong></td>
	                    <td><strong>促销开始日期</strong></td>
	                    <td><strong>促销结束日期</strong></td>
	                    <td><strong>操作</strong></td>
	                </tr>
		            <c:forEach items="${list}" var="li" varStatus="status">
		                <tr>
		                    <td>${li.id} - ${list.size()}</td>
		                    <td>${li.name}</td>
		                    <td>${li.goodsTypeName}</td>
		                    <td>${li.period_amt}</td>
		                    <td>${li.stock}</td>
		                    <td><c:choose>
								<c:when test="${li.flag == '10'}">
									<img src="<%=path%>/img/icon/yes.gif" onclick="changeFlagNo(this,${li.id})" class="img_hold"/>
								</c:when>
								<c:when test="${li.flag == '20'}">
									<img src="<%=path%>/img/icon/no.gif" onclick="changeFlagYes(this,${li.id})" class="img_hold"/>
								</c:when>
							</c:choose></td>
							<td><c:choose>
								<c:when test="${li.is_Recommend == 'Y'}">
									<img src="<%=path%>/img/icon/yes.gif" onclick="changeRecommendNo(this,${li.id})" class="img_hold"/>
								</c:when>
								<c:when test="${li.is_Recommend == 'N'}">
									<img src="<%=path%>/img/icon/no.gif" onclick="changeRecommendYes(this,${li.id})" class="img_hold"/>
								</c:when>
							</c:choose></td>
							 <td>${li.sales_amt}</td>
							 <td>${li.sales_date_begin}</td>
							 <td>${li.sales_date_end}</td>
							<td>
								<img onclick="editGoods(${li.id})" src="<%=path%>/img/icon/icon_edit.gif" title="修改" class="img_hold" />
								<img onclick="delGoods(${li.id})" src="<%=path%>/img/icon/trash.gif" title="回收站" class="img_hold"/>
							</td>
	                    </tr>
	                </c:forEach>
            </tbody>
			</table>
		</div>
            <!-- 分页标签开始  -->
            <div class="">
                <paginator:page name="paginator" form="orgform" action="/goods/list" />
            </div>
            <!-- 分页标签结束 -->
        </form>
       
	<script type="text/javascript">
	    function toAddGoods() {
	        window.location.href = "<%=basePath %>goods/detail";
	    }
	    function editGoods(id){
	    	window.location.href = "<%=basePath %>goods/detail?id="+id;
	    }
	    function delGoods(id){
	    	// 删除前确认提示
			layer.confirm('确定要将此商品移到回收站吗？', {
				btn: ['移到回收站','取消'], //按钮
			}, function(){
				if(updateFlag(id,'90')){
		    		$("#queryform").submit();
		    	}
			}, function(){
			});
	    }
	    function changeFlagYes(obj, id){
	    	// 删除前确认提示
			layer.confirm('是否要将此商品【上架】吗？', {
				btn: ['上架','取消'], //按钮
			}, function(){
				if(updateFlag(id,"10")){
		    		$(obj).attr('src',"<%=path%>/img/icon/yes.gif");
		    		$(obj).attr('onclick',"changeFlagNo(this,'"+id+"')");
		    	}
		    	layer.closeAll('dialog');
			}, function(){
			});
	    }
	    function changeFlagNo(obj, id){
	    	// 删除前确认提示
			layer.confirm('是否要将此商品【下架】吗？', {
				btn: ['下架','取消'], //按钮
			}, function(){
				if(updateFlag(id,"20")){
		    		$(obj).attr('src',"<%=path%>/img/icon/no.gif");
		    		$(obj).attr('onclick',"changeFlagYes(this,'"+id+"')");
		    	}
		    	layer.closeAll('dialog');
			}, function(){
			});
	    }
	    
	    function changeRecommendYes(obj, id){
	    	// 删除前确认提示
			layer.confirm('是否要将此商品设置为【推荐】吗？', {
				btn: ['推荐','关闭'], //按钮
			}, function(){
				if(updateRecommend(id,"Y")){
		    		$(obj).attr('src',"<%=path%>/img/icon/yes.gif");
		    		$(obj).attr('onclick',"changeRecommendNo(this,'"+id+"')");
		    	}
		    	layer.closeAll('dialog');
			}, function(){
			});
	    }
	    function changeRecommendNo(obj, id){
	    	// 删除前确认提示
			layer.confirm('是否要将此商品取消【推荐】吗？', {
				btn: ['取消推荐','关闭'], //按钮
			}, function(){
				if(updateRecommend(id,"N")){
		    		$(obj).attr('src',"<%=path%>/img/icon/no.gif");
		    		$(obj).attr('onclick',"changeRecommendYes(this,'"+id+"')");
		    	}
		    	layer.closeAll('dialog');
			}, function(){
			});
	    }
	    function updateRecommend(id, isRecommend){
	    	$.ajax({
                type:"get",
                data:{
                	"id" : id,
                	"isRecommend" : isRecommend
                },
                async: false,
                url:"<%=basePath%>goods/updateRecommend",
                success:function(data) {
                	if(data!='S'){
                		layer.alert("更新是否推荐失败："+data,{icon: 2,skin: 'layer-ext-moon'});
                		return false;	
                	}
                },
                error:function(){
                    layer.alert("更新异常，请联系管理员！",{icon: 2,skin: 'layer-ext-moon'});
                    return false;
                }
            });
            
            return true;
	    }
	    
	    function updateFlag(id , flag){
	    	$.ajax({
                type:"get",
                data:{
                	"id" : id,
                	"flag" : flag
                },
                async: false,
                url:"<%=basePath%>goods/updateFlag",
                success:function(data) {
                	if(data!='S'){
                		layer.alert("更新商品状态失败："+data,{icon: 2,skin: 'layer-ext-moon'});
                		return false;	
                	}
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