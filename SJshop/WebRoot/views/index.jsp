<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/views/commons/commons.jsp"%>
<html>
	<!-- Flot -->
    <script src="js/plugins/flot/jquery.flot.js"></script>
    <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>
    <!-- jQuery UI -->
    <script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- GITTER -->
    <script src="js/plugins/gritter/jquery.gritter.min.js"></script>
    <!-- EayPIE -->
    <script src="js/plugins/easypiechart/jquery.easypiechart.js"></script>
    <!-- Sparkline -->
    <script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>
    
<head>
</head>
<body>
	<%@include file="/views/commons/menuHeader.jsp"%>

	<div class="row white-bg dashboard-header">
		<p class="welcome-message">欢迎使用风控系统</p>
	</div>

<!-- 当天业务通过情况 -->
<div class="row white-bg">
    <div class="col-lg-3">
        <div class="ibox float-e-margins" style="font-family: 'open sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;">
            <div class="ibox-title clearfix" style="padding: 14px 15px 7px; min-height: 0; border-bottom: 1px solid #dfdfdf;">
                <span class="label label-success pull-right">笔数</span>
                <h5 style="color: #676a6c; font-size: 14px; font-weight: bold;">总量</h5>
            </div>
            <div class="ibox-content" style="padding: 15px 20px 20px; text-align: left;">
                <h1 class="no-margins" style="font-size: 30px;font-family: 'open sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;">${todayResultMap.total}</h1>
                <div class="stat-percent font-bold text-success">100% <!-- <i class="fa fa-bolt"></i> -->
                </div>
                <small>&nbsp;<!--   --></small>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title clearfix" style="padding: 14px 15px 7px; min-height: 0; border-bottom: 1px solid #dfdfdf;">
                <span class="label label-info pull-right">笔数</span>
                <h5 style="color: #676a6c; font-size: 14px; font-weight: bold;">通过</h5>
            </div>
            <div class="ibox-content" style="padding: 15px 20px 20px; text-align: left;">
                <h1 class="no-margins" style="font-size: 30px;">${todayResultMap.success}</h1>
                <div class="stat-percent font-bold text-info">${todayResultMap.successRate}% <!-- <i class="fa fa-level-up"></i> -->
                </div>
                <small>&nbsp;<!-- 新订单 --></small>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title clearfix" style="padding: 14px 15px 7px; min-height: 0; border-bottom: 1px solid #dfdfdf;">
                <span class="label label-primary pull-right">笔数</span>
                <h5 style="color: #676a6c; font-size: 14px; font-weight: bold;">不通过</h5>
            </div>
            <div class="ibox-content" style="padding: 15px 20px 20px; text-align: left;">
                <h1 class="no-margins" style="font-size: 30px;">${todayResultMap.fail}</h1>
                <div class="stat-percent font-bold text-navy">${todayResultMap.failRate}% <!-- <i class="fa fa-level-up"></i> -->
                </div>
                <small>&nbsp;<!-- 新访客 --></small>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title clearfix" style="padding: 14px 15px 7px; min-height: 0; border-bottom: 1px solid #dfdfdf;">
                <span class="label label-danger pull-right">笔数</span>
                <h5 style="color: #676a6c; font-size: 14px; font-weight: bold;">异常</h5>
            </div>
            <div class="ibox-content" style="padding: 15px 20px 20px; text-align: left;">
                <h1 class="no-margins" style="font-size: 30px; min-height: none;">${todayResultMap.exception}</h1>
                <div class="stat-percent font-bold text-danger">${todayResultMap.exceptionRate}% <!-- <i class="fa fa-level-down"></i> -->
                </div>
                <small>&nbsp;<!-- 12月 --></small>
            </div>
        </div>
    </div>
</div>


