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
<title>書果店 - 物流管理</title>

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
<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">

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
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">物流管理</li>
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
								<a href="bookUpPage" class="user-item"><i	class="uil uil-box"></i>商品管理</a>
								<a href="store_manager" class="user-item"><i class="uil uil-shop"></i>門市管理</a>
								<a href="promotion_Manager" class="user-item"><i class="uil uil-gift"></i>行銷活動管理</a>
								<a href="logistics_manager" class="user-item active"><i class="uil uil-newspaper"></i>物流管理</a>
								<a href="statistics_Manager" class="user-item"><i class="uil uil-chart-bar-alt"></i>統計相關</a>
							</div>
						</div>
					</div>

					<div class="col-lg-9 col-md-8">
						<div class="dashboard-right">
							<div class="row">
								<div class="col-md-12">
									<div class="main-title-tab">
										<h4>
											<i class="uil uil-newspaper"></i>物流管理
										</h4>
									</div>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="pdpt-bg">
										<div class="pdpt-title">
											<h4>物流清單</h4>
										</div>
										<div class="address-body">
											<table class="table ucp-table table-hover">
												<thead>
													<tr>
														<th style="width: 80px">物流編號</th>
														<th style="width: 125px;">收件人姓名</th>
														<th style="width: 125px;">收件人手機</th>
														<th style="width: 300px;">收件人地址</th>
														<th style="width: 125px;">狀態</th>
														<th style="width: 120px;">狀態更新時間</th>
														<th style="width: 60px;">明細</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var='logistic' items='${logistics}'>
														<tr>
															<td>${logistic.allPayLogisticsID}</td>
															<td>${logistic.receiverName}</td>
															<td>${logistic.receiverCellPhone}</td>
															<td>${logistic.receiverAddress}</td>
															<td>${logistic.rtnMsg}</td>
															<td>${logistic.updateStatusDate}</td>
															<td class="action-btns">
															<a href="<spring:url value='logistics_view?id=${logistic.allPayLogisticsID}' />" class="action-btn"><i class="fas fa-eye"></i></a>
															</td>
														</tr>
																												
													</c:forEach>
												</tbody>
											</table>
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