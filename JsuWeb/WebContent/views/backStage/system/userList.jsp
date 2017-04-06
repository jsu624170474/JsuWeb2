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
                      		action="<%=path %>/backStage/sys/user/list" method="get">
                             <div class="form-group" style="margin: 10px;">
                                 <input name="loginName" value="${loginName}" type="text" class="form-control" placeholder="登录账号">
                             </div>
                             <div class="form-group" style="margin: 10px;">
                                 <input name="name" value="${name}" type="text" class="form-control" placeholder="用户名">
                             </div>
                             <div class="form-group" style="margin: 10px;">
                             	<button type="submit" class="btn btn-success"> 查 询 </button>
                        	 </div>
                        	 <div class="form-group" style="float: right;margin: 10px;">
                                 <div class="col-lg-offset-2 col-lg-10">
                                     <button id="btnUserAdd" type="button" class="btn btn-danger">新增用户</button>
                                 </div>
                             </div>
                         </form>
                      
                      	<form name="userform" action="<%=path %>/backStage/sys/user/list" method="get">
                          <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr style="background-color: #ecd59e;">
                              <th>登录账号</th>
                              <th>用户名</th>
                              <th>电话</th>
                              <th>邮箱</th>
                              <th>状态</th>
                              <th>操作</th>
                          </tr>
                          </thead>
                          <tbody>
                          	<!--表格头部结束-->
							<c:forEach items="${list }" var="user" varStatus="s">
	                          <tr class="odd gradeX">
	                              <td>${user.loginName }</td>
	                              <td>${user.name }</td>
	                              <td>${user.phone }</td>
	                              <td>${user.email }</td>
	                              <td>${user.status }</td>
	                              <td>
                                      <button class="btn btn-primary btn-xs"><i class="icon-pencil"></i></button>
                                      <!-- <button class="btn btn-danger btn-xs"><i class="icon-trash "></i></button> -->
	                              </td>
	                          </tr>
	                        </c:forEach>
                          </tbody>
                          </table>
                          <!-- 分页标签开始  -->
				            <div class="">
				                <paginator:page name="paginator" form="userform" action="/backStage/sys/user/list" />
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
    <script type="text/javascript" src="<%=path %>/static/backStage/assets/data-tables/DT_bootstrap.js"></script>
    <%-- <script src="<%=path %>/static/backStage/js/dynamic-table.js"></script> --%>
	
	<script type="text/javascript">
	    $(document).ready(function(){
	    	$("#btnUserAdd").click( function () {
	    		window.location.href='<%=basePath%>backStage/sys/user/add';
	    	});
	    });
    </script>
	</body>
</html>
