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
	
	
	<!-- =============================================================== -->
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
											<h4 style="background:#FF9D6F">新增--贈品系列活動</h4>
										</div>
										
							<!-- AddFree Body -->		
										<div class="address-body">
										<div class="address-item">
											<div class="add-address-form">
												<div class="checout-address-step">
													<div class="row">
 														<form:form method='POST' modelAttribute="freeBiesBean" class='form-horizontal' 
 															enctype="multipart/form-data" > 
													
 														<!-- key Add -->
															<div class="form-group">
																<label class="control-label" for='freeBieEventName'>
																	贈品活動名稱 :
																</label>
 						 										<input id="freeBieEventName" path="freeBieEventName" type='text'  
																	class="form-control" style="width:400px" placeholder="請填寫活動名稱" required="" /> 
															</div>
															
															<div class="form-group">
																<label class="control-label" for="companyId">
																	適用廠商: </label>
																<form:select class="form-control" style="width:400px" path="companyId" >
																	<form:option  value="-1" label="請挑選" />
																	<form:options items="${companyList}" />											
																</form:select >
															</div>
				

															<div class="form-group">
																<label class="control-label"  for='freeBieThreshold'>
																	符合滿額門檻(金額):
																</label>			
																<input id="freeBieThreshold" path="freeBieThreshold" type='number' min='0' step='50'
																	class="form-control" style="width:400px" placeholder="請填寫金額(元)" required="required"/>	
															</div>


															<div class="form-group">
																<label class="control-label"  for="freeBies">
																	贈品名稱:
																</label>					
																<input id="freeBies" path="freeBies" type='text'
																    class="form-control" style="width:400px" placeholder="請填寫贈品名" required="required" />
					
															</div>
															
															<div class="form-group">
																<label class="control-label" for="freeBieQuota">
																	限量(個數):
																</label>					
																<input id="freeBieQuota" path="freeBieQuota" type='number' min='0' step='5'
																		class="form-control" style="width:400px" placeholder="請填寫數量" required="required"  />				 
															</div>
				
															<div class="form-group">
																<label class="control-label" for="freeBieFromDate">
																	開始時間
																</label>					
																<form:input id="freeBieFromDate" path="freeBieFromDate" type='text' value='2019-01-01 00:00:00'
																	class="form-control" style="width:400px" placeholder="請填寫 yyyy-mm-dd hh:mm:ss" required="required"/>				
															</div>
				
				
															<div class="form-group">
																<label class="control-label" for="freeBieFinishDate">
																	結束時間
																</label>					
																<form:input id="freeBieFinishDate" path="freeBieFinishDate" type='text' value='2020-12-31 23:59:59'
																	class="form-control" style="width:400px" placeholder="請填寫 yyyy-mm-dd hh:mm:ss" required="required"/>			
															</div>
															
															<div class="form-group">
																<label class="control-label" for="FreeBieContent">
																	活動內容說明:
																</label>					
																<form:textarea name="context" id="FreeBieContent" path="FreeBieContent" style="width:400px;height:300px"
																		class="form-control" placeholder="請填寫活動內容" required="required"/>														
															</div>
				
															<div class="form-group">
       															<label class="control-label" for="freeImage">
       																	檔案上傳:
       															</label>						
        														<form:input id="freeImage" path="freeImage" type='file' 
            														class='form:input-large' required="required" />    			
															</div>
															
															<div class="form-group">
															 <a href="promotion_Manager" class="add-address hover-btn">放棄新增，回上一頁</a>
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