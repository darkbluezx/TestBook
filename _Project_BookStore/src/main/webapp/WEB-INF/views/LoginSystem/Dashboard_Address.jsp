<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">		
		<title>Gambo - My Address</title>
		
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
<c:set var="funcName" value="Address" scope="session"/>
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
								<li class="breadcrumb-item active" aria-current="page">地址</li>
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
								<c:if test="${ empty LoginOK && empty Admin}">
								<img src="images/avatar/img-5.jpg" alt="">
							</c:if>
							<c:if test="${! empty LoginOK }">
								<img src='${pageContext.request.contextPath}/getMemberImage?phone=${LoginOK.phone}'>
							</c:if>
							<c:if test="${ empty LoginOK && !empty Admin}">
								<img src="images/avatar/img-3.jpg" alt="">
							</c:if>
								<div class="img-add">													
<!-- 									<input type="file" id="file"> -->
<!-- 									<label for="file"><i class="uil uil-camera-plus"></i></label> -->
								</div>
							</div>
							<h4> ${members.name}</h4>
							<p> ${members.phone}<a href="#">
<!-- 							<i class="uil uil-edit"></i> -->
							</a></p>
<!-- 							<div class="earn-points"><img src="images/Dollar.svg" alt="">Points : <span>20</span></div> -->
						</div>
					</div>
				</div>
			</div>
		</div>	
		<div class="">
			<div class="container">
				<div class="row">		
<%-- 				<jsp:include page="/fragment/leftMVC.jsp" /> --%>
					<div class="col-lg-3 col-md-4">
						<div class="left-side-tabs">
							<div class="dashboard-left-links">
								<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_PersonInfo" class="user-item"><i class="uil uil-apps"></i>個人檔案</a>
								<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_Credit" class="user-item"><i class="uil uil-wallet"></i>信用卡</a>
								<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_Address" class="user-item active"><i class="uil uil-location-point"></i>地址</a>
								<a href="http://localhost:8080/_07_SalesPromotion/ordersallmain" class="user-item"><i class="uil uil-box"></i>訂購紀錄</a>
								<a href="<c:url value='Logout' />" class="user-item"><i class="uil uil-exit"></i>登出</a>
							</div>
						</div>
					</div>		
					<div class="col-lg-9 col-md-8">
						<div class="dashboard-right">
							<div class="row">
								<div class="col-md-12">
									<div class="main-title-tab">
										<h4><i class="uil uil-location-point"></i>我的地址</h4>
									</div>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="pdpt-bg">
										<div class="pdpt-title">
											<h4>我的地址
											<a href="#" class="add-address hover-btn" data-toggle="modal" data-target="#address_model"> + &nbsp;&nbsp;新增地址</a>
											</h4>	
										</div>
										<c:if test='${empty allDelivery}'>
										<div class="address-body"> 
											<div class="address-item">
											查無地址資料
											</div>
										</div>	
										</c:if>
										<c:if test='${not empty allDelivery}'>
										<c:forEach var="delivery" items='${allDelivery}'>
										<div class="address-body">
												<input name="id" type="hidden" id="id" value="${delivery.id}" />
												<ul class="action-btns" style="text-align: right; margin-right: 55px">
													<li><a href='#' id="${delivery.id}" class="action-btn" style="font-size: 20px" data-toggle="modal" data-target="#address_model${delivery.id}"><i class="uil uil-edit"></i></a></li>
													<li><a href="#" id="${delivery.id}" class="action-btn" style="font-size: 20px" data-toggle="modal" data-target="#address_modell${delivery.id}"><i class="uil uil-trash-alt"></i></a></li>
												</ul>
											<div class="address-item">
												<div class="address-icon1" style=" margin-right: 35px; margin-left: 20px">
													<i class="uil uil-home-alt" style="font-size: 25px"></i>
												</div>
												<div class="address-dt-all">
													<table>
														<tr>	
															<td><h4 style="margin: 0 0 15px; text-align:right; color:Grey">姓名</h4></td>
															<td><h4 style="margin: 0 0 15px; text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${delivery.deliveryName}</h4></td>
														</tr>
														<tr>	
															<td><h4 style="margin: 0 0 15px; text-align:right; color:Grey">手機</h4></td>
															<td><h4 style="margin: 0 0 15px; text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${delivery.deliveryPhone}</h4></td>
														</tr>
														<tr>
															<td><h4 style="margin: 0 0 15px; text-align:right; color:Grey">地址</h4></td>
															<td><h4 style="margin: 0 0 15px; text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${delivery.pincode}${delivery.city}${delivery.region}${delivery.street}</h4></td>
														</tr>
													</table>
												</div>
											</div>
										</div>
										</c:forEach>
										</c:if>
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
	<script src="js/night-mode.js"></script	>
</body>
</html>