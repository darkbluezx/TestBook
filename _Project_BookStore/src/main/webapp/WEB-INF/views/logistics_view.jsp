<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, shrink-to-fit=9">
<meta name="description" content="Gambolthemes">
<meta name="author" content="Gambolthemes">
<title>書果店 - 物流明細</title>

<!-- Favicon Icon -->
<link rel="icon" type="image/png" href="images/fav.png">

<!-- Stylesheets -->
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/night-mode.css" rel="stylesheet">
<link href="css/step-wizard.css" rel="stylesheet">

<!-- Vendor Stylesheets -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="vendor/semantic/semantic.min.css">

</head>

<body>
	<jsp:include page="/fragment/topMVC.jsp" />


	<!-- Body Start -->
	<div class="wrapper">
		<div class="gambo-Breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index">Home</a></li>
								<li class="breadcrumb-item"><a href="logistics_manager">物流管理</a></li>
								<li class="breadcrumb-item active" aria-current="page">物流明細</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4">
						<div class="left-side-tabs">
							<div class="dashboard-left-links">
								<a href="bookUpPage" class="user-item"><i
									class="uil uil-box"></i>商品管理</a> <a href="store_manager"
									class="user-item"><i class="uil uil-shop"></i>門市管理</a> <a
									href="promotion_Manager" class="user-item"><i
									class="uil uil-gift"></i>行銷活動管理</a> <a href="logistics_manager"
									class="user-item active"><i class="uil uil-newspaper"></i>物流管理</a>
							</div>
						</div>
					</div>

					<div class="col-lg-9 col-md-8">
						<div class="dashboard-right">
							<div class="row">
								<div class="col-md-12">
									<div class="main-title-tab">
										<h4>
											<i class="uil uil-newspaper"></i>物流明細
										</h4>
									</div>
									<a href="logistics_manager" class="Offer-shop-btn hover-btn">回上一頁</a>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="pdpt-bg">
										<div class="pdpt-title">
											<h4>明細表</h4>
										</div>
										<ul class="top-posts pl-2 pr-2">
											<li>
												<div class="cart-total-dil">
													<h3>物流編號</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.allPayLogisticsID}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>廠商編號</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.merchantID}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>廠商交易編號</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.merchantTradeNo}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>商品名稱</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.goodsName}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>商品金額</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.goodsAmount}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>會員選擇的物流方式</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.logisticsType}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>收件人姓名</h3>
													<span style="color: #FF5809; font-size: 25px;">${view2.receiverName}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>收件人電話</h3>
													<span style="color: #FF5809; font-size: 25px;">${view2.receiverPhone}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>收件人手機</h3>
													<span style="color: #FF5809; font-size: 25px;">${view2.receiverCellPhone}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>收件人Email</h3>
													<span style="color: #FF5809; font-size: 25px;">${view2.receiverEmail}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>收件人地址</h3>
													<span style="color: #FF5809; font-size: 25px;">${view2.receiverAddress}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>物流費用</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.handlingCharge}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>托運單號</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.bookingNote}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>訂單成立時間</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.tradeDate}</span>
												</div>
											</li>
											<li>
												<div class="cart-total-dil">
													<h3>檢查碼</h3>
													<span style="color: #FF5809; font-size: 25px;">${view.checkMacValue}</span>
												</div>
											</li>
										</ul>
										<div class="shopowner-dt-list">
											<span class="left-dt">&nbsp;</span> <span class="right-dt"></span>
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