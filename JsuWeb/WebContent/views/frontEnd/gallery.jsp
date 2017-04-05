<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/views/frontEnd/commons/commons.jsp"%>
<body>
<div id="wrapper">
	<!-- 菜单 -->
	<%@include file="/views/frontEnd/commons/commonsBegin.jsp"%>

	<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Gallery</h2>
			</div>
		</div>
	</div>
	</section>
	<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="portfolio-categ filter">
					<li class="all active"><a href="http://www.html5code.net/demo/616/gallery.html#">All</a></li>
					<li class="web"><a href="http://www.html5code.net/demo/616/gallery.html#" title="">Continental</a></li>
					<li class="icon"><a href="http://www.html5code.net/demo/616/gallery.html#" title="">Asian Food</a></li>
					<li class="graphic"><a href="http://www.html5code.net/demo/616/gallery.html#" title="">Italian Food</a></li>
				</ul>
				<div class="clearfix">
				</div>
				<div class="row">
					<section id="projects">
					<ul id="thumbs" class="portfolio">
						<!-- Item Project and Filter Name -->
						<li class="item-thumbs col-lg-3 design" data-id="id-0" data-type="web">
						<!-- Fancybox - Gallery Enabled - Title - Full Image -->
						<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Portfolio name" href="<%=path%>/static/frontEnd/image/gallery/1.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-search"></i></span>
						</a>
						<!-- Thumb Image and Description -->
						<img src="<%=path%>/static/frontEnd/image/gallery/1.jpg" alt="">
						</li>
						<!-- End Item Project -->
						<!-- Item Project and Filter Name -->
						<li class="item-thumbs col-lg-3 design" data-id="id-1" data-type="icon">
						<!-- Fancybox - Gallery Enabled - Title - Full Image -->
						<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Portfolio name" href="<%=path%>/static/frontEnd/image/gallery/2.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-search"></i></span>
						</a>
						<!-- Thumb Image and Description -->
						<img src="<%=path%>/static/frontEnd/image/gallery/2.jpg" alt="">
						</li>
						<!-- End Item Project -->
						<!-- Item Project and Filter Name -->
						<li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="graphic">
						<!-- Fancybox - Gallery Enabled - Title - Full Image -->
						<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Portfolio name" href="<%=path%>/static/frontEnd/image/gallery/3.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-search"></i></span>
						</a>
						<!-- Thumb Image and Description -->
						<img src="<%=path%>/static/frontEnd/image/gallery/3.jpg" alt="">
						</li>
						<!-- End Item Project -->
						<!-- Item Project and Filter Name -->
						<li class="item-thumbs col-lg-3 design" data-id="id-0" data-type="web">
						<!-- Fancybox - Gallery Enabled - Title - Full Image -->
						<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Portfolio name" href="<%=path%>/static/frontEnd/image/gallery/4.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-search"></i></span>
						</a>
						<!-- Thumb Image and Description -->
						<img src="<%=path%>/static/frontEnd/image/gallery/4.jpg" alt="">
						</li>
						<!-- End Item Project -->
						<!-- Item Project and Filter Name -->
						<li class="item-thumbs col-lg-3 photography" data-id="id-4" data-type="web">
						<!-- Fancybox - Gallery Enabled - Title - Full Image -->
						<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Portfolio name" href="<%=path%>/static/frontEnd/image/gallery/5.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-search"></i></span>
						</a>
						<!-- Thumb Image and Description -->
						<img src="<%=path%>/static/frontEnd/image/gallery/5.jpg" alt="">
						</li>
						<!-- End Item Project -->
						<!-- Item Project and Filter Name -->
						<li class="item-thumbs col-lg-3 photography" data-id="id-5" data-type="icon">
						<!-- Fancybox - Gallery Enabled - Title - Full Image -->
						<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Portfolio name" href="<%=path%>/static/frontEnd/image/gallery/6.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-search"></i></span>
						</a>
						<!-- Thumb Image and Description -->
						<img src="<%=path%>/static/frontEnd/image/gallery/6.jpg" alt="">
						</li>
						<!-- End Item Project -->
						<li class="item-thumbs col-lg-3 design" data-id="id-0" data-type="web">
						<!-- Fancybox - Gallery Enabled - Title - Full Image -->
						<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Portfolio name" href="<%=path%>/static/frontEnd/image/gallery/7.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-search"></i></span>
						</a>
						<!-- Thumb Image and Description -->
						<img src="<%=path%>/static/frontEnd/image/gallery/7.jpg" alt="">
						</li>
						<!-- End Item Project -->
						<!-- Item Project and Filter Name -->
						<li class="item-thumbs col-lg-3 design" data-id="id-0" data-type="graphic">
						<!-- Fancybox - Gallery Enabled - Title - Full Image -->
						<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Portfolio name" href="<%=path%>/static/frontEnd/image/gallery/8.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-search"></i></span>
						</a>
						<!-- Thumb Image and Description -->
						<img src="<%=path%>/static/frontEnd/image/gallery/8.jpg" alt="">
						</li>
						<!-- End Item Project -->
					</ul>
					</section>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	 <!-- 底部 -->
	<%@include file="/views/frontEnd/commons/commonsEnd.jsp"%>
</div>

</body></html>