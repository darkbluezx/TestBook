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
								<a href="bookUpPage" class="user-item"><i	class="fas fa-box"></i>&nbsp;&nbsp;商品管理</a>
								<a href="store_manager" class="user-item"><i class="uil uil-shop"></i>門市管理</a>
								<a href="promotion_Manager" class="user-item active"><i class="uil uil-gift"></i>行銷活動管理</a>
								<a href="logistics_manager" class="user-item"><i class="fas fa-newspaper"></i>&nbsp;&nbsp;物流管理</a>
							</div>
						</div>
					</div>
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
											<h4 style="background:#FF9D6F">新增--折扣系列活動</h4>
										</div>
										
							<!-- Add Discount Body -->		
							
										<div class="address-body">
										<div class="address-item">
											<div class="add-address-form">
												<div class="checout-address-step">
													<div class="row">
 														<form:form method='POST' modelAttribute="discountBean" class='form-horizontal' 
 															enctype="multipart/form-data" > 
													
 														<!-- key Add -->
															<div class="form-group">
																<label class="control-label" for='discountEventName'>
																	廠商折扣活動名稱 :
																</label>
 						 										<form:input id="discountEventName" path="discountEventName" type='text'  
																	class="form-control" style="width:400px" placeholder="請填寫活動名稱" required="required" /> 
															</div>
															
															<div class="form-group">
																<label class="control-label" for="companyId">
																	適用廠商: </label>
																<form:select class="form-control" style="width:400px" path="companyId">
																	<form:option  value="-1" label="請挑選" />
																	<form:options items="${companyList}" />
																</form:select>
															</div>
				

															<div class="form-group">
																<label class="control-label"  for='thresholdQuantity'>
																	符合門檻(個數):
																</label>			
																<form:input id="thresholdQuantity" path="thresholdQuantity" type='number' min='0'
																	class="form-control" style="width:400px" placeholder="請填寫個數或本數，例：2、3..." required="required"/>	
															</div>


															<div class="form-group">
																<label class="control-label"  for="discount">
																	折扣數(%):
																</label>					
																<form:input id="discount" path="discount" type='number' min='0' max="100"
																    class="form-control" style="width:400px" placeholder="請填寫%數，例：75、80..." required="required"/>
					
															</div>
																										
				
															<div class="form-group">
																<label class="control-label" for="discountFromDate">
																	開始時間
																</label>					
																<form:input id="discountFromDate" path="discountFromDate" type='text' value='2019-01-01 00:00:00'
																	class="form-control" style="width:400px" placeholder="請填寫 yyyy-mm-dd hh:mm:ss" required="required"/>				
															</div>
				
				
															<div class="form-group">
																<label class="control-label" for="discountFinishDate">
																	結束時間
																</label>					
																<form:input id="discountFinishDate" path="discountFinishDate" type='text' value='2020-12-31 23:59:59'
																	class="form-control" style="width:400px" placeholder="請填寫 yyyy-mm-dd hh:mm:ss" required="required"/>			
															</div>
															
															<div class="form-group">
																<label class="control-label" for="discountContent">
																	活動內容說明:
																</label>					
																<form:textarea name="context" id="discountContent" path="discountContent" style="width:400px;height:300px"																		 class="form-control" placeholder="請填寫活動內容" required="required" />				 
															</div>
				
											
															
															<div class="form-group">
															 <a href="promotion_Manager" class="add-address hover-btn">放棄新增，回上一頁</a>
															 <input type="button" class="add-address hover-btn" value="預設活動" onclick="PaddDiscount();" />
															 <input id="btnAdd" type='submit' class="add-address hover-btn"
																	value="送出" />
															</div>														
																												
														</form:form>
													</div>
												</div>
											</div>									
										</div>
										</div>
							<!-- ========================================================================== -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>	
		</div>	
	</div>

	<script>
	 function PaddDiscount() {
			var discountName = document.getElementById("discountEventName");
			discountName.value = "松崗廠商全商品，購買6件以上85折!!!"
			
			var companyId = document.getElementById("companyId");
			companyId.value = "松崗電腦圖書有限公司"
			
			var thresholdQuantity = document.getElementById("thresholdQuantity");
			thresholdQuantity.value = "6"
			
			var discount = document.getElementById("discount");
			discount.value = "85"
			
			var discountFromDate = document.getElementById("discountFromDate");
			discountFromDate.value = "2020-07-30 00:00:00"
			
			var discountFinishDate = document.getElementById("discountFinishDate");
			discountFinishDate.value = "2020-09-30 23:59:59"
			
			var discountContent = document.getElementById("discountContent");
			discountContent.value = "凡購買松崗廠商全商品系列，單筆購物車滿6件(含)以上，購物車內松崗廠商系列商品皆享有85折優惠!!!!"
			
		}
	</script>

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


