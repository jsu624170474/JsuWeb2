<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/views/backStage/commons/commons.jsp"%>
<html lang="en">
  <head>
    <%@include file="/views/backStage/commons/commonHeader.jsp"%>
  </head>
  <body>
	<%@include file="/views/backStage/commons/commonBegin.jsp"%>
  <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                      	<form id="queryform" class="form-inline" role="form" style="margin-bottom: 10px;" 
                      		action="<%=path %>/backStage/goods/recycle/list" method="get">
                             <div class="form-group" style="margin: 10px;">
                                 <input name="name" value="${name}" type="text" class="form-control" placeholder="名称">
                             </div>
                             <div class="form-group" style="margin: 10px;">
                             	<button type="submit" class="btn btn-primary"> 查 询 </button>
                        	 </div>
                         </form>

                      	<form name="userform" action="<%=path %>/backStage/goods/recycle/list" method="get">
                          <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr style="background-color: #ecd59e;">
                              <th>编号</th>
			                    <th>商品名称</th>
			                    <th>商品类型</th>
			                    <th>单价</th>
			                    <th>库存</th>
			                    <th>促销单价</th>
			                    <th>促销开始日期</th>
			                    <th>促销结束日期</th>
			                    <th>操作</th>
                          </tr>
                          </thead>
                          <tbody>
                          	<!--表格头部结束-->
							<c:forEach items="${list }" var="li" varStatus="s">
	                          <tr class="odd gradeX">
	                          	  <td>${li.id}</td>
				                    <td>${li.name}</td>
				                    <td>${li.goodsTypeName}</td>
				                    <td>${li.period_amt}</td>
				                    <td>${li.stock}</td>
									<td>${li.sales_amt}</td>
									<td>${li.sales_date_begin}</td>
									<td>${li.sales_date_end}</td>
	                              <td>
	                              	<button class="btn btn-success btn-xs" type="button" onclick="returnFlag(${li.id})"><i class="icon-ok"></i></button>
	                              </td>
	                          </tr>
	                        </c:forEach>
                          </tbody>
                          </table>
                          <!-- 分页标签开始  -->
				            <div class="">
				                <paginator:page name="paginator" form="userform" action="/backStage/goods/recycle/list" />
				            </div>
				          <!-- 分页标签结束 -->
                        </form>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
	<%@include file="/views/backStage/commons/commonEnd.jsp"%>
	<script type="text/javascript" src="<%=path %>/static/backStage/assets/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript" src="<%=path %>/static/backStage/js/layer/layer.js"></script>
	<script type="text/javascript">
		function returnFlag(id){
			
			layer.confirm('是否要还原此商品？', {
				btn: ['还原','关闭'], //按钮
			}, function(){
				$.ajax({
		            type:"get",
		            data:{
		            	"id" : id,
		            	"flag" : '20'
		            },
		            async: false,
		            url:"<%=basePath%>backStage/goods/updateFlag",
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
				layer.closeAll('dialog');
			}, function(){
			});
			
	        return true;
	    }
	
	</script>
	
	</body>
</html>
