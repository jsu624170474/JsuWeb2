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
                      	<form class="form-inline" role="form" style="margin-bottom: 10px;" 
                      		action="<%=path %>/backStage/goods/type/list" method="get">
                             <div class="form-group" style="margin: 10px;">
                                 <input name="name" value="${name}" type="text" class="form-control" placeholder="名称">
                             </div>
                             <div class="form-group" style="margin: 10px;">
                             	<button type="submit" class="btn btn-primary"> 查 询 </button>
                        	 </div>
                        	 <div class="form-group" style="float: right;margin: 10px;margin-right: 50px;">
                                 <div class="col-lg-offset-2 col-lg-10">
                                     <button id="btnGoodAdd" type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">新增商品类型</button>
                                 </div>
                             </div>
                         </form>

                      	<form name="userform" action="<%=path %>/backStage/goods/type/list" method="get">
                          <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr style="background-color: #ecd59e;">
                              <th>编号</th>
                              <th>名称</th>
                              <th>说明</th>
                              <th>操作</th>
                          </tr>
                          </thead>
                          <tbody>
                          	<!--表格头部结束-->
							<c:forEach items="${list }" var="goods" varStatus="s">
	                          <tr class="odd gradeX">
	                          	  <td>${goods.id }</td>
	                              <td>${goods.name }</td>
	                              <td>${goods.remark }</td>
	                              <td>
	                              	<button class="btn btn-primary btn-xs" type="button" onclick="edit('${goods.id}','${goods.name }','${goods.remark }')"><i class="icon-pencil"></i></button>
	                              </td>
	                          </tr>
	                        </c:forEach>
                          </tbody>
                          </table>
                          <!-- 分页标签开始  -->
				            <div class="">
				                <paginator:page name="paginator" form="userform" action="/backStage/goods/type/list" />
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
      
      <!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
		style="width: 620px;height: 380px;margin: auto;overflow: hidden;">
	    <div class="modal-dialog" style="border: 0px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel" style="color: white;">新增产品类型</h4>
	            </div>
	            <div class="modal-body" style="overflow:hidden;">
	            	<input id="id" type="hidden" />
	            	<div class="form-group" style="padding: 13px;">
                        <label class="col-lg-2 control-label">名称 :</label>
                        <div class="col-lg-10">
                            <input id="name" name="name" type="text" class="form-control" style="width: 200px;">
                        </div>
                    </div>
                    <div class="form-group"  style="padding: 13px;">
                        <label class="col-lg-2 control-label">说明 :</label>
                        <div class="col-lg-10">
                        	<textarea id="remark" name="remark" rows="3" cols="300" style="width: 300px;" class="form-control"></textarea>
                          <!-- <input id="remark" name="remark" type="text" class="form-control" style="width: 200px;"> -->
                        </div>
                    </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button type="button" class="btn btn-primary" id="saveGoodsType">保存产品类型</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<%@include file="/views/backStage/commons/commonEnd.jsp"%>
	<script type="text/javascript" src="<%=path %>/static/backStage/assets/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript" src="<%=path %>/static/backStage/js/layer/layer.js"></script>
	
	<script type="text/javascript">
		$("#saveGoodsType").click( function () {
			saveGoodsType();
		});
		
		function edit(id,name,remark){
			$("#id").val(id);
			$("#name").val(name);
			$("#remark").val(remark);

			$("#myModal").modal();
		}
		
		function saveGoodsType(){
			var name = $("#name").val();
			var remark = $("#remark").val();
			
			if(name==null || name ==''){
				layer.msg('[名称]为空！');
				return ;
			}
			
			$.ajax({
	            type:"post",
	            data:{
	            	"id" : $("#id").val(),
	            	"name" : name,
	            	"remark" : remark
	            },
	            async: false,
	            url:"<%=path %>/backStage/goods/type/save",
	            success:function(data) {
	                	if(data.rtnCode!='S'){
	                		window.location.href='<%=path %>/backStage/goods/type/list';
	                	}
	            },
	            error:function(){
	                alert("异常，请联系管理员！");
	            }
	        });
		}
	</script>
	
	</body>
</html>
