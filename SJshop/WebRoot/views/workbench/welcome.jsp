<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<meta charset="UTF-8">
  <head>
    <base href="<%=basePath%>"> 
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath%>css/reset.css">
    <link rel="stylesheet" href="<%=basePath%>css/base.css">
    <link rel="stylesheet" href="<%=basePath%>css/animate.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/jx_index.css">
    <link rel="stylesheet" href="<%=basePath%>css/applyManagementIndex.css">
    <link rel="stylesheet" href="<%=basePath%>css/msg.css">
    <link rel="stylesheet" href="<%=basePath%>css/jquery.mCustomScrollbar.min.css">
    <script src="<%=basePath%>js/vendor/jquery.min.js"></script>
    <script src="<%=basePath%>js/vendor/jquery-ui-1.10.4.min.js"></script>
    <script src="<%=basePath%>js/vendor/jquery.mousewheel.min.js"></script>
    <script src="<%=basePath%>js/vendor/jquery.mCustomScrollbar.js"></script>
    <script src="<%=basePath%>js/vendor/layer/layer.js"></script>
    <script src="<%=basePath%>js/vendor/slick.min.js"></script>
    <script src="<%=basePath%>js/vendor/Validform_v5.3.2_ncr_min.js"></script>
    <script src="<%=basePath%>js/vendor/jquery.SuperSlide.2.1.1.js"></script>
    <script src="<%=basePath%>js/jx_index.js"></script>
    <script src="<%=basePath%>js/msg.js"></script>

  </head>
  
  <body>
    <!-- 内容显示 start-->
    <div class="panel pl20 pr20 pt20 pb20">
        <!-- 常用模板 --> 
        <!-- 分层1 start-->
       <div class="pl_item">
           <div class="pl_i_hd clearfix">
               <%-- <div class="i_hd_left bt_color_green left hd_green">常用模板</div>
                <div class="i_hd_right right hd_write_txt pr20 "><i></i>编辑</div>--%>
           </div>
           <div class="pl_i_bd pt20 pb10">
                <!-- 模板块 -->                      
                <div class="template mr_auto ">
                    <ul class="clearfix">
                       <%-- <li>
                            <dl>
                                <dt class="mr_auto"></dt>
                                <dd><a herf="/riskCtrlInfo"></a>风控信息</dd>
                            </dl>
                        </li>--%>

                       <%-- <li>
                            <dl>
                                <dt class="mr_auto"></dt>
                                <a herf="/riskCtrlParaCfg"></a>
                                <dd>风控配置信息</dd>
                            </dl>
                        </li>--%>
                        <%--<li>
                            <dl>
                                <dt class="mr_auto"></dt>
                                <dd><a href="/pageJump?action=A">客户分析信息</a></dd>
                            </dl>
                        </li>

                        <li>
                             <dl>
                                <dt class="mr_auto"></dt>
                                <dd>查询合同</dd>
                            </dl>
                        </li>
                        <li>
                             <dl>
                                <dt class="mr_auto"></dt>
                                <dd>查询合同</dd>
                            </dl>
                        </li>--%>

                    </ul>
                </div>
           </div>
       </div> 
       <!-- 分层1 end-->
       <!-- 分层2 start -->
           <div class="clearfix">
                <!-- 代办事  start-->
                   <div class="to_do w507 left">
                       <div class="pt20">
                        <!-- 常用模板 -->
                           <div class="pl_item">
                                   <div class="pl_i_hd clearfix">
                                        <%--<div class="i_hd_left bt_color_green left hd_green">代办事</div>
                                        <div class="i_hd_right right hd_write_txt pr10 "><a href="javascript:void(0)">更多 >></a></div>--%>
                                   </div>
                                   <div class="pl_i_bd h270 list_msg pt10 pb40 pl20 pr20">
                                        <ul>
                                            <%--<li>
                                                <a class="left" href="javascript:void(0)">月入4K即可申请重磅上线</a>
                                                <span class="right">2016年6月20日</span>
                                            </li>
                                            <li>
                                                <a class="left" href="javascript:void(0)">月入4K即可申请重磅上线</a>
                                                <span class="right">2016年6月20日</span>
                                            </li>
                                            <li>
                                                <a class="left" href="javascript:void(0)">月入4K即可申请重磅上线</a>
                                                <span class="right">2016年6月20日</span>
                                            </li>
                                            <li>
                                                <a class="left" href="javascript:void(0)">月入4K即可申请重磅上线</a>
                                                <span class="right">2016年6月20日</span>
                                            </li>--%>
                                        </ul>
                                   </div>
                             </div>  
                        </div>
                   </div>
                <!-- 代办事  end-->
                <!-- 公告 start-->
                   <div class="notice w507 right">
                        <div class="pt20">
                        <!-- 常用模板 -->
                           <div class="pl_item">
                                   <div class="pl_i_hd clearfix">
                                       <%-- <div class="i_hd_left bt_color_blue left hd_blue">公告</div>
                                        <div class="i_hd_right right hd_write_txt pr10 "><a href="javascript:void(0)">更多 >></a></div>--%>
                                   </div>
                                   <div class="pl_i_bd h270 list_msg pt10 pb40 pl20 pr20">
                                        <ul>
                                          <%--  <li>
                                                <a class="left" href="javascript:void(0)">月入4K即可申请重磅上线</a>
                                                <span class="right">2016年6月20日</span>
                                            </li>
                                            <li>
                                                <a class="left" href="javascript:void(0)">月入4K即可申请重磅上线</a>
                                                <span class="right">2016年6月20日</span>
                                            </li>
                                            <li>
                                                <a class="left" href="javascript:void(0)">月入4K即可申请重磅上线</a>
                                                <span class="right">2016年6月20日</span>
                                            </li>
                                            <li>
                                                <a class="left" href="javascript:void(0)">月入4K即可申请重磅上线</a>
                                                <span class="right">2016年6月20日</span>
                                            </li>--%>
                                        </ul>
                                   </div>
                             </div>  
                        </div>
                   </div>
                <!-- 公告 end-->
           </div>
           <!-- 分层2 end -->
           <!-- 分层3 start -->
            <div class="clearfix">
                <!--  左侧 start-->
                 <div class="down_load w507  left">
                      <div class="pt20 pb10">
                       <!-- 常用模板 -->
                          <div class="pl_item">
                                  <div class="pl_i_hd clearfix">
                                     <%--  <div class="i_hd_left bt_color_pule left hd_pule">常用模板</div>
                                       <div class="i_hd_right right hd_write_txt pr10 "><a href="javascript:void(0)">更多 >></a></div>--%>
                                  </div>
                                  <div class="pl_i_bd h285 apply_step">
                                      <ul class="clearfix">
                                          <li>
                                            <%-- <a href="javascript:void(0)">
                                                  <dl>
                                                      <dt></dt>
                                                      <dd>申请分期贷款表格下载</dd>
                                                  </dl>
                                              </a>--%>
                                          </li>
                                          <li>
                                            <%-- <a href="javascript:void(0)">
                                                  <dl>
                                                      <dt></dt>
                                                      <dd>申请分期贷款表格下载</dd>
                                                  </dl>
                                              </a>--%>
                                          </li>
                                          <li>
                                              <%--<a href="javascript:void(0)">
                                                  <dl>
                                                      <dt></dt>
                                                      <dd>申请分期贷款表格下载</dd>
                                                  </dl>
                                              </a>--%>
                                          </li>
                                          <li>
                                              <%--<a href="javascript:void(0)">
                                                  <dl>
                                                      <dt></dt>
                                                      <dd>申请分期贷款表格下载</dd>
                                                  </dl>
                                              </a>--%>
                                          </li>
                                          <li>
                                            <%-- <a href="javascript:void(0)">
                                                  <dl>
                                                      <dt></dt>
                                                      <dd>申请分期贷款表格下载</dd>
                                                  </dl>
                                              </a>--%>
                                          </li>
                                          <li>
                                             <%-- <a href="javascript:void(0)">
                                                  <dl>
                                                      <dt></dt>
                                                      <dd>申请分期贷款表格下载</dd>
                                                  </dl>
                                              </a>--%>
                                          </li>
                                      </ul>
                                  </div>
                            </div>
                       </div>
                </div>  
                <!--  左侧 end-->
                <!-- 右侧start -->
                <div class="p_data w507 right">
                      <div class="pt20 pb10">
                       <!-- 常用模板 -->
                          <div class="pl_item">
                                  <div class="pl_i_hd clearfix">
                                       <%--<div class="i_hd_left bt_color_red left hd_red">某某数据</div>
                                       <div class="i_hd_right right hd_write_txt pr10 "><a href="javascript:void(0)">更多 >></a></div>--%>
                                  </div>
                                  <div class="pl_i_bd h285 data_show">
                                      
                                  </div>
                           </div>
                        </div>
                   </div>          
                <!-- 右侧end -->
            </div>
           <!-- 分层3 end -->
           <!-- 分层4 start -->
            <div class="">
                  <div class="pl_item">
                     <div class="pl_i_hd clearfix">
                          <%--<div class="i_hd_left bt_color_green left hd_green">常用模板</div>
                          <div class="i_hd_right right hd_write_txt pr20 "><i></i>编辑</div>--%>
                     </div>
                  </div> 
                   <div class="pl_i_bd h300">
                     
                   </div>  
            </div>
           <!-- 分层4 end -->
    </div>    
   <!-- 内容显示end-->
  </body>
</html>
