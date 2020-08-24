<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>leftMVC</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">		
		<title>topMVC</title>
		
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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var='debug' value='true' scope='application' />
					<div class="col-lg-3 col-md-4">
						<div class="left-side-tabs">
							<div class="dashboard-left-links">
								<c:if test="${ funcName != 'PersonInfo' }">
				                   <a href="Dashboard_PersonInfo" class="user-item"><i class="uil uil-apps"></i>個人檔案</a>
							    </c:if>
							    <c:if test="${ funcName == 'PersonInfo' }"> 
				                   <a href="Dashboard_PersonInfo" class="user-item active"><i class="uil uil-apps"></i>個人檔案</a>
				                </c:if>
								<c:if test="${ funcName != 'Credit' }">
				                   <a href="Dashboard_Credit" class="user-item"><i class="uil uil-wallet"></i>銀行帳戶/信用卡</a>
							    </c:if>
							    <c:if test="${ funcName == 'Credit' }"> 
				                   <a href="Dashboard_Credit" class="user-item active"><i class="uil uil-wallet"></i>銀行帳戶/信用卡</a>
				                </c:if>
								<c:if test="${ funcName != 'Address' }">
				                   <a href="Dashboard_Address" class="user-item"><i class="uil uil-location-point"></i>地址</a>
							    </c:if>
							    <c:if test="${ funcName == 'Address' }"> 
				                   <a href="Dashboard_Address" class="user-item active"><i class="uil uil-location-point"></i>地址</a>
				                </c:if>
				                <c:if test="${ funcName != 'ShoppingList' }">
				                   <a href="Dashboard_ShoppingList" class="user-item"><i class="uil uil-box"></i>購物清單</a>
							    </c:if>
							    <c:if test="${ funcName == 'ShoppingList' }"> 
				                   <a href="Dashboard_ShoppingList" class="user-item active"><i class="uil uil-box"></i>購物清單</a>
				                </c:if>
								<c:if test="${ funcName != 'Notice' }">
				                   <a href="Dashboard_Notice" class="user-item"><i class="uil uil-gift"></i>通知</a>
							    </c:if>
							    <c:if test="${ funcName == 'Notice' }"> 
				                   <a href="Dashboard_Notice" class="user-item active"><i class="uil uil-gift"></i>通知</a>
				                </c:if>
								<c:if test="${ funcName != 'Marketing' }">
				                   <a href="Dashboard_Marketing" class="user-item"><i class="uil uil-heart"></i>促銷</a>
							    </c:if>
							    <c:if test="${ funcName == 'Marketing' }"> 
				                   <a href="Dashboard_Marketing" class="user-item active"><i class="uil uil-heart"></i>促銷</a>
				                </c:if>
								<a href="<c:url value='Logout' />" class="user-item"><i class="uil uil-exit"></i>登出</a>
							</div>
						</div>
					</div>
					
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