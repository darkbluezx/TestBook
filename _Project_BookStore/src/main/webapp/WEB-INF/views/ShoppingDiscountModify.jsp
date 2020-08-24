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
<script>
 function confirmUpdate(id){
	  var result = confirm("確定修改此活動(活動編號:" + id.trim() + ")?");
	  if (result) {
	      return true;
	  }
	  return false;
  }

</script>

</head>


<body>
	<!-- Header Start -->
	<!-- Header End -->
	<jsp:include page="/fragment/Promotion_Modify_topMVC.jsp" />

	
	
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
<!-- <!-- 							<div class="earn-points"><img src="images/Dollar.svg" alt="">Points : <span>20</span></div> --> -->
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
											<h4 style="background:#FF9D6F">修改--折現金系列活動</h4>
										</div>
										
							<!-- modify ShoppingDiscount Body -->									
								<div class="address-body">
										<div class="address-item">
											<div class="add-address-form">
												<div class="checout-address-step">
													<div class="row">
 														<form:form method='POST' modelAttribute="shoppingDiscountBean" class='form-horizontal' 
 															enctype="multipart/form-data" > 
													
 														<!-- key Add -->
 															<div class="form-group">
																<label class="control-label" for='shoppingEventId'>
																	活動編號 :
																</label>
 						 										<form:input id="shoppingEventId" path="shoppingEventId" type='text'  
																	class="form-control" style="width:400px" placeholder="" required="required" /> 
															</div>
															<div class="form-group">
																<label class="control-label" for='shoppingEventName'>
																	購物滿額，折現金活動名稱 :
																</label>
 						 										<form:input id="shoppingEventName" path="shoppingEventName" type='text'  
																	class="form-control" style="width:400px" placeholder="請填寫活動名稱" required="required" /> 
															</div>
															
				
															<div class="form-group">
																<label class="control-label"  for='shoppingThreshold'>
																	須達門檻金額(元):
																</label>			
																<form:input id="shoppingThreshold" path="shoppingThreshold" type='text'
																	class="form-control" style="width:400px" placeholder="請填寫金額數字，例：1000、2500...." required="required"/>	
															</div>


															<div class="form-group">
																<label class="control-label"  for="shoppingDiscount">
																	獲得的折扣金額(元):
																</label>					
																<form:input id="shoppingDiscount" path="shoppingDiscount" type='number' min='0' step="10"
																    class="form-control" style="width:400px" placeholder="請填寫金額數字，例：100、200..." required="required" />
															</div>
															<div class="form-group">
																<label class="control-label" for="shoppingFromDate">
																	開始時間
																</label>					
																<form:input id="shoppingFromDate" path="shoppingFromDate" type='text' 
																	class="form-control" style="width:400px" placeholder="請填寫 yyyy-mm-dd hh:mm:ss" required="required" />				
															</div>
				
				
															<div class="form-group">
																<label class="control-label" for="shoppingFinishDate">
																	結束時間
																</label>					
																<form:input id="shoppingFinishDate" path="shoppingFinishDate" type='text'
																	class="form-control" style="width:400px" placeholder="請填寫 yyyy-mm-dd hh:mm:ss" required="required"/>			
															</div>
															
															
															
															<div class="form-group">
																<label class="control-label" for="shoppingEventContent">
																	活動內容說明:
																</label>					
																<form:textarea name="context" id="shoppingEventContent" path="shoppingEventContent" style="width:400px;height:300px"
																		 class="form-control" placeholder="請填寫活動內容" required="required"/>				 
															</div>
											
															
															<div class="form-group">
															 	<a href="../promotion_Manager" class="add-address hover-btn">放棄修改，回管理頁面</a>
															 	 <input id="btnAdd" type='submit' class="add-address hover-btn"
																	value="確定修改" onclick="return confirmUpdate('${ShoppingdiscountBean.shoppingEventId};" />
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