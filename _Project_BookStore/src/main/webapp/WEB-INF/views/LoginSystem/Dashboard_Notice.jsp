<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">		
		<title>Gambo - My Wishlist</title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="images/fav.png">
		
		<!-- Stylesheets -->
		<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
		<link href="css/style.css" rel="stylesheet">
		<link href="css/responsive.css" rel="stylesheet">
		<link href="css/night-mode.css" rel="stylesheet">
		<link href="css/step-wizard.css" rel="stylesheet">
		
		<!-- Vendor Stylesheets -->
		<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">	
		
	</head>

<body>
<c:set var="funcName" value="Notice" scope="session"/>
<jsp:include page="/fragment/topMVC.jsp" />
<!-- 	<!-- Body Start --> 
	<div class="wrapper">
		<div class="gambo-Breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">User Dashboard</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="dashboard-group">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="user-dt">
							<div class="user-img">
								<img src="images/avatar/img-5.jpg" alt="">
								<div class="img-add">													
									<input type="file" id="file">
									<label for="file"><i class="uil uil-camera-plus"></i></label>
								</div>
							</div>
							<h4> ${members.name}</h4>
							<p> ${members.phone}<a href="#"><i class="uil uil-edit"></i></a></p>
							<div class="earn-points"><img src="images/Dollar.svg" alt="">Points : <span>20</span></div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<div class="">
			<div class="container">
				<div class="row">
<%-- 					<jsp:include page="/fragment/leftMVC.jsp" /> --%>
					<div class="col-lg-3 col-md-4">
						<div class="left-side-tabs">
							<div class="dashboard-left-links">
								<a href="Dashboard_PersonInfo" class="user-item"><i class="uil uil-apps"></i>個人檔案</a>
								<a href="Dashboard_Credit" class="user-item"><i class="uil uil-wallet"></i>銀行帳戶/信用卡</a>
								<a href="Dashboard_Address" class="user-item"><i class="uil uil-location-point"></i>地址</a>
								<a href="Dashboard_ShoppingList" class="user-item"><i class="uil uil-box"></i>購物清單</a>
								<a href="Dashboard_Notice" class="user-item active"><i class="uil uil-gift"></i>通知</a>
								<a href="Dashboard_Marketing" class="user-item"><i class="uil uil-heart"></i>促銷</a>
								<a href="<c:url value='Logout' />" class="user-item"><i class="uil uil-exit"></i>登出</a>
							</div>
						</div>
					</div>
					<div class="col-lg-9 col-md-8">
						<div class="dashboard-right">
							<div class="row">
								<div class="col-md-12">
									<div class="main-title-tab">
										<h4><i class="uil uil-heart"></i>Shopping Wishlist</h4>
									</div>
								</div>								
								<div class="col-lg-12 col-md-12">
									<div class="pdpt-bg">
										<div class="wishlist-body-dtt">
											<div class="cart-item">
												<div class="cart-product-img">
													<img src="images/product/img-11.jpg" alt="">
													<div class="offer-badge">4% OFF</div>
												</div>
												<div class="cart-text">
													<h4>Product Title Here</h4>
													<div class="cart-item-price">$15 <span>$18</span></div>
													<button type="button" class="cart-close-btn"><i class="uil uil-trash-alt"></i></button>
												</div>		
											</div>
											<div class="cart-item">
												<div class="cart-product-img">
													<img src="images/product/img-2.jpg" alt="">
													<div class="offer-badge">1% OFF</div>
												</div>
												<div class="cart-text">
													<h4>Product Title Here</h4>
													<div class="cart-item-price">$9.9 <span>$10</span></div>
													<button type="button" class="cart-close-btn"><i class="uil uil-trash-alt"></i></button>
												</div>		
											</div>
											<div class="cart-item">
												<div class="cart-product-img">
													<img src="images/product/img-14.jpg" alt="">
												</div>
												<div class="cart-text">
													<h4>Product Title Here</h4>
													<div class="cart-item-price">$12</div>
													<button type="button" class="cart-close-btn"><i class="uil uil-trash-alt"></i></button>
												</div>		
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>	
		</div>	
	</div>
	<!-- Body End -->
	<!-- Footer Start -->
<%-- 	<jsp:include page="/fragment/downMVC.jsp" /> --%>
	<!-- Footer End -->

	<!-- Javascripts -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/product.thumbnail.slider.js"></script>
	<script src="js/offset_overlay.js"></script>
	<script src="js/night-mode.js"></script>
	
	
</body>
</html>