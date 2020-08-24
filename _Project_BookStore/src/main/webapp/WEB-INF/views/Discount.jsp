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
<title>AddOffers</title>
</head>


<body>
	<!-- Header Start -->
	<!-- Header End -->
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
								<li class="breadcrumb-item active" aria-current="page">
									<a href="offers">優惠活動</a></li>
								<li class="breadcrumb-item active" aria-current="page">折扣書籍系列</li>
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
							<h2>「折扣書籍系列」活動</h2>
							<img src="${pageContext.request.contextPath}/images/line.svg" alt="無法顯示圖片">
						</div>
					</div>
					<!-- 活動一覽 -->
					<div class="row">
					<c:forEach var='discount' items='${discounts}'>			

					<div class="col-lg" style="width: 410px; height: 840px">				
						<div class="thumbnail" style="display:block ; background:#fff ;width: 380px; height: 680px;
								margin-top: 30px; padding:5px;border-radius: 5px;box-shadow: 0 1px 2px 0 #e9e9e9;">
							<div>
 							<img width="310" hight="310" style="display:block; margin:auto;"
      							 src="${pageContext.request.contextPath}/images/discount2.jpg" alt="無法顯示圖片"/>
							</div>
							<br/>

							<div href="#" class="offers-text" style="width:360px; height:380px">
								<h3>活動名稱:${discount.discountEventName}</h3>
								<p>適用廠商:${discount.companyBean.name}</p>
                        		<p>滿額門檻(需購買單位量):${discount.thresholdQuantity}</p> 
                        		<p>折扣乘數:${discount.discount}%</p>                   
                        		<p>開始時間：${discount.discountFromDate}</p>
                        		<p>結束時間：${discount.discountFinishDate}</p> 
                        		<p>活動內容:${discount.discountContent}</p>       
                    		
							</div>
						</div>
					</div>
				</c:forEach>
				</div>	
				</div>
			</div>
		</div>	
	</div>
	<!-- Body End -->
	
	
	
	
	
	
	
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