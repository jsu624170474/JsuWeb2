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
						<header class="panel-heading" >
                              	<strong>新增用户</strong>
                          </header>
                          <div class="panel-body">
                              <form class="form-horizontal" role="form" action="<%=path %>/backStage/sys/user/save" 
                              	method="post" onsubmit="return check()">
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">登录账号</label>
                                      <div class="col-lg-10">
                                          <input name="loginName" type="text" class="form-control" style="width: 200px;" required>
                                          <div class="help-block" >* 不能包含特殊字符</div>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">用户名</label>
                                      <div class="col-lg-10">
                                          <input name="name" type="text" class="form-control" style="width: 200px;" required>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">手机号</label>
                                      <div class="col-lg-10">
                                          <input name="phone" type="text" class="form-control" style="width: 200px;">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">邮箱</label>
                                      <div class="col-lg-10">
                                          <input name="email" type="email" class="form-control" style="width: 200px;">
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
	
	<script type="text/javascript">
		$(document).ready(function(){
	    	$("#btnBack").click( function () {
	    		window.location.href='<%=basePath%>backStage/sys/user/list';
	    	});
	    });
		
		function check(){
			// 校验此登录账号是否存在
			
			return true;
		}
	</script>
	</body>
</html>