<!-- 当天各环节业务量 -->
<div class="row  border-bottom white-bg dashboard-header" style="color:#676a6c;font-family:'open sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;">
	<div class="col-sm-3">
        <h2 style="font-size: 14px;font-weight: bold;">当天各环节业务量</h2>
        <ul class="list-group clear-list m-t" style="font-size: 13px;">
            <li class="list-group-item fist-item">
                <span class="pull-right">
                	${todayStatusMap.CreateTask }
                </span>
                <span class="label label-success">1</span> 建立任务
            </li>
            <li class="list-group-item">
                <span class="pull-right">
                     ${todayStatusMap.Login }
                 </span>
                <span class="label label-info">2</span> 营业厅登录
            </li>
            <li class="list-group-item">
                <span class="pull-right">
                    ${todayStatusMap.GrabDate }
                </span>
                <span class="label label-primary">3</span> 数据采集
            </li>
            <li class="list-group-item">
                <span class="pull-right">
                    ${todayStatusMap.CalcTarget }
                </span>
                <span class="label label-default">4</span> 计算指标
            </li>
            <li class="list-group-item">
                <span class="pull-right">
                   ${todayStatusMap.CalcStrategy }
                </span>
                <span class="label label-primary">5</span> 计算策略
            </li>
        </ul>
    </div>
               
    <!-- 近7天业务申请量 --> 
	<div class="col-sm-5"> 
		<h2 style="font-size: 14px;font-weight: bold;">近7天业务量统计</h2>
       	<div class="flot-chart dashboard-chart">
           	<div class="flot-chart-content" id="flot-dashboard-chart"></div>
       	</div>
   </div>
   
   
   <!--  近7天结果统计 饼状图 -->
   <div class="col-lg-4">
        <h2 style="font-size: 14px;font-weight: bold;">近7天各环节业务量统计</h2>
        <div class="float-e-margins" style="margin-top: 20px;">
            <div class="">
                <div class="flot-chart">
                    <div class="flot-chart-content" id="flot-pie-chart"></div>
                </div>
            </div>
        </div>
    </div>
</div>   
   
   
   
   <script>
   		$(document).ready(function () {
   			var data1 = [
                [0, 4], [1, 8], [2, 5], [3, 10], [4, 4], [5, 16], [6, 5], [7, 11], [8, 6], [9, 11], [10, 30], [11, 10], [12, 13], [13, 4], [14, 3], [15, 3], [16, 6]
            ];
            var data2 = [
                [0, 1], [1, 0], [2, 2], [3, 0], [4, 1], [5, 3], [6, 1], [7, 5], [8, 2], [9, 3], [10, 2], [11, 1], [12, 0], [13, 2], [14, 8], [15, 0], [16, 0]
            ];
	   		$("#flot-dashboard-chart").length && $.plot($("#flot-dashboard-chart"), [
	         data1, data2
	     	], {
	         series: {
	             lines: {
	                 show: false,
	                 fill: true
	             },
	             splines: {
	                 show: true,
	                 tension: 0.4,
	                 lineWidth: 1,
	                 fill: 0.4
	             },
	             points: {
	                 radius: 0,
	                 show: true
	             },
	             shadowSize: 2
	         },
	         grid: {
	             hoverable: true,
	             clickable: true,
	             tickColor: "#d5d5d5",
	             borderWidth: 1,
	             color: '#d5d5d5'
	         },
	         colors: ["#1ab394", "#464f88"],
	         xaxis: {},
	         yaxis: {
	             ticks: 4
	         },
	         tooltip: false
	     });
	     
	     
	     
	     var data = [{
		        label: "数据 1",
		        data: 21,
		        color: "#d3d3d3",
		    }, {
		        label: "数据 2",
		        data: 3,
		        color: "#bababa",
		    }, {
		        label: "数据 3",
		        data: 15,
		        color: "#79d2c0",
		    }, {
		        label: "数据 4",
		        data: 52,
		        color: "#1ab394",
		    }];
    
    
	     var plotObj = $.plot($("#flot-pie-chart"), data, {
	        series: {
	            pie: {
	                show: true
	            }
	        },
	        grid: {
	            hoverable: true
	        },
	        tooltip: true,
	        tooltipOpts: {
	            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
	            shifts: {
	                x: 20,
	                y: 0
	            },
	            defaultTheme: false
	        }
	    });
    
});
	</script>
</body>
</html>