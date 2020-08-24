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
		<title>Gambo - My Wallet</title>
		
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
<style>
.bacc-default-badge {
    display: inline-block;
    background: #00bfa5;
    color: #fff;
    border-radius: 3px;
    padding: 3px 7px 2px;
    text-transform: capitalize;
    font-size: 13px;
    font-weight: 500;
    width: auto;
    white-space: nowrap;
    margin-bottom: 10px 
}
.btn-light--disabled {
    background: #fff!important;
    color: #ccc;
    cursor: not-allowed;
}
.btn-light {
    background: #fff;
    color: #555;
    border: 1px solid rgba(0,0,0,.09);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.03);
}
.btn--s {
    height: 34px;
    padding: 0 15px;
    min-width: 60px;
    max-width: 190px;
}
.btn--inline {
    display: -webkit-inline-box;
    display: -webkit-inline-flex;
    display: -moz-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
}
.btn {
    overflow: hidden;
    display: -webkit-box;
    text-overflow: ellipsis;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    -webkit-flex-direction: column;
    -moz-box-orient: vertical;
    -moz-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    font-size: 14px;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.09);
    border-radius: 2px;
    border: 0;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -moz-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -moz-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    text-transform: capitalize;
    outline: 0;
    cursor: pointer;
}
button, html input[type=button], input[type=reset], input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer;
}
button, select {
    text-transform: none;
}
button {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    color: inherit;
    font: inherit;
    margin: 0;
}
user agent stylesheet
button {
    -webkit-appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(buttontext, rgb(170, 170, 170));
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: -internal-light-dark-color(rgb(239, 239, 239), rgb(74, 74, 74));
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: -internal-light-dark-color(rgb(118, 118, 118), rgb(195, 195, 195));
    border-image: initial;
}
</style>
<body>
	<!-- Category Model Start-->
	<c:set var="funcName" value="Credit" scope="session"/>
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
								<li class="breadcrumb-item active" aria-current="page">信用卡</li>
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
<!-- 									<input type="file" name="ProductImage" id="file"> -->
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
<%-- 					<jsp:include page="/fragment/leftMVC.jsp" /> --%>
					<div class="col-lg-3 col-md-4">
						<div class="left-side-tabs">
							<div class="dashboard-left-links">
								<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_PersonInfo" class="user-item"><i class="uil uil-apps"></i>個人檔案</a>
								<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_Credit" class="user-item active"><i class="uil uil-wallet"></i>信用卡</a>
								<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_Address" class="user-item"><i class="uil uil-location-point"></i>地址</a>
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
										<h4><i class="uil uil-location-point"></i>銀行帳戶/信用卡</h4>
									</div>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="pdpt-bg">
										<div class="pdpt-title">
											<h4>銀行帳戶/信用卡
											<a href="#" class="add-address hover-btn" data-toggle="modal" data-target="#Credit_model"> + &nbsp;&nbsp;新增信用卡</a>
											</h4>	
										</div>
										<c:if test='${empty allPayment}'>
										<div class="address-body"> 
											<div class="address-item">
											查無銀行帳戶/信用卡
											</div>
										</div>	
										</c:if>
										<c:if test='${not empty allPayment}'>
										<c:forEach var="payment" items='${allPayment}'>
										<div class="address-body">
												<ul class="action-btns" style="text-align: right; margin-right: 55px">
<!-- 													<li><button type="button" class="btn btn-light btn--s btn--inline btn-light--disabled" aria-disabled="true">設定為預設</button></li> -->
<!-- 													<li><button type="button" class="btn btn-light btn--s btn--inline" aria-disabled="false">設定為預設</button></li> -->
													<li><a href='#' id="${payment.id}" class="action-btn" style="font-size: 20px" data-toggle="modal" data-target="#address_modelC${payment.id}"><i class="uil uil-edit"></i></a></li>
													<li><a href="#" id="${payment.id}" class="action-btn" style="font-size: 20px" data-toggle="modal" data-target="#address_modelD${payment.id}"><i class="uil uil-trash-alt"></i></a></li>
												</ul>
												
											<div class="address-item">
												<div style=" margin-right: 35px; margin-left: 20px">
													<img src="${pageContext.request.contextPath}/images/MasterCard.png" >
												</div>
												<div class="address-dt-all">
<!-- 												<div class="bacc-default-badge">預設</div> -->
												<table>
													<tr>	
													    <td><h4 style="margin: 0 0 15px; text-align:right; color:Grey">Master Card</h4></td>
														<td><h4 style="margin: 0 0 15px; text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${payment.creditNumber}</h4></td>
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