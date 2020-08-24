<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<title>promotion_Manager</title>
</head>

<body>
	<!-- Header Start -->
	<!-- Header End -->
	<jsp:include page="/fragment/topMVC.jsp" />




<!-- ======================================================================= -->
	
	<!-- Body Start -->
	<div class="wrapper">
		<div class="gambo-Breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">行銷活動管理</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		
		
<!-- 		<div class="dashboard-group"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-12"> -->
<!-- 						<div class="user-dt"> -->
<!-- 							<div class="user-img"> -->
<%-- 							<c:if test="${ empty LoginOK.phone && empty Admin}"> --%>
<!-- 								<img src="images/avatar/img-5.jpg" alt=""> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${! empty LoginOK }"> --%>
<%-- 								<img src='${pageContext.request.contextPath}/getMemberImage?phone=${LoginOK.phone}'> --%>
<%-- 							</c:if> --%>
<%-- 							<c:if test="${ empty LoginOK && !empty Admin}"> --%>
<!-- 								<img src="images/avatar/img-3.jpg" alt=""> -->
<%-- 							</c:if> --%>
<!-- 								<div class="img-add">													 -->
<!-- <!-- 									<input type="file" id="file"> --> 
<!-- <!-- 									<label for="file"><i class="uil uil-camera-plus"></i></label> --> 
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 							<h4>${members.name}</h4> --%>
<%-- 							<p>${members.phone}<a href="#"> --%>
<!-- <!-- 							<i class="uil uil-edit"></i> --> 
<!-- 							</a></p> -->
<!-- <!-- 							<div class="earn-points"><img src="images/Dollar.svg" alt="">Points : <span>20</span></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div>	 -->
		
		
		<div class="">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4">
						<div class="left-side-tabs">
						 	<div class="dashboard-left-links">
								<a href="bookUpPage" class="user-item"><i	class="uil uil-box"></i>商品管理</a>
								<a href="store_manager" class="user-item"><i class="uil uil-shop"></i>門市管理</a>
								<a href="promotion_Manager" class="user-item active"><i class="uil uil-gift"></i>行銷活動管理</a>
								<a href="logistics_manager" class="user-item"><i class="uil uil-newspaper"></i>物流管理</a>
								<a href="statistics_Manager" class="user-item"><i class="uil uil-chart-bar-alt"></i>統計相關</a>
						 	</div>
						</div>
					</div>
						
			<!-- ================================= -->			
					<div class="col-lg-9 col-md-8">
						<div class="dashboard-right">
							<div class="row">
								<div class="col-md-12">
									<div class="main-title-tab">
										<h4><i class="uil uil-location-point"></i>行銷活動管理</h4>
									</div>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="pdpt-bg">
										<div class="pdpt-title">
											<h4>行銷活動管理</h4>
										</div>
										<div class="address-body">
								
											<div class="address-item">
												<div class="address-icon1">
													<i class="uil uil-home-alt"></i>
												</div>
												<div class="address-dt-all">
													<h3>贈品系列活動</h3>
													<p>與廠商合作，滿額送贈品活動系列。</p>
													<ul class="action-btns">
														<li><a href="FreeAdd" class="add-address hover-btn" style="background:#D94600;height:35px">
															新增活動</a></li>	
														<li><a href="FreeSearch" class="add-address hover-btn" style="background:#FF5809;height:35px">
															查詢/修改目前活動</a></li>												
<!-- 														<li><a href="#" class="action-btn"><i class="uil uil-edit"></i></a></li> -->
<!-- 														<li><a href="#" class="action-btn"><i class="uil uil-trash-alt"></i></a></li> -->
													</ul>
												</div>
											</div>
											
											
											<div class="address-item">
												<div class="address-icon1">
													<i class="uil uil-home-alt"></i>
												</div>
												<div class="address-dt-all">
													<h3>折扣系列活動</h3>
													<p>與廠商合作，購買達設定數量以上，即有折扣。</p>	
													<ul class="action-btns">
														<li><a href="DiscountAdd" class="add-address hover-btn" style="background:#D94600;height:35px">
															新增活動</a></li>
														<li><a href="DiscountSearch" class="add-address hover-btn" style="background:#FF5809;height:35px">
															查詢/修改目前活動</a></li>											
													</ul>
												</div>
											</div>
											<div class="address-item">
												<div class="address-icon1">
													<i class="uil uil-home-alt"></i>
												</div>
												<div class="address-dt-all">
													<h3>單筆購物，折現金活動</h3>
													<p>單筆結帳金額達門檻，立即折現金。(擇優回饋)</p>
													<ul class="action-btns">
															<li><a href="ShoppingDiscountAdd" class="add-address hover-btn" style="background:#D94600;height:35px">
															新增活動</a></li>
															<li><a href="ShoppingDiscountSearch" class="add-address hover-btn" style="background:#FF5809;height:35px">
															查詢/修改目前活動</a></li>												
													</ul>
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