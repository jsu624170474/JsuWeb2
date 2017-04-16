<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/views/backStage/commons/commons.jsp"%>
<html lang="en">
  <head>
    <%@include file="/views/backStage/commons/commonHeader.jsp"%>
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/backStage/assets/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/backStage/assets/bootstrap-colorpicker/css/colorpicker.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/backStage/assets/bootstrap-daterangepicker/daterangepicker.css" />
  </head>
  <body>
	<%@include file="/views/backStage/commons/commonBegin.jsp"%>
	
  <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                  
                  <div id="alertDiv" class="alert alert-warning" style="display: none;">
						<a href="#" class="close" onclick="closeAlert()">
							&times;
						</a>
						该账号已存在，请重新录入。
					</div>
				                  
                      <section class="panel">
						<header class="panel-heading" >
                              	<strong>商品详情（新增/修改）</strong>
                          </header>
                          <div class="panel-body">
                              <form name="goodsform" class="form-horizontal" action="<%=basePath%>/backStage/goods/detail/update" 
                              	method="post" onsubmit="return check()">
                              	<input name="id" type="hidden" value="${cfgGoods.id}">
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">商品名称</label>
                                      <div class="col-lg-4">
                                          <input id="name" name="name" type="text" value="${cfgGoods.name}" required="required" class="form-control">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">所属商品类型</label>
                                      <div class="col-lg-4">
                                          <select id="goodsTypeId" name="goodsTypeId" class="form-control m-bot15">
                                              <option value="">--请选择--</option>
											<c:forEach items="${cfgGoodsTypeList}" var="goodsTypeList" varStatus="status">
												<option value="${goodsTypeList.id}" <c:if test="${goodsTypeList.id==cfgGoods.goodsTypeId}"> selected="selected"</c:if> >${goodsTypeList.name}</option>
											</c:forEach>
                                          </select>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">单价</label>
                                      <div class="col-lg-2">
                                          <input name="periodAmt" type="text" value="${cfgGoods.periodAmt}" class="form-control"
                                          	onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" required>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">库存</label>
                                      <div class="col-lg-2">
                                          <input name="stock" type="email" class="form-control" value="${cfgGoods.stock}" required="required" 
											onkeyup="this.value=this.value.replace(/\D/g,'')">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">上/下架</label>
                                      <div class="col-lg-10">
                                          <select id="flag" name="flag" class="form-control m-bot15" style="width: 200px;">
                                              <option value="20" <c:if test="${cfgGoods.flag=='20'}"> selected="selected"</c:if> >下架</option>
											 <option value="10" <c:if test="${cfgGoods.flag=='10'}"> selected="selected"</c:if> >上架</option>
                                          </select>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">是否老板推荐</label>
                                      <div class="col-lg-10">
                                          <select id="flag" name="flag" class="form-control m-bot15" style="width: 200px;">
                                              <option value="N" <c:if test="${cfgGoods.isRecommend=='N'}"> selected="selected"</c:if> >否</option>
											  <option value="Y" <c:if test="${cfgGoods.isRecommend=='Y'}"> selected="selected"</c:if> >推荐</option>
										 </select>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">促销单价</label>
                                      <div class="col-lg-10">
                                          <input type="text" name="salesAmt" value="${cfgGoods.salesAmt}"  class="form-control" style="width: 200px;"
											onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">促销限购数量</label>
                                      <div class="col-lg-10">
                                          <input name="salesLimitNum" type="text" class="form-control" style="width: 200px;"
                                          	value="${cfgGoods.salesLimitNum}" required="required" 
											onkeyup="this.value=this.value.replace(/\D/g,'')">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">促销时间段</label>
                                      <div class="col-lg-4">
                                          <div class="input-append date" id="dpYears" data-date="2017-04-01"
                                               data-date-format="yyyy-mm-dd" >
                                              <input class="form-control" size="16" type="text" value="2017-04-01" readonly>
                                              <span class="add-on" ><i class="icon-calendar"></i></span>
                                          </div>
                                          <span> 至 </span>
                                          <div class="input-append date" id="dpYears1" data-date="12-02-2012"
                                               data-date-format="dd-mm-yyyy" >
                                              <input class="form-control" size="16" type="text" value="12-02-2012" readonly>
                                              <span class="add-on" ><i class="icon-calendar"></i></span>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">商品描述</label>
                                      <div class="col-lg-10">
                                          <textarea name="remark" rows="4" cols="40" class="form-control" style="width: 400px;"
                                          	value="${cfgGoods.salesLimitNum}" >${cfgGoods.remark}</textarea>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <div class="col-lg-offset-2 col-lg-10">
                                          <button type="submit" class="btn btn-danger">保存</button>
                                      	  <button id="btnBack" type="button" class="btn btn-info">返回</button>
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
	
	<%@include file="/views/backStage/commons/commonEnd.jsp"%>
	<script type="text/javascript" src="<%=path %>/static/backStage/assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="<%=path %>/static/backStage/assets/data-tables/DT_bootstrap.js"></script>
    


    <!--custom switch-->
    <script src="<%=path %>/static/backStage/js/bootstrap-switch.js"></script>
    <!--custom tagsinput-->
    <script src="<%=path %>/static/backStage/js/jquery.tagsinput.js"></script>

    <script type="text/javascript" src="<%=path %>/static/backStage/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="<%=path %>/static/backStage/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>


  <!--common script for all pages-->
    <script src="<%=path %>/static/backStage/js/common-scripts.js"></script>

  <!--script for this page-->
  <script src="<%=path %>/static/backStage/js/form-component.js"></script>
    
	
	<script type="text/javascript">
		$(document).ready(function(){
	    	$("#btnBack").click( function () {
	    		window.location.href='<%=basePath%>backStage/sys/user/list';
	    	});
	    	
	    	//$("#alertDiv").hide();
	    });
		
		function closeAlert(){
			$("#alertDiv").hide();
		}
		
		function check(){
			
			var checkResult = true;
			
			// 校验此登录账号是否存在
			$.ajax({
                type:"post",
                data:{
                	"loginName" : $("#loginName").val()
                },
                async: false,
                url:"<%=basePath%>backStage/sys/user/addCheck",
                success:function(data) {
	                	if(data.rtnCode!='S'){
	                		$("#alertDiv").show();
	                		checkResult = false;
	                	}
                },
                error:function(){
                    alert("异常，请联系管理员！");
                    checkResult = false;
                }
            });
			
			return checkResult;
		}
	</script>
	</body>
</html>
