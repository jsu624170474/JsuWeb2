<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
<head>
	<link rel="stylesheet" href="<%=path%>/css/imgload.css">
	<link rel="stylesheet" href="<%=path%>/css/upload/commons.css">
	<link rel="stylesheet" href="<%=path%>/css/multiple-choice.css">
	<script src="<%=path%>/js/multiple-choice.js"></script>
	<script src="<%=basePath %>js/ajaxFileUpload/ajaxfileupload.js" type="text/javascript" charset="utf-8"></script>
		
	<script src="<%=path%>/js/plugins/layer/laydate/laydate.js"></script>
	
<script type="text/javascript">
$(function() {
	// 选择 显示图片
	$("input[type='file']").on(
			"change",
			function() {
				var _this = $(this);
				var file = $(this).get(0).files[0];

				var fileType = ".doc,.docx,.xls,.txt,.xlsx";
				var imgType = ".jpg,.jpeg,.png,.png";
				
				var str = file.name;
				var sufix = str.substr(str.lastIndexOf("."));
				
				if (fileType.indexOf(sufix)!=-1) {
					$(this).parents(".field").find('img')
					.attr('src', '<%=path%>/images/pdf.png').show();
				}else{
					var reader = new FileReader();
					_this.prev('.fileBox').hide();
					reader.readAsDataURL(file);
					reader.onload = function() {
						_this.parents(".fileBoxCom").find(".fileBox").hide();
						_this.parents(".field").find('img')
							.attr('src', this.result).show();
					}
				}
				
			});
	});	
