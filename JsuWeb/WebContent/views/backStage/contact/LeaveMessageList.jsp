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
                      		action="<%=path %>/backStage/conatct/listLeaveMessage" method="get">
                             <div class="form-group" style="margin: 10px;">
                                 <input name="name" value="${name}" type="text" class="form-control" placeholder="姓名">
                             </div>
                             <div class="form-group" style="margin: 10px;">
                                 <input name="phone" value="${phone}" type="text" class="form-control" placeholder="电话">
                             </div>
                             <div class="form-group" style="margin: 10px;">
                             	<button type="submit" class="btn btn-success"> 查 询 </button>
                        	 </div>
                         </form>
                      
                      	<form name="userform" action="<%=path %>/backStage/conatct/listLeaveMessage" method="get">
                          <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr style="background-color: #ecd59e;">
                              <th>编号</th>
                              <th>姓名</th>
                              <th>电话</th>
                              <th>邮箱</th>
                              <th>留言信息</th>
                          </tr>
                          </thead>
                          <tbody>
                          	<!--表格头部结束-->
							<c:forEach items="${list }" var="message" varStatus="s">
	                          <tr class="odd gradeX">
	                          	  <td>${message.id }</td>
	                              <td>${message.name }</td>
	                              <td>${message.phone }</td>
	                              <td>${message.email }</td>
	                              <td>${message.message }</td>
	                          </tr>
	                        </c:forEach>
                          </tbody>
                          </table>
                          <!-- 分页标签开始  -->
				            <div class="">
				                <paginator:page name="paginator" form="userform" action="/backStage/conatct/listLeaveMessage" />
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
