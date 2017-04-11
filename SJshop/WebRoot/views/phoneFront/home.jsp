<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>西点,蛋糕,巧克力,果酱</title>
    <meta name="Keywords" content="西点,蛋糕,巧克力,果酱">
    <meta name="Description" content="西点,蛋糕,巧克力,果酱">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/phoneFront/public.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/phoneFront/index.css">
    <script type="text/javascript" src="<%=basePath%>js/phoneFront/TouchSlide.1.1.js"></script>
</head>
<body>
<div class="body_bj">
    <header id="header">
        <script type="text/javascript">
            var process_request = "正在处理您的请求...";
        </script>
        <script language="javascript">
            <!--
            /*屏蔽所有的js错误*/
            function killerrors() {
                return true;
            }
            window.onerror = killerrors;
            //-->
        </script>
    <span href="javascript:void(0)" class="logo">~~发发西点屋~~</span></header>
    <c:if test="${salesList.size()>0 }">
    <section class="index_floor">
        <h4><span>促销商品</span><i><a href="http://b2b2c.wygk.cn/mobile/search.php?intro=new">更多</a></i></h4>

        <div id="scroll_promotion" class="scroll_hot">
            <div class="tempWrap" style="overflow:hidden; position:relative;">
                <div class="bd" style="width: 1368px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms; transform: translate(-342px, 0px) translateZ(0px);">
                <c:forEach items="${salesList}" var="li" varStatus="status">
                	<c:if test="${status.count%3 == 1}">
                    	<ul style="display: table-cell; vertical-align: top; width: 342px;">
                    </c:if>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="<%=path%>/phoneFront/detail?id=${li.id}" title="${li.name}"> 
                                    <img src="${li.pic_url}"> </a>
                                </div>
                                <div class="goods_name">
                                	<a href="http://b2b2c.wygk.cn/mobile/goods.php?id=137" title="${li.name}">${li.name}</a>
                              	</div>
                                <div class="price">
                                    <%-- 加入购物车图标 
                                    <a href="javascript:addToCart(137)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a> --%>
                                    <span>${li.period_amt}</span><em>${li.sales_amt}</em>
                                </div>
                            </div>
                        </li>
                    <c:if test="${status.count%3 ==0 || recommendList.size()==status.count}">
                    	</ul>
                    </c:if>
                </c:forEach>
                </div>
            </div>
            <div class="hd">
                <ul>
                    <li class="on">1</li>
                    <li class="">2</li>
                </ul>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        TouchSlide({
            slideCell: "#scroll_promotion",
            titCell: ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
            effect: "leftLoop",
            autoPage: true, //自动分页
            //switchLoad:"_src" //切换加载，真实图片路径为"_src"
        });
    </script>
    </c:if>

	
	<c:if test="${recommendList.size()>0 }">
    <section class="index_floor">
        <h4><span>店长推荐</span><i><a href="http://b2b2c.wygk.cn/mobile/search.php?intro=new">更多</a></i></h4>

        <div id="scroll_new" class="scroll_hot">
            <div class="tempWrap" style="overflow:hidden; position:relative;">
                <div class="bd" style="width: 1368px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms; transform: translate(-342px, 0px) translateZ(0px);">
                <c:forEach items="${recommendList}" var="li" varStatus="status">
                	<c:if test="${status.count%3 == 1}">
                    	<ul style="display: table-cell; vertical-align: top; width: 342px;">
                    </c:if>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="<%=path%>/phoneFront/detail?id=${li.id}" title="${li.name}"> 
                                    <img src="${li.pic_url}"> </a>
                                </div>
                                <div class="goods_name">
                                	<a href="http://b2b2c.wygk.cn/mobile/goods.php?id=137" title="${li.name}">${li.name}</a>
                              	</div>
                                <div class="price">
                                    <%-- 加入购物车图标 
                                    <a href="javascript:addToCart(137)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a> --%>
                                    <span>${li.period_amt}</span><em>${li.sales_amt}</em>
                                </div>
                            </div>
                        </li>
                    <c:if test="${status.count%3 ==0 || recommendList.size()==status.count}">
                    	</ul>
                    </c:if>
                </c:forEach>
                </div>
            </div>
            <div class="hd">
                <ul>
                    <li class="on">1</li>
                    <li class="">2</li>
                </ul>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        TouchSlide({
            slideCell: "#scroll_new",
            titCell: ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
            effect: "leftLoop",
            autoPage: true, //自动分页
            //switchLoad:"_src" //切换加载，真实图片路径为"_src"
        });
    </script>
    </c:if>

    <div class="index_img">
    </div>

    <section class="floor_body">
        <h4><span>热销商品</span><i><a href="http://b2b2c.wygk.cn/mobile/category.php?id=5">更多</a></i></h4>
        <div style=" background:#eeeeee">
        	<c:forEach items="${hotList}" var="li" varStatus="status">
               	<c:if test="${status.count%3 == 1}">
                	<ul>
                </c:if>
                <li>
                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="<%=path%>/phoneFront/detail?id=${li.id}" title="${li.name}">
                            	<img src="${li.pic_url}">
                           	</a>
                        </div>
                        <div class="goods_name">
                        	<a href="<%=path%>/phoneFront/detail?id=${li.id}" title="${li.name}">${li.name}</a>
                        </div>
                        <div class="price">
                        	<%-- 加入购物车图标 
                            <a href="javascript:addToCart(283)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png">
                            </a> --%>
                            <span>${li.period_amt}</span><em>${li.sales_amt}</em>
                        </div>
                    </div>
                </li>
            <c:if test="${status.count%3 ==0 || recommendList.size()==status.count}">
            	</ul>
            </c:if>
            </c:forEach>
        </div>
    </section>

    <div id="index_banner" class="index_banner">
        <div class="bd">
            <ul>
            </ul>
        </div>
        <div class="hd">
            <ul></ul>
        </div>
    </div>
    <script type="text/javascript">
        TouchSlide({
            slideCell: "#index_banner",
            titCell: ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
            mainCell: ".bd ul",
            effect: "leftLoop",
            autoPage: true,//自动分页
            autoPlay: true //自动播放
        });
    </script>


    <div style="height:50px; line-height:50px; clear:both;"></div>
    <div class="v_nav">
        <div class="vf_nav">
            <ul>
                <li><a href="http://b2b2c.wygk.cn/mobile/">
                    <i class="vf_1"></i>
                    <span>首页</span></a></li>
                <li>
                    <a href="http://b2b2c.wygk.cn/mobile/flow.php">
                        <em class="global-nav__nav-shop-cart-num" id="ECS_CARTINFO" style="right:9px;"> 1 </em>
                        <i class="vf_4"></i>
                        <span>购物车</span>
                    </a></li>
                <li><a href="http://b2b2c.wygk.cn/mobile/user.php">
                    <i class="vf_5"></i>
                    <span>我的</span></a></li>
            </ul>
        </div>
    </div>


    <script type="text/javascript" src="<%=basePath%>js/phoneFront/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/phoneFront/jquery.json.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/phoneFront/transport.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/phoneFront/touchslider.dev.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/phoneFront/jquery.more.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/phoneFront/common.js"></script>
    <script type="text/javascript">
        var url = 'index_bestgoods.php?act=ajax';
        $(function () {
            $('#J_ItemList').more({'address': url});
        });
    </script>
    <script>
        function goTop() {
            $('html,body').animate({'scrollTop': 0}, 600);
        }
    </script>
    <a href="javascript:goTop();" class="gotop"><img src="<%=basePath%>img/phoneFront/topup.png"></a>
    <script type="Text/Javascript" language="JavaScript">
        function selectPage(sel) {
            sel.form.submit();
        }
    </script>
    <script type="text/javascript">
        var button_compare = "";
        var exist = "您已经选择了%s";
        var count_limit = "最多只能选择4个商品进行对比";
        var goods_type_different = "\"%s\"和已选择商品类型不同无法进行对比";
        var compare_no_goods = "您没有选定任何需要比较的商品或者比较的商品数少于 2 个。";
        var btn_buy = "购买";
        var is_cancel = "取消";
        var select_spe = "请选择商品属性";
    </script>
</div>

</body>
</html>