<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/views/frontEnd/commons/commons.jsp"%>
<body>
	<div id="wrapper">
		<!-- 菜单 -->
		<%@include file="/views/frontEnd/commons/commonsBegin.jsp"%>

		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2 class="pageTitle">Contact Us</h2>
					</div>
				</div>
			</div>
		</section>
		<section id="content">

			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<p>如果需要留言，请在下面填写.</p>
						<div class="done" id="alertMsg" style="display:${empty alertMsg ? 'none' : 'inline'};">
							<div class="alert alert-success">
								<button type="button" class="close" data-dismiss="alert">×</button>
								您的留言发送成功!
							</div>
						</div>
						<div class="contact-form">

							<form method="post" action="<%=path%>/contactus/add"
								id="contactform" class="contact">
								<div class="form-group has-feedback">
									<label for="name">姓名*</label> <input type="text"
										class="form-control" name="name" placeholder="" required> <i
										class="fa fa-user form-control-feedback"></i>
								</div>
								<div class="form-group has-feedback">
									<label for="phone">电话</label> <input type="text"
										class="form-control" name="phone" placeholder=""> <i
										class="fa fa-user form-control-feedback"></i>
								</div>
								<div class="form-group has-feedback">
									<label for="email">邮箱</label> <input type="email"
										class="form-control" name="email" placeholder=""> <i
										class="fa fa-envelope form-control-feedback"></i>
								</div>
								<div class="form-group has-feedback">
									<label for="message">留言信息*</label>
									<textarea class="form-control" rows="6" name="message"
										placeholder=""  required></textarea>
									<i class="fa fa-pencil form-control-feedback"></i>
								</div>
								<input type="submit" value="提交留言信息" id="submit"
									class="submit btn btn-default">
							</form>
						</div>
					</div>
					<div class="col-md-6"></div>
				</div>
			</div>
		</section>

		<!-- 底部 -->
		<%@include file="/views/frontEnd/commons/commonsEnd.jsp"%>
		
	</div>

</body>
</html>