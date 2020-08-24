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
		<title>Gambo - My Orders</title>
		
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
<c:set var="funcName" value="ShoppingList" scope="session"/>
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
								<li class="breadcrumb-item active" aria-current="page">My Orders</li>
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
								<a href="Dashboard_ShoppingList" class="user-item active"><i class="uil uil-box"></i>購物清單</a>
								<a href="promotion_Manager" class="user-item"><i class="uil uil-heart"></i>行銷活動管理</a>
								<a href="bookUpPage" class="user-item"><i class="uil uil-gift"></i>產品管理</a>
								<a href="<c:url value='Logout' />" class="user-item"><i class="uil uil-exit"></i>登出</a>
							</div>
						</div>
					</div>
					<div class="col-lg-9 col-md-8">
						<div class="dashboard-right">
							<div class="row">
								<div class="col-md-12">
									<div class="main-title-tab">
										<h4><i class="uil uil-box"></i>My Orders</h4>
									</div>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="pdpt-bg">
										<div class="pdpt-title">
											<h6>Delivery Timing 10 May, 3.00PM - 6.00PM</h6>
										</div> 
										<div class="order-body10">
											<ul class="order-dtsll">
												<li>
													<div class="order-dt-img">
														<img src="images/groceries.svg" alt="">
													</div>
												</li>
												<li>
													<div class="order-dt47">
														<h4>Gambo - Ludhiana</h4>
														<p>Delivered - Gambo</p>
														<div class="order-title">2 Items <span data-inverted="" data-tooltip="2kg broccoli, 1kg Apple" data-position="top center">?</span></div>
													</div>
												</li>
											</ul>
											<div class="total-dt">
												<div class="total-checkout-group">
													<div class="cart-total-dil">
														<h4>Sub Total</h4>
														<span>$25</span>
													</div>
													<div class="cart-total-dil pt-3">
														<h4>Delivery Charges</h4>
														<span>Free</span>
													</div>
												</div>
												<div class="main-total-cart">
													<h2>Total</h2>
													<span>$25</span>
												</div>
											</div>
											<div class="track-order">
												<h4>Track Order</h4>
												<div class="bs-wizard" style="border-bottom:0;">   
													<div class="bs-wizard-step complete">
														<div class="text-center bs-wizard-stepnum">Placed</div>
														<div class="progress"><div class="progress-bar"></div></div>
														<a href="#" class="bs-wizard-dot"></a>
													</div>
													<div class="bs-wizard-step complete"><!-- complete -->
														<div class="text-center bs-wizard-stepnum">Packed</div>
														<div class="progress"><div class="progress-bar"></div></div>
														<a href="#" class="bs-wizard-dot"></a>
													</div>
													<div class="bs-wizard-step active"><!-- complete -->
														<div class="text-center bs-wizard-stepnum">On the way</div>
														<div class="progress"><div class="progress-bar"></div></div>
														<a href="#" class="bs-wizard-dot"></a>
													</div>
													<div class="bs-wizard-step disabled"><!-- active -->
														<div class="text-center bs-wizard-stepnum">Delivered</div>
														<div class="progress"><div class="progress-bar"></div></div>
														<a href="#" class="bs-wizard-dot"></a>
													</div>
												</div>
											</div>
											<div class="alert-offer">
												<img src="images/ribbon.svg" alt="">
												Cashback of $2 will be credit to Gambo Super Market wallet 6-12 hours of delivery.
											</div>
											<div class="call-bill">
												<div class="delivery-man">
													Delivery Boy - <a href="#"><i class="uil uil-phone"></i> Call Us</a>
												</div>
												<div class="order-bill-slip">
													<a href="#" class="bill-btn5 hover-btn">View Bill</a>
												</div>
											</div>
										</div>
									</div>
									<div class="pdpt-bg">
										<div class="pdpt-title">
											<h6>Delivery Timing 10 May, 3.00PM - 6.00PM</h6>
										</div> 
										<div class="order-body10">
											<ul class="order-dtsll">
												<li>
													<div class="order-dt-img">
														<img src="images/groceries.svg" alt="">
													</div>
												</li>
												<li>
													<div class="order-dt47">
														<h4>Gambo - Ludhiana</h4>
														<p>Delivered - Gambo</p>
														<div class="order-title">2 Items <span data-inverted="" data-tooltip="2kg broccoli, 1kg Apple" data-position="top center">?</span></div>
													</div>
												</li>
											</ul>
											<div class="total-dt">
												<div class="total-checkout-group">
													<div class="cart-total-dil">
														<h4>Sub Total</h4>
														<span>$25</span>
													</div>
													<div class="cart-total-dil pt-3">
														<h4>Delivery Charges</h4>
														<span>Free</span>
													</div>
												</div>
												<div class="main-total-cart">
													<h2>Total</h2>
													<span>$25</span>
												</div>
											</div>
											<div class="track-order">
												<h4>Track Order</h4>
												<div class="bs-wizard" style="border-bottom:0;">   
													<div class="bs-wizard-step complete">
														<div class="text-center bs-wizard-stepnum">Placed</div>
														<div class="progress"><div class="progress-bar"></div></div>
														<a href="#" class="bs-wizard-dot"></a>
													</div>
													<div class="bs-wizard-step complete"><!-- complete -->
														<div class="text-center bs-wizard-stepnum">Packed</div>
														<div class="progress"><div class="progress-bar"></div></div>
														<a href="#" class="bs-wizard-dot"></a>
													</div>
													<div class="bs-wizard-step complete"><!-- complete -->
														<div class="text-center bs-wizard-stepnum">Arrived</div>
														<div class="progress"><div class="progress-bar"></div></div>
														<a href="#" class="bs-wizard-dot"></a>
													</div>
													<div class="bs-wizard-step complete"><!-- complete -->
														<div class="text-center bs-wizard-stepnum">Delivered</div>
														<div class="progress"><div class="progress-bar"></div></div>
														<a href="#" class="bs-wizard-dot"></a>
													</div>
												</div>
											</div>
											<div class="call-bill">
												<div class="delivery-man">
													<a href="#"><i class="uil uil-rss"></i>Feedback</a>
												</div>
												<div class="order-bill-slip">
													<a href="#" class="bill-btn5 hover-btn">View Bill</a>
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
<%-- <jsp:include page="/fragment/downMVC.jsp" /> --%>
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