<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String pathEnd = request.getContextPath();
%>
<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="widget">
					<h5 class="widgetheading">联系方式</h5>
					<address>
					<strong></strong><br>
					湖北省武汉市洪山区团结大道</address>
					<p>
						<i class="icon-phone"></i> 18810000000 <br>
					</p>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="widget">
					<h5 class="widgetheading"><a href="https://weidian.com/?userid=334028636" target="blank">我的微店</a>	</h5>
					<div>
						<img alt="扫描二维码进入微店" style="width: 150px;height: 150px;"
							src="<%=request.getContextPath()%>/static/frontEnd/image/myinfo/weidian2.jpg">
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="widget">
					<h5 class="widgetheading">微信</h5>
					<div>
						<img style="width: 150px;height: 150px;"
							src="<%=request.getContextPath()%>/static/frontEnd/image/myinfo/weixin.jpg">
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="widget">
					<h5 class="widgetheading">友情链接</h5>
					<ul class="link-list">
						<li><!-- <a href="http://www.html5code.net/demo/616/index.html#"> -->美味人生</li>
						<li><a >水果店</a></li>
						<li><a >干果店</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="sub-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="copyright">
						<p>
							@2017 | 发发 | <a target="_blank" href="<%=pathEnd%>/">歌剧院法式西点</a>
						</p>
					</div>
				</div>
				<!-- <div class="col-lg-6">
					<ul class="social-network">
						<li><a href="http://www.html5code.net/demo/616/index.html#" data-placement="top" title="" data-original-title="Facebook"><i class="fa fa-facebook"></i></a></li>
						<li><a href="http://www.html5code.net/demo/616/index.html#" data-placement="top" title="" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></li>
						<li><a href="http://www.html5code.net/demo/616/index.html#" data-placement="top" title="" data-original-title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="http://www.html5code.net/demo/616/index.html#" data-placement="top" title="" data-original-title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="http://www.html5code.net/demo/616/index.html#" data-placement="top" title="" data-original-title="Google plus"><i class="fa fa-google-plus"></i></a></li>
					</ul>
				</div> -->
			</div>
		</div>
	</div>
	</footer>