</script>
</head>
<body>
	<%@include file="/views/commons/commonBegin.jsp"%>
	<br>
	<div class="width-col12" >
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<form name="goodsform" action="<%=basePath%>goods/detail/update" method="POST" enctype="multipart/form-data">
				<div class="form">
					<div class="form-top">
						<input name="id" type="hidden" value="${cfgGoods.id}">
						<p class="margin-bottom-30">
							<label>商品名称<i class="color-red">＊</i></label>
							<input type="text" name="name" value="${cfgGoods.name}" required="required"/>
						</p>
						<p class="margin-bottom-20">
							<label>所属商品类型<i class="color-red">＊</i></label>
							<select name="goodsTypeId" required >
								<option value="">--请选择--</option>
								<c:forEach items="${cfgGoodsTypeList}" var="goodsTypeList" varStatus="status">
									<option value="${goodsTypeList.id}" <c:if test="${goodsTypeList.id==cfgGoods.goodsTypeId}"> selected="selected"</c:if> >${goodsTypeList.name}</option>
								</c:forEach>
							</select> 
						</p>
						<p class="margin-bottom-30">
							<label>状态<i class="color-red">＊</i></label>
							<select name="flag" required >
								<option value="20" <c:if test="${cfgGoods.flag=='20'}"> selected="selected"</c:if> >下架</option>
								<option value="10" <c:if test="${cfgGoods.flag=='10'}"> selected="selected"</c:if> >上架</option>
							</select> 
						</p>
						<p class="margin-bottom-30">
							<label>单价<i class="color-red">＊</i></label>
							<input type="text" name="periodAmt"  value="${cfgGoods.periodAmt}" required="required"
							 	onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" />
						</p>
						<p class="margin-bottom-30">
							<label>库存<i class="color-red">＊</i></label>
							<input type="text" name="stock" value="${cfgGoods.stock}" required="required" 
								onkeyup="this.value=this.value.replace(/\D/g,'')"/>
						</p>
						<p class="margin-bottom-30">
							<label>是否老板推荐<i class="color-red">＊</i></label>
							<select name="isRecommend" required >
								<option value="N" <c:if test="${cfgGoods.isRecommend=='N'}"> selected="selected"</c:if> >否</option>
								<option value="Y" <c:if test="${cfgGoods.isRecommend=='Y'}"> selected="selected"</c:if> >推荐</option>
							</select> 
						</p>
						<p class="margin-bottom-30">
							<label>促销单价</label>
							<input type="text" name="salesAmt" value="${cfgGoods.salesAmt}"  onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"/>
						</p>
						<p class="margin-bottom-30">
							<label>促销起始日期</label>
							<input name="salesDateBegin"  value="${cfgGoods.salesDateBegin}" class="form-control layer-date" placeholder="开始时间" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
							 <span > 至  </span> 
							<input name="salesDateEnd" value="${cfgGoods.salesDateEnd}" class="form-control layer-date" placeholder="结束时间" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
						</p>
						<p class="margin-bottom-30">
							<label>促销限购数量</label>
							<input type="text" name="salesLimitNum" value="${cfgGoods.salesLimitNum}" onkeyup="this.value=this.value.replace(/\D/g,'')"/>
						</p>
						<p class="margin-bottom-30">
							<label>商品描述</label>
							<textarea name="remark" rows="4" cols="40">${cfgGoods.remark}</textarea>
						</p>
						<%-- <p class="margin-bottom-30">
							<label>商品排序</label>
							<input type="text" name="orderSeq" value="${cfgGoods.orderSeq}" />
						</p> --%>
						<div class="margin-bottom-30" style="text-align: left;">
							<label style="width: 118px;padding-right: 20px;text-align: right;font-size: 14px;">商品Icon</label>
							<div class="field" style="display: inline-block;">
								<div class="bigfile fileBoxCom moreImg" >
									<div class="fileBox">
										<i class="icon icon-plus"></i>
									</div>
									<input type="file" accept="image/jpg,image/jpeg,image/gif,image/png" data-validate="required:请选择文件" name="pic_picUrl" > 
									<img src="${cfgGoods.picUrl }" <c:if test="${cfgGoods.picUrl == null  and cfgGoods.picUrl ==''}" > style="display: none;" </c:if> >
								</div>
							</div>
						</div>
						
						<div class="margin-bottom-30" style="text-align: left;">
						<div class="field" style="display: inline-block;">
							<label style="font-size: 14px;display: block;">商品banner_1</label>
							<div class="bigfile fileBoxCom moreImg" style="display: inline-block;">
								<div class="fileBox">
									<i class="icon icon-plus"></i>
								</div>
								<input name="pic_banner_1" type="file" accept="image/jpg,image/jpeg,image/gif,image/png" data-validate="required:请选择文件" > 
								<img src="${pic_banner_1 }" <c:if test="${pic_banner_1 == null  and pic_banner_1 ==''}" > style="display: none;" </c:if> >
							</div>
						</div>
						
						<div class="field" style="display: inline-block;">
							<label style="font-size: 14px;display: block;">商品banner_2</label>
							<div class="bigfile fileBoxCom moreImg" style="display: inline-block;">
								<div class="fileBox">
									<i class="icon icon-plus"></i>
								</div>
								<input name="pic_banner_2" type="file" accept="image/jpg,image/jpeg,image/gif,image/png" data-validate="required:请选择文件" > 
								<img src="${pic_banner_2 }" <c:if test="${pic_banner_2 == null  and pic_banner_2 ==''}" > style="display: none;" </c:if> >
							</div>
						</div>
						
						<div class="field" style="display: inline-block;">
							<label style="font-size: 14px;display: block;">商品banner_3</label>
							<div class="bigfile fileBoxCom moreImg" style="display: inline-block;">
								<div class="fileBox">
									<i class="icon icon-plus"></i>
								</div>
								<input name="pic_banner_3" type="file" accept="image/jpg,image/jpeg,image/gif,image/png" data-validate="required:请选择文件" > 
								<img src="${pic_banner_3 }" <c:if test="${pic_banner_3 == null  and pic_banner_3 ==''}" > style="display: none;" </c:if> >
							</div>
						</div>
						
						<div class="field" style="display: inline-block;">
							<label style="font-size: 14px;display: block;">商品banner_4</label>
							<div class="bigfile fileBoxCom moreImg" style="display: inline-block;">
								<div class="fileBox">
									<i class="icon icon-plus"></i>
								</div>
								<input name="pic_banner_4" type="file" accept="image/jpg,image/jpeg,image/gif,image/png" data-validate="required:请选择文件" > 
								<img src="${pic_banner_4 }" <c:if test="${pic_banner_4 == null  and pic_banner_4 ==''}" > style="display: none;" </c:if> >
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="form-bottom">
				</div> -->
				<div class="btn-area">
					<button class="cancel-btn btn" onClick="javascript :window.location.href = '<%=basePath %>goods/list';">取消</button>
					<button class="sure-btn btn" type="submit">确定</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	</script>
	
	<%@include file="/views/commons/commonEnd.jsp"%>
</body>
</html>