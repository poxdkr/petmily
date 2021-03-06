<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Main Page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="resources/cssMain/css/bootstrap.min.css">
        <!--        <link rel="stylesheet" href="resources/cssMain/css/bootstrap-theme.min.css">-->


        <!--For Plugins external css-->
        <link rel="stylesheet" href="resources/cssMain/css/plugins.css" />
        <link rel="stylesheet" href="resources/cssMain/css/roboto-webfont.css" />

        <!--Theme custom css -->
        <link rel="stylesheet" href="resources/cssMain/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="resources/cssMain/css/responsive.css" />

        <script src="resources/cssMain/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
<body>
<nav class="navbar navbar-default">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			
			<!-- 로고 넣는 자리 이미지 빼고 다른거 넣기  -->
			<a class="navbar-brand" href="#"><img
				src="resources/cssMain/images/logo.png" alt="Logo" /></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#home">Home</a></li>
				<li><a href="#features">members</a></li>
				<li><a href="faqList.jsp">customerservice</a></li>
				<li><a href="#price">advertisement</a></li>
				<li class="login"><a href="#">Logout</a></li>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

 <section id="service" class="service2 sections lightbg">
            <div class="container">
                <div class="row">
                    <div class="main_service2">
                        <div class="head_title text-center">
                            <h2>Petmily Mangement</h2>
                      
                        </div>

                        <div class="service_content">
                                 <div class="row">
				                    <div class="portfolio-wrapper2 text-center">
				                        <div class="col-md-3 col-sm-6 col-xs-12">
				                            <div class="community-edition">
				                                <i class="fa fa-book"></i>
				                                <div class="separator"></div>
				                                <h4>Advertisement</h4>
				                                
				                            </div>
				                        </div>
				
				                        <div class="col-md-3 col-sm-6 col-xs-12">
				                            <div class="community-edition">
				                                <i class="fa fa-gears"></i>
				                                <div class="separator"></div>
				                                <h4>Memvers</h4>
				                                
				                            </div>
				                        </div>
				
				                        <div class="col-md-3 col-sm-6 col-xs-12" onclick="location.href='faqList.jsp'">
				                            <div class="community-edition">
				                                <i class="fa fa-paper-plane-o"></i>
				                                <div class="separator"></div>
				                                <h4>Customer Service</h4>
				                                
				                            </div>
				                        </div>
				
				                        <div class="col-md-3 col-sm-6 col-xs-12">
				                            <div class="community-edition">
				                                <i class="fa fa-folder-open"></i>
				                                <div class="separator"></div>
				                                <h4>Community Edition</h4>
				                                
				                            </div>
				                        </div>
				
				                    </div>
				                </div> 
                            
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section id="footer-menu" class="sections footer-menu">
            <div class="container">
                <div class="row">
                    <div class="footer-menu-wrapper">

                        <div class="col-md-8 col-sm-12 col-xs-12">
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <div class="menu-item">
                                    <h5>Quick Links</h5>
                                    <ul>
                                        <li>POWER BI DESKTOP</li>
                                        <li>MOBILE</li>
                                        <li>SEE ALL DOWNLOADS</li>
                                        <li>POWER BI DESKTOP</li>
                                        <li>MOBILE</li>
                                        <li>SEE ALL DOWNLOADS</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <div class="menu-item">
                                    <h5>Legal</h5>
                                    <ul>
                                        <li>PRIVACY & COOKIES</li>
                                        <li>TERMS OF USE</li>
                                        <li>TRADEMARKS</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <div class="menu-item">
                                    <h5>Information</h5>
                                    <ul>
                                        <li>SUPPORT</li>
                                        <li>DEVELOPERS</li>
                                        <li>BLOG</li>
                                        <li>NEWSLETTER</li>
                                        <li>PYRAMID ANALYTICS</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="menu-item">
                                <h5>Newsletter</h5>
                                <p>Insights await in your company's data. Bring them into focus with BlueLance.</p>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Enter your email address">
                                    <input type="submit" class="form-control" value="Use It Free">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>


        <!--Footer-->
        <footer id="footer" class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-wrapper">

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="footer-brand">
                                <img src="resources/cssMain/images/logo.png" alt="logo" />
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="copyright">
                                <p>Made with <i class="fa fa-heart"></i> by <a target="_blank" href="http://bootstrapthemes.co"> Bootstrap Themes </a>2016. All rights reserved.</p>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </footer>
		
		
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>

		
        <script src="resources/cssMain/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="resources/cssMain/js/vendor/bootstrap.min.js"></script>

        <script src="resources/cssMain/js/plugins.js"></script>
        <script src="resources/cssMain/js/modernizr.js"></script>
        <script src="resources/cssMain/js/main.js"></script>

</body>
</html>