<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <span href="javascript:void(0)" class="logo">网软志成B2B2C多...</span></header>
    <script>
        var Tday = new Array();
        var daysms = 24 * 60 * 60 * 1000
        var hoursms = 60 * 60 * 1000
        var Secondms = 60 * 1000
        var microsecond = 1000
        var DifferHour = -1
        var DifferMinute = -1
        var DifferSecond = -1
        function clock(key) {
            var time = new Date()
            var hour = time.getHours()
            var minute = time.getMinutes()
            var second = time.getSeconds()
            var timevalue = "" + ((hour > 12) ? hour - 12 : hour)
            timevalue += ((minute < 10) ? ":0" : ":") + minute
            timevalue += ((second < 10) ? ":0" : ":") + second
            timevalue += ((hour > 12 ) ? " PM" : " AM")
            var convertHour = DifferHour
            var convertMinute = DifferMinute
            var convertSecond = DifferSecond
            var Diffms = Tday[key].getTime() - time.getTime()
            DifferHour = Math.floor(Diffms / daysms)
            Diffms -= DifferHour * daysms
            DifferMinute = Math.floor(Diffms / hoursms)
            Diffms -= DifferMinute * hoursms
            DifferSecond = Math.floor(Diffms / Secondms)
            Diffms -= DifferSecond * Secondms
            var dSecs = Math.floor(Diffms / microsecond)

            if (convertHour != DifferHour) a = DifferHour + ":";
            if (convertMinute != DifferMinute) b = DifferMinute + ":";
            if (convertSecond != DifferSecond) c = DifferSecond + ":";
            d = dSecs;
            if (DifferHour > 0) {
                a = a
            }
            else {
                a = ''
            }
            document.getElementById("jstimerBox" + key).innerHTML = a + b + c + d; //显示倒计时信息
        }
    </script>
    <section class="floor_body">
        <h4><span>促销商品</span><i><a href="http://b2b2c.wygk.cn/mobile/search.php?intro=promotion">更多</a></i></h4>
        <div id="scroll_promotion" style=" background:#eeeeee">
            <ul>
                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <div class="timerBox" id="jstimerBox0">21:15:18:3</div>

                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=227"
                               title="雅诚德Arst餐具套装56头套装中式碗碟套装陶瓷碗碟套装釉上彩"> <img
                                    src="./home_files/227_thumb_G_1437587283837.jpg"></a>
                        </div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=227"
                                                   title="雅诚德Arst餐具套装56头套装中式碗碟套装陶瓷碗碟套装釉上彩">雅诚德Arst餐具套装56头套装中式碗碟套装陶瓷碗碟套装釉上彩</a>
                        </div>
                        <div class="price">
                            <a href="javascript:addToCart(227)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>

                            <span>387</span><em>387</em>
                        </div>
                    </div>
                    <script>
                        Tday[0] = new Date("Jan 23, 2017 16:47:00");
                        window.setInterval(function () {
                            clock(0);
                        }, 1000);
                    </script>
                </li>

            </ul>
        </div>
    </section>


    <section class="index_floor">
        <h4><span>新品上市</span><i><a href="http://b2b2c.wygk.cn/mobile/search.php?intro=new">更多</a></i></h4>

        <div id="scroll_new" class="scroll_hot">
            <div class="tempWrap" style="overflow:hidden; position:relative;">
                <div class="bd"
                     style="width: 1368px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms; transform: translate(-342px, 0px) translateZ(0px);">
                    <ul style="display: table-cell; vertical-align: top; width: 342px;">
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=137"
                                       title="LOVO 罗莱家纺出品全棉斜纹床品套件四件套 兔斯基"> <img
                                            src="./home_files/137_thumb_G_1437528855059.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=137"
                                                           title="LOVO 罗莱家纺出品全棉斜纹床品套件四件套 兔斯基">LOVO 罗莱家纺出品全棉斜纹床品套件四件套
                                    兔斯基</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(137)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>339</span><em>479</em>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=140"
                                       title="雅鹿全棉四件套纯棉套件床上用品 回忆蓝 1.8米床"> <img
                                            src="./home_files/140_thumb_G_1437528915082.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=140"
                                                           title="雅鹿全棉四件套纯棉套件床上用品 回忆蓝 1.8米床">雅鹿全棉四件套纯棉套件床上用品 回忆蓝
                                    1.8米床</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(140)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>283</span><em>400</em>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=100"
                                       title="苹果（Apple）iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机"> <img
                                            src="./home_files/100_thumb_G_1437523484060.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=100"
                                                           title="苹果（Apple）iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机">苹果（Apple）iPhone
                                    6 (A1586) 16GB 金色 移动联通电信4G手机</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(100)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>4155</span><em>5000</em>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <ul style="display: table-cell; vertical-align: top; width: 342px;">
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=26"
                                       title="韩国进口X-5花生夹心巧克力棒盒装（24根）864g"> <img
                                            src="./home_files/26_thumb_G_1437505984631.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=26"
                                                           title="韩国进口X-5花生夹心巧克力棒盒装（24根）864g">韩国进口X-5花生夹心巧克力棒盒装（24根）864g</a>
                                </div>
                                <div class="price">
                                    <a href="javascript:addToCart(26)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>0</span><em>0</em>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=139" title="优雅100 经典设计款全棉斜纹印花四件套">
                                        <img src="./home_files/139_thumb_G_1437528892306.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=139"
                                                           title="优雅100 经典设计款全棉斜纹印花四件套">优雅100 经典设计款全棉斜纹印花四件套</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(139)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>161</span><em>227</em>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=173"
                                       title="Dior迪奥女士香水豪华礼物套装 礼盒套装*真我*甜心*魅惑各5ML"> <img
                                            src="./home_files/173_thumb_G_1437531646299.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=173"
                                                           title="Dior迪奥女士香水豪华礼物套装 礼盒套装*真我*甜心*魅惑各5ML">Dior迪奥女士香水豪华礼物套装
                                    礼盒套装*真我*甜心*魅惑各5ML</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(173)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>493</span><em>696</em>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <ul style="display: table-cell; vertical-align: top; width: 342px;">
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=137"
                                       title="LOVO 罗莱家纺出品全棉斜纹床品套件四件套 兔斯基"> <img
                                            src="./home_files/137_thumb_G_1437528855059.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=137"
                                                           title="LOVO 罗莱家纺出品全棉斜纹床品套件四件套 兔斯基">LOVO 罗莱家纺出品全棉斜纹床品套件四件套
                                    兔斯基</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(137)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>339</span><em>479</em>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=140"
                                       title="雅鹿全棉四件套纯棉套件床上用品 回忆蓝 1.8米床"> <img
                                            src="./home_files/140_thumb_G_1437528915082.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=140"
                                                           title="雅鹿全棉四件套纯棉套件床上用品 回忆蓝 1.8米床">雅鹿全棉四件套纯棉套件床上用品 回忆蓝
                                    1.8米床</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(140)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>283</span><em>400</em>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=100"
                                       title="苹果（Apple）iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机"> <img
                                            src="./home_files/100_thumb_G_1437523484060.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=100"
                                                           title="苹果（Apple）iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机">苹果（Apple）iPhone
                                    6 (A1586) 16GB 金色 移动联通电信4G手机</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(100)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>4155</span><em>5000</em>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <ul style="display: table-cell; vertical-align: top; width: 342px;">
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=26"
                                       title="韩国进口X-5花生夹心巧克力棒盒装（24根）864g"> <img
                                            src="./home_files/26_thumb_G_1437505984631.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=26"
                                                           title="韩国进口X-5花生夹心巧克力棒盒装（24根）864g">韩国进口X-5花生夹心巧克力棒盒装（24根）864g</a>
                                </div>
                                <div class="price">
                                    <a href="javascript:addToCart(26)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>0</span><em>0</em>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=139" title="优雅100 经典设计款全棉斜纹印花四件套">
                                        <img src="./home_files/139_thumb_G_1437528892306.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=139"
                                                           title="优雅100 经典设计款全棉斜纹印花四件套">优雅100 经典设计款全棉斜纹印花四件套</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(139)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>161</span><em>227</em>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=173"
                                       title="Dior迪奥女士香水豪华礼物套装 礼盒套装*真我*甜心*魅惑各5ML"> <img
                                            src="./home_files/173_thumb_G_1437531646299.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=173"
                                                           title="Dior迪奥女士香水豪华礼物套装 礼盒套装*真我*甜心*魅惑各5ML">Dior迪奥女士香水豪华礼物套装
                                    礼盒套装*真我*甜心*魅惑各5ML</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(173)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>493</span><em>696</em>
                                </div>
                            </div>
                        </li>
                    </ul>
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
    <section class="index_floor">
        <h4><span>热销商品</span><i><a href="http://b2b2c.wygk.cn/mobile/search.php?intro=hot">更多</a></i></h4>

        <div id="scroll_hot" class="scroll_hot">
            <div class="tempWrap" style="overflow:hidden; position:relative;">
                <div class="bd"
                     style="width: 1368px; position: relative; overflow: hidden; padding: 0px; margin: 0px; transition-duration: 200ms; transform: translate(-342px, 0px) translateZ(0px);">
                    <ul style="display: table-cell; vertical-align: top; width: 342px;">
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=274" title="可口可乐 碳酸饮料 汽水 1.25L">
                                        <img src="./home_files/274_thumb_G_1456453088662.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=274"
                                                           title="可口可乐 碳酸饮料 汽水 1.25L">可口可乐 碳酸饮料 汽水 1.25L</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(274)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>4</span><em>5</em>
                                </div>
                            </div>

                        </li>
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=281"
                                       title="卡贝 不锈钢户门吸15CM加长特长墙吸地碰门挡强磁现代家用五金 拉丝不锈钢">
                                        <img src="./home_files/281_thumb_G_1456453972506.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=281"
                                                           title="卡贝 不锈钢户门吸15CM加长特长墙吸地碰门挡强磁现代家用五金 拉丝不锈钢">卡贝
                                    不锈钢户门吸15CM加长特长墙吸地碰门挡强磁现代家用五金 拉丝不锈钢</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(281)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>33</span><em>46</em>
                                </div>
                            </div>

                        </li>
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=282"
                                       title="超B级锁芯防伪升级版 防盗门锁芯 防锡纸开门37.5+32.5=70mm">
                                        <img src="./home_files/282_thumb_G_1456454106731.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=282"
                                                           title="超B级锁芯防伪升级版 防盗门锁芯 防锡纸开门37.5+32.5=70mm">超B级锁芯防伪升级版 防盗门锁芯
                                    防锡纸开门37.5+32.5=70mm</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(282)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>110</span><em>154</em>
                                </div>
                            </div>

                        </li>
                    </ul>
                    <ul style="display: table-cell; vertical-align: top; width: 342px;">
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=140"
                                       title="雅鹿全棉四件套纯棉套件床上用品 回忆蓝 1.8米床">
                                        <img src="./home_files/140_thumb_G_1437528915082.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=140"
                                                           title="雅鹿全棉四件套纯棉套件床上用品 回忆蓝 1.8米床">雅鹿全棉四件套纯棉套件床上用品 回忆蓝
                                    1.8米床</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(140)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>283</span><em>400</em>
                                </div>
                            </div>

                        </li>
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=287"
                                       title="韩国原装进口lotte乐天 2%富足水蜜桃果汁饮料240ml听装 夏季饮料">
                                        <img src="./home_files/287_thumb_G_1457592139010.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=287"
                                                           title="韩国原装进口lotte乐天 2%富足水蜜桃果汁饮料240ml听装 夏季饮料">韩国原装进口lotte乐天
                                    2%富足水蜜桃果汁饮料240ml听装 夏季饮料</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(287)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>5</span><em>6</em>
                                </div>
                            </div>

                        </li>
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=283"
                                       title="好事达家用梯子四步梯加厚梯子折叠梯移动扶梯人字梯2766">
                                        <img src="./home_files/_thumb_P_1457590880591.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=283"
                                                           title="好事达家用梯子四步梯加厚梯子折叠梯移动扶梯人字梯2766">好事达家用梯子四步梯加厚梯子折叠梯移动扶梯人字梯2766</a>
                                </div>
                                <div class="price">
                                    <a href="javascript:addToCart(283)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>2</span><em>2</em>
                                </div>
                            </div>

                        </li>
                    </ul>
                    <ul style="display: table-cell; vertical-align: top; width: 342px;">
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=274" title="可口可乐 碳酸饮料 汽水 1.25L">
                                        <img src="./home_files/274_thumb_G_1456453088662.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=274"
                                                           title="可口可乐 碳酸饮料 汽水 1.25L">可口可乐 碳酸饮料 汽水 1.25L</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(274)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>4</span><em>5</em>
                                </div>
                            </div>

                        </li>
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=281"
                                       title="卡贝 不锈钢户门吸15CM加长特长墙吸地碰门挡强磁现代家用五金 拉丝不锈钢">
                                        <img src="./home_files/281_thumb_G_1456453972506.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=281"
                                                           title="卡贝 不锈钢户门吸15CM加长特长墙吸地碰门挡强磁现代家用五金 拉丝不锈钢">卡贝
                                    不锈钢户门吸15CM加长特长墙吸地碰门挡强磁现代家用五金 拉丝不锈钢</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(281)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>33</span><em>46</em>
                                </div>
                            </div>

                        </li>
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=282"
                                       title="超B级锁芯防伪升级版 防盗门锁芯 防锡纸开门37.5+32.5=70mm">
                                        <img src="./home_files/282_thumb_G_1456454106731.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=282"
                                                           title="超B级锁芯防伪升级版 防盗门锁芯 防锡纸开门37.5+32.5=70mm">超B级锁芯防伪升级版 防盗门锁芯
                                    防锡纸开门37.5+32.5=70mm</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(282)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>110</span><em>154</em>
                                </div>
                            </div>

                        </li>
                    </ul>
                    <ul style="display: table-cell; vertical-align: top; width: 342px;">
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=140"
                                       title="雅鹿全棉四件套纯棉套件床上用品 回忆蓝 1.8米床">
                                        <img src="./home_files/140_thumb_G_1437528915082.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=140"
                                                           title="雅鹿全棉四件套纯棉套件床上用品 回忆蓝 1.8米床">雅鹿全棉四件套纯棉套件床上用品 回忆蓝
                                    1.8米床</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(140)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>283</span><em>400</em>
                                </div>
                            </div>

                        </li>
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=287"
                                       title="韩国原装进口lotte乐天 2%富足水蜜桃果汁饮料240ml听装 夏季饮料">
                                        <img src="./home_files/287_thumb_G_1457592139010.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=287"
                                                           title="韩国原装进口lotte乐天 2%富足水蜜桃果汁饮料240ml听装 夏季饮料">韩国原装进口lotte乐天
                                    2%富足水蜜桃果汁饮料240ml听装 夏季饮料</a></div>
                                <div class="price">
                                    <a href="javascript:addToCart(287)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>5</span><em>6</em>
                                </div>
                            </div>

                        </li>
                        <li>

                            <div class="index_pro">
                                <div class="products_kuang">
                                    <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=283"
                                       title="好事达家用梯子四步梯加厚梯子折叠梯移动扶梯人字梯2766">
                                        <img src="./home_files/_thumb_P_1457590880591.jpg"> </a></div>
                                <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=283"
                                                           title="好事达家用梯子四步梯加厚梯子折叠梯移动扶梯人字梯2766">好事达家用梯子四步梯加厚梯子折叠梯移动扶梯人字梯2766</a>
                                </div>
                                <div class="price">
                                    <a href="javascript:addToCart(283)" class="btns">
                                        <img src="<%=path%>/img/phoneFront/index_flow.png">
                                    </a>
                                    <span>2</span><em>2</em>
                                </div>
                            </div>

                        </li>
                    </ul>
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
            slideCell: "#scroll_hot",
            titCell: ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
            effect: "leftLoop",
            autoPage: true, //自动分页
            //switchLoad:"_src" //切换加载，真实图片路径为"_src"
        });
    </script>


    <div class="index_img">


    </div>

    <section class="floor_body">
        <h4><span>家用电器</span><i><a href="http://b2b2c.wygk.cn/mobile/category.php?id=5">更多</a></i></h4>
        <div style=" background:#eeeeee">
            <ul>
                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=283" title="好事达家用梯子四步梯加厚梯子折叠梯移动扶梯人字梯2766"><img
                                    src="./home_files/_thumb_P_1457590880591.jpg"></a></div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=283"
                                                   title="好事达家用梯子四步梯加厚梯子折叠梯移动扶梯人字梯2766">好事达家用梯子四步梯加厚梯子折叠梯移动扶梯人字梯2766</a>
                        </div>
                        <div class="price">
                            <a href="javascript:addToCart(283)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>
                            <span>2</span><em>2</em>
                        </div>
                    </div>

                </li>


                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=282"
                               title="超B级锁芯防伪升级版 防盗门锁芯 防锡纸开门37.5+32.5=70mm"><img
                                    src="./home_files/282_thumb_G_1456454106731.jpg"></a></div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=282"
                                                   title="超B级锁芯防伪升级版 防盗门锁芯 防锡纸开门37.5+32.5=70mm">超B级锁芯防伪升级版 防盗门锁芯
                            防锡纸开门37.5+32.5=70mm</a></div>
                        <div class="price">
                            <a href="javascript:addToCart(282)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>
                            <span>110</span><em>154</em>
                        </div>
                    </div>

                </li>


                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=281"
                               title="卡贝 不锈钢户门吸15CM加长特长墙吸地碰门挡强磁现代家用五金 拉丝不锈钢"><img
                                    src="./home_files/281_thumb_G_1456453972506.jpg"></a></div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=281"
                                                   title="卡贝 不锈钢户门吸15CM加长特长墙吸地碰门挡强磁现代家用五金 拉丝不锈钢">卡贝
                            不锈钢户门吸15CM加长特长墙吸地碰门挡强磁现代家用五金 拉丝不锈钢</a></div>
                        <div class="price">
                            <a href="javascript:addToCart(281)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>
                            <span>33</span><em>46</em>
                        </div>
                    </div>

                </li>

            </ul>
            <ul>

                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=280"
                               title="宝雕 欧式双舌静音象牙白室内房门锁M87457 象牙白宝雕"><img
                                    src="./home_files/280_thumb_G_1456453887329.jpg"></a></div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=280"
                                                   title="宝雕 欧式双舌静音象牙白室内房门锁M87457 象牙白宝雕">宝雕 欧式双舌静音象牙白室内房门锁M87457
                            象牙白宝雕</a></div>
                        <div class="price">
                            <a href="javascript:addToCart(280)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>
                            <span>84</span><em>119</em>
                        </div>
                    </div>

                </li>


                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=279" title="固特 304不锈钢门吸 墙地吸 3408"><img
                                    src="./home_files/279_thumb_G_1456453803305.jpg"></a></div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=279"
                                                   title="固特 304不锈钢门吸 墙地吸 3408">固特 304不锈钢门吸 墙地吸 3408</a></div>
                        <div class="price">
                            <a href="javascript:addToCart(279)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>
                            <span>24</span><em>33</em>
                        </div>
                    </div>

                </li>


                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=278" title="西门子开关插座面板 悦动白墙壁二位双控带荧光开关"><img
                                    src="./home_files/278_thumb_G_1456453661817.jpg"></a></div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=278"
                                                   title="西门子开关插座面板 悦动白墙壁二位双控带荧光开关">西门子开关插座面板 悦动白墙壁二位双控带荧光开关</a></div>
                        <div class="price">
                            <a href="javascript:addToCart(278)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>
                            <span>18</span><em>25</em>
                        </div>
                    </div>

                </li>

            </ul>
            <ul>

                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=277" title="西门子开关插座面板 悦动白墙壁一开双控带荧光面板"><img
                                    src="./home_files/277_thumb_G_1456453595148.jpg"></a></div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=277"
                                                   title="西门子开关插座面板 悦动白墙壁一开双控带荧光面板">西门子开关插座面板 悦动白墙壁一开双控带荧光面板</a></div>
                        <div class="price">
                            <a href="javascript:addToCart(277)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>
                            <span>14</span><em>19</em>
                        </div>
                    </div>

                </li>


                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=276"
                               title="鸿雁 六位+三位 ZDP61G3T3/D 3m+ZDP31G3/D 1.5m"><img
                                    src="./home_files/276_thumb_G_1456453511434.jpg"></a></div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=276"
                                                   title="鸿雁 六位+三位 ZDP61G3T3/D 3m+ZDP31G3/D 1.5m">鸿雁 六位+三位 ZDP61G3T3/D
                            3m+ZDP31G3/D 1.5m</a></div>
                        <div class="price">
                            <a href="javascript:addToCart(276)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>
                            <span>33</span><em>46</em>
                        </div>
                    </div>

                </li>


                <li>

                    <div class="index_pro">
                        <div class="products_kuang">
                            <a href="http://b2b2c.wygk.cn/mobile/goods.php?id=128"
                               title="Gree/格力 KFR-72LW/(72596)FNAa-A3 变频3P立式柜机空调 Q铂"><img
                                    src="./home_files/128_thumb_G_1437526271316.jpg"></a></div>
                        <div class="goods_name"><a href="http://b2b2c.wygk.cn/mobile/goods.php?id=128"
                                                   title="Gree/格力 KFR-72LW/(72596)FNAa-A3 变频3P立式柜机空调 Q铂">Gree/格力
                            KFR-72LW/(72596)FNAa-A3 变频3P立式柜机空调 Q铂</a></div>
                        <div class="price">
                            <a href="javascript:addToCart(128)" class="btns">
                                <img src="<%=path%>/img/phoneFront/index_flow.png"></a>
                            <span>5440</span><em>7680</em>
                        </div>
                    </div>

                </li>


            </ul>
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