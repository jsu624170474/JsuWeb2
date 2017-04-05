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
                          <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr>
                              <th>用户名</th>
                              <th class="hidden-phone">登录账号</th>
                              <th class="hidden-phone">电话</th>
                              <th class="hidden-phone">邮箱</th>
                              <th class="hidden-phone">状态</th>
                              <th class="hidden-phone">操作</th>
                          </tr>
                          </thead>
                          <tbody>
                          	<!--表格头部结束-->
							<c:forEach items="${list }" var="user" varStatus="s">
	                          <tr class="odd gradeX">
	                              <td>${user.name }</td>
	                              <td class="hidden-phone">${user.loginName }</td>
	                              <td class="hidden-phone">${user.phone }</td>
	                              <td class="hidden-phone">${user.email }</td>
	                              <td class="hidden-phone">${user.status }</td>
	                              <td class="hidden-phone"><span class="label label-success">Approved</span></td>
	                          </tr>
	                        </c:forEach>
                          </tbody>
                          </table>
                      </section>
                  </div>
              </div>
              <!-- page end-->
              <!-- 分页标签开始  -->
	            <div class="">
	                <paginator:page name="paginator" form="orgform" action="/black/nation/list" />
	            </div>
	          <!-- 分页标签结束 -->
          </section>
      </section>
      <!--main content end-->
	
	<%@include file="/views/backStage/commons/commonEnd.jsp"%>
	<script type="text/javascript" src="<%=path %>/static/backStage/assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="<%=path %>/static/backStage/assets/data-tables/DT_bootstrap.js"></script>
    <%-- <script src="<%=path %>/static/backStage/js/dynamic-table.js"></script> --%>
	</body>
</html>
