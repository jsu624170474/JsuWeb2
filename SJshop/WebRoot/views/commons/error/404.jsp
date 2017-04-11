<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>页面出错啦</title>
    <style>

        html, body, div, span, applet, object, iframe,
        h1, h2, h3, h4, h5, h6, p, blockquote, pre,
        a, abbr, acronym, address, big, cite, code,
        del, dfn, em, img, ins, kbd, q, s, samp,
        small, strike, strong, sub, sup, tt, var,
        b, u, i, center,
        dl, dt, dd, ol, ul, li,
        fieldset, form, label, legend,
        table, caption, tbody, tfoot, thead, tr, th, td,
        article, aside, canvas, details, embed,
        figure, figcaption, footer, header, hgroup,
        menu, nav, output, ruby, section, summary,
        time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }

        /* HTML5 display-role reset for older browsers */
        article, aside, details, figcaption, figure,
        footer, header, hgroup, menu, nav, section {
            display: block;
        }

        ol, ul, li {
            list-style: none;
        }

        a {
            text-decoration: none;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }

        blockquote, q {
            quotes: none;
        }

        blockquote:before, blockquote:after,
        q:before, q:after {
            content: '';
            content: none;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        .clearfix:after {
            visibility: hidden;
            display: block;
            font-size: 0;
            content: " ";
            clear: both;
            height: 0;
        }

        .clearfix {
            *zoom: 1;
        }

        .fl {
            float: left;
        }

        .fr {
            float: right;
        }

        body {
            font-family: "microsoft yahei", Verdana, Arial, sans-serif, "Times New Roman", '宋体', simsun;
            background: #fafafa;
            height: 100vh;
            position: relative;
        }
        .mainwarp{
            height: 265px;
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
        }
        .imgbox {
            width: 50%;
            text-align: right;
        }

        .errorBox {
            width: 50%;
            padding-left: 74px;
            line-height: 1;
            box-sizing: border-box;
        }

        .errorBox header {
            font-size: 36px;
            color: #e2472c;
            margin-top: 50px;
        }

        .errorBox footer {
            font-size: 24px;
            color: #666;
            margin: 20px 0;;
        }
        .retHref{
            display: inline-block;
            text-align: center;
            width: 120px;
            height: 50px;
            line-height: 50px;
            font-size: 20px;
            background: #e3482d;
            color: #fff;
            font-size: 20px;
            border-radius: 4px;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="mainwarp clearfix">
    <div class="fl imgbox">
        <img src="<%=basePath%>img/error/error_page.png"/>
    </div>
    <div class="fr errorBox">
        <header>抱歉～页面没找到！</header>
        <footer>错误代码:404</footer>
        <%--<a href="<%=basePath%>" class="retHref">返回首页</a>--%>
    </div>
</div>
</body>
</html>