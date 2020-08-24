<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">		
		<title>Gambo - Offers</title>
		
	<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fav.png">
		
		<!-- Stylesheets -->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400;500;700;900&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<link href='${pageContext.request.contextPath}/vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/night-mode.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/step-wizard.css" rel="stylesheet">
		
		<!-- Vendor Stylesheets -->
		<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/semantic/semantic.min.css">	
<title>Offers</title>
</head>


<body>
	<!-- Header Start -->
	<!-- Header End -->
	<jsp:include page="/fragment/topMVC.jsp" />
	
	<!-- ================================================================================ -->
	
	<!-- Body Start -->
	<div class="wrapper">
		<div class="gambo-Breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">優惠活動</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="all-product-grid mb-14">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="default-title mt-4">
							<h2>優惠活動</h2>
							<img src="${pageContext.request.contextPath}/images/line.svg" alt="無法顯示圖片">
						</div>
					</div>
					<div class="col-lg-4">
<!-- 						<a href="#" class="offers-item"> -->
						<div class="offers-item">
							<div class="offer-img">
								<img src="${pageContext.request.contextPath}/images/offers/freebies.jpg" alt="無法顯示圖片">
							</div>
							<div class="offers-text">
								<h4>📢  滿額送贈品!</h4>
								<p><a href="Free">滿額活動一覽表</a></p>
							</div>
						</div>
<!-- 						</a> -->
					</div>
					<div class="col-lg-4">
						<div class="offers-item">
							<div class="offer-img">
								<img src="${pageContext.request.contextPath}/images/offers/discount1.jpg" alt="無法顯示圖片">
							</div>
							<div class="offers-text">
								<h4>📢  折扣商品!</h4>
								<p><a href="Discount">折扣活動一覽表</a></p>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="offers-item">
							<div class="offer-img">
								<img src="${pageContext.request.contextPath}/images/offers/shoppingdiscount.jpg" alt="無法顯示圖片">
							</div>
							<div class="offers-text">
								<h4>📢  購物滿額，折現金!</h4>
								<p><a href="ShoppingDiscount">滿額折現金</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<!-- Body End -->
	
	
	
	
	
	<!-- Footer Start -->
	<!-- Footer End -->
	
	
	
	<!-- Javascripts -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/semantic/semantic.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/js/product.thumbnail.slider.js"></script>
	<script src="${pageContext.request.contextPath}/js/offset_overlay.js"></script>
	<script src="${pageContext.request.contextPath}/js/night-mode.js"></script>
</body>
</html>