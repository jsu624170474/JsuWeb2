<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/views/frontEnd/commons/commons.jsp"%>
<body>
<div id="wrapper" class="home-page">
	<!-- 菜单 -->
	<%@include file="/views/frontEnd/commons/commonsBegin.jsp"%>

	<section id="banner">
	 
	<!-- Slider -->
        <div id="main-slider" class="flexslider">
            <ul class="slides">
              <li class="" style="width: 100%; float: left; margin-right: -100%; position: relative; display: none;">
                <img src="<%=path%>/static/frontEnd/image/1.jpg" alt="">
                <div class="flex-caption container">
                    <h3>Family Restaurant</h3> 
					<p>Doloribus omnis minus temporibus perferendis ipsa</p>  
                </div>
              </li>
              <li class="flex-active-slide" style="width: 100%; float: left; margin-right: -100%; position: relative; display: list-item;">
                <img src="<%=path%>/static/frontEnd/image/2.jpg" alt="">
                <div class="flex-caption container">
                    <h3>Best in class service</h3> 
<p>Doloribus omnis minus temporibus perferendis ipsa</p>  					
                </div>
              </li>
            </ul>
        <ol class="flex-control-nav flex-control-paging"><li><a class="">1</a></li><li><a class="flex-active">2</a></li></ol><ul class="flex-direction-nav"><li><a class="flex-prev" href="http://www.html5code.net/demo/616/index.html#">Previous</a></li><li><a class="flex-next" href="http://www.html5code.net/demo/616/index.html#">Next</a></li></ul></div>
	<!-- end slider -->
 
	</section>
	<section class="txt-area">
	<div class="container">
	
	</div>
	</section>
	
	
		<section class="aboutUs">
	<div class="container">
			<div class="row">
			<div class="col-lg-12">
				<div class="aligncenter"><h1 class="aligncenter">Hello, Welcome!</h1>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores quae porro consequatur aliquam, incidunt eius magni provident, doloribus omnis minus temporibus perferendis nesciunt quam repellendus nulla nemo ipsum odit corrupti consequuntur possimus.</div> <br><br>
				
			</div>
		</div>
		<div class="row">
							<div class="col-md-6">
								<img src="<%=path%>/static/frontEnd/image/img1.png" alt="">
								<div class="space"></div>
							</div>
							<div class="col-md-6">
								<p>Lorem ipsum dolor sit amet, cadipisicing  sit amet, consectetur adipisicing elit. Atque sed, quidem quis praesentium, ut unde fuga error commodi architecto, oribus omnis minus autem nemo numquam, ipsa architecto non. magni consequuntlaudantium culpa tenetur at id, beatae pet.</p>
								<p>Lorem ipsum dolor sit amet, cadipisicing  sit amet, consectetur adipisicing elit. Atque sed, quidem quis praesentium, ut unde fuga error commodi architecto, oribus omnis minus autem nemo numquam, ipsa architecto non. magni consequuntlaudantium culpa tenetur at id, beatae pet.</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. adipisicing  sit amet, consectetur adipisicing elit. Atque sed, quidem quis praesentium,m deserunt.</p>
								<ul class="list-unstyled">
									<li><i class="fa fa-arrow-circle-right pr-10 colored"></i> Lorem ipsum enimdolor sit amet</li>
									<li><i class="fa fa-arrow-circle-right pr-10 colored"></i> Explicabo deleniti neque aliquid</li>
									<li><i class="fa fa-arrow-circle-right pr-10 colored"></i> Consectetur adipisicing elit</li>
									<li><i class="fa fa-arrow-circle-right pr-10 colored"></i> Lorem ipsum dolor sit amet</li>
									<li><i class="fa fa-arrow-circle-right pr-10 colored"></i> Quo issimos molest quibusdam temporibus</li>
								</ul>
							</div>
						</div>
	
	</div>
	</section>
	<section id="services">
	
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="aligncenter"><h1 class="aligncenter">Our Services</h1>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores quae porro consequatur aliquam, incidunt eius magni provident, doloribus omnis minus temporibus perferendis nesciunt quam repellendus nulla nemo ipsum odit corrupti consequuntur possimus.</div>
				
			</div>
		</div>
		<div class="row">
                <div class="features">
                    <div class="col-md-4 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="0ms" style="visibility: visible; -webkit-animation-duration: 300ms; -webkit-animation-delay: 0ms;">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img src="<%=path%>/static/frontEnd/image/1.png" alt="">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Salad</h4>
                                <p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>
                            </div>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="100ms" style="visibility: visible; -webkit-animation-duration: 300ms; -webkit-animation-delay: 100ms;">
                        <div class="media service-box">
                            <div class="pull-left">
                                 <img src="<%=path%>/static/frontEnd/image/2.png" alt="">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Breakfast</h4>
                                <p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>
                            </div>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="200ms" style="visibility: visible; -webkit-animation-duration: 300ms; -webkit-animation-delay: 200ms;">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img src="<%=path%>/static/frontEnd/image/3.png" alt="">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Lunch</h4>
                                <p>Morbi vitae tortor tempus, placerat leo et, suscipit lectus. Phasellus ut euismod massa, eu eleifend ipsum.</p>
                            </div>
                        </div>
                    </div><!--/.col-md-4-->
                
                    <div class="col-md-4 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="300ms" style="visibility: visible; -webkit-animation-duration: 300ms; -webkit-animation-delay: 300ms;">
                        <div class="media service-box">
                            <div class="pull-left">
                                 <img src="<%=path%>/static/frontEnd/image/4.png" alt="">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Dinner</h4>
                                <p>Morbi vitae tortor tempus, placerat leo et, suscipit lectus. Phasellus ut euismod massa, eu eleifend ipsum.</p>
                            </div>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="400ms" style="visibility: visible; -webkit-animation-duration: 300ms; -webkit-animation-delay: 400ms;">
                        <div class="media service-box">
                            <div class="pull-left">
                                 <img src="<%=path%>/static/frontEnd/image/5.png" alt="">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Drinks</h4>
                                <p>Morbi vitae tortor tempus, placerat leo et, suscipit lectus. Phasellus ut euismod massa, eu eleifend ipsum.</p>
                            </div>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="500ms" style="visibility: visible; -webkit-animation-duration: 300ms; -webkit-animation-delay: 500ms;">
                        <div class="media service-box">
                            <div class="pull-left">
                                <img src="<%=path%>/static/frontEnd/image/7.png" alt="">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Party</h4>
                                <p>Morbi vitae tortor tempus, placerat leo et, suscipit lectus. Phasellus ut euismod massa, eu eleifend ipsum.</p>
                            </div>
                        </div>
                    </div><!--/.col-md-4-->
                </div>
            </div>	 
	 

	</div>
	
	</section>
	
	 <!-- 底部 -->
	<%@include file="/views/frontEnd/commons/commonsEnd.jsp"%>
</div>
<a href="http://www.html5code.net/demo/616/index.html#" class="scrollup" style="display: none;"><i class="fa fa-angle-up active"></i></a>

</body></html>