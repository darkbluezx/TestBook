<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-TW">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">		
		<title>書果店 - 門市查詢</title>
		
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
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>

<body>
<jsp:include page="/fragment/topstore_show.jsp" />
	<!-- Body Start -->
	<div class="wrapper">
		<div class="gambo-Breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">門市查詢</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="all-product-grid">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="panel-group accordion" id="accordion0">
						
						
							<div class="panel panel-default">
								<div class="panel-heading" id="headingNorth">
									<div class="panel-title">
										<a class="collapsed" data-toggle="collapse" data-target="#" href="#collapseNorth" aria-expanded="false" aria-controls="collapseNorth" >
											<i class="uil uil-shop chck_icon"></i>北部
										</a>
									</div>
								</div>
								<div id="collapseNorth" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNorth" data-parent="#accordion0" style="">
									<c:forEach var='showstore' items='${shownorthstore}'>
									<div class="panel-body">
										店名:${showstore.name}<br>
										地址:${showstore.address}<br>
										<div class="color-pink">電話:${showstore.phone}</div>
									</div>
									</c:forEach>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading" id="headingWest">
									<div class="panel-title">
										<a class="collapsed" data-toggle="collapse" data-target="#" href="#collapseWest" aria-expanded="false" aria-controls="collapseWest" >
											<i class="uil uil-shop chck_icon"></i>中部
										</a>
									</div>
								</div>
								<div id="collapseWest" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingWest" data-parent="#accordion0" style="">
									<c:forEach var='showstore' items='${showweststore}'>
									<div class="panel-body">
										店名:${showstore.name}<br>
										地址:${showstore.address}<br>
										<div class="color-pink">電話:${showstore.phone}</div>
									</div>
									</c:forEach>
								</div>
							</div>
							
							
							<div class="panel panel-default">
								<div class="panel-heading" id="headingSouth">
									<div class="panel-title">
										<a class="collapsed" data-toggle="collapse" data-target="#" href="#collapseSouth" aria-expanded="false" aria-controls="collapseSouth" >
											<i class="uil uil-shop chck_icon"></i>南部
										</a>
									</div>
								</div>
								<div id="collapseSouth" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSouth" data-parent="#accordion0" style="">
									<c:forEach var='showstore' items='${showsouthstore}'>
									<div class="panel-body">
										店名:${showstore.name}<br>
										地址:${showstore.address}<br>
										<div class="color-pink">電話:${showstore.phone}</div>
									</div>
									</c:forEach>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading" id="headingEast">
									<div class="panel-title">
										<a class="collapsed" data-toggle="collapse" data-target="#" href="#collapseEast" aria-expanded="false" aria-controls="collapseEast" >
											<i class="uil uil-shop chck_icon"></i>東部
										</a>
									</div>
								</div>
								<div id="collapseEast" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEast" data-parent="#accordion0" style="">
									<c:forEach var='showstore' items='${showeaststore}'>
									<div class="panel-body">
										店名:${showstore.name}<br>
										地址:${showstore.address}<br>
										<div class="color-pink">電話:${showstore.phone}</div>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-3">
							<h2>使用店名查詢</h2>
						<div class="contact-form">
							<form class="ajaxform" method="POST">
								<div class="">
									<label class="control-label"><h3>店名:</h3></label>
									<div class="ui search focus">
										<div class="ui left icon input swdh11 swdh19">
											<input type="text" name="storename" id="storename"  placeholder="請輸入店名" value=""  autocomplete="off">															
										</div>
									</div>
								</div>
								<input name='btn' id='btn' class='next-btn16 hover-btn mt-3' type='button' data-btntext-sending='Sending...' value='查詢'>
							</form>
							<div id='result' style='height: 150px;' class='center'>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<!-- Body End -->
	<script>
		var btn = document.getElementById("btn");  
		var result = document.getElementById("result");   
		var	etn = document.getElementById("storename");
		
		window.onload = function(){ 
        	$(".ajaxform").ajaxForm();
        }
        
		$('#storename').keypress(function() {
        	var name = document.getElementById('storename').value;
        	$.ajax({
            	url: "store_show/singlename",
            	method : "POST",
            	dataType: 'json',
            	data: {name : name},
            	success: function displayStoreName(data){
        			var content = "<div class='panel-body'>";
        			content += "<h4> 店名:" + data.name + "</h4>";
        			content += "<p> 地區:" + data.area + "</p>";
        			content += "<p> 地址:" + data.address + "</p>";
        			content += "<p> 電話:" + data.phone + "</p>";
        			content += "</div>";
        			result.innerHTML = content;
        		}
            	});
		})
		
        $('#btn').click(function() {
        	var name = document.getElementById('storename').value;
        	$.ajax({
            	url: "store_show/singlename",
            	method : "POST",
            	dataType: 'json',
            	data: {name : name},
            	success: function displayStoreName(data){
        			var content = "<div class='panel-body'>";
        			content += "<h4> 店名:" + data.name + "</h4>";
        			content += "<p> 地區:" + data.area + "</p>";
        			content += "<p> 地址:" + data.address + "</p>";
        			content += "<p> 電話:" + data.phone + "</p>";
        			content += "</div>";
        			result.innerHTML = content;
        		}
            	});
		})

	</script>

	<!-- Javascripts -->
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/product.thumbnail.slider.js"></script>
	<script src="js/offset_overlay.js"></script>
	<script src="js/night-mode.js"></script>
	<script src="js/jquery.form.js"></script>
	
	
</body>
</html>