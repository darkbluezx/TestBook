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
<title>統計管理</title>

<!-- Favicon Icon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/images/fav.png">

<!-- Stylesheets -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400;500;700;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href='${pageContext.request.contextPath}/vendor/unicons-2.0.1/css/unicons.css'
	rel='stylesheet'>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/responsive.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/night-mode.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/step-wizard.css"
	rel="stylesheet">

<!-- Vendor Stylesheets -->
<link
	href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/semantic/semantic.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style type="text/css">
div .form-control {
	display: inline;
	width: 12%;
}
div #stat1, #stat2 {
	background-color:white;
	padding-bottom: 10px;
	margin-bottom: 10px;
}
div #chart_div1 {
	width:650px;
	margin: 0 auto;
}
</style>

</head>
<body>
	<!-- Header Start -->
	<jsp:include page="/fragment/topMVC.jsp" />
	<!-- Header End -->

	<!-- Body Start -->
	<div class="wrapper">
		<div class="gambo-Breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">統計相關</li>
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
								<a href="logistics_manager" class="user-item"><i class="uil uil-newspaper"></i>物流管理</a>
								<a href="statistics_Manager" class="user-item active"><i class="uil uil-chart-bar-alt"></i>統計相關</a>
							</div>
						</div>
					</div>
					
					<div class="col-lg-9 col-md-8">
						<div class="dashboard-right">
							<div class="row">
								<div class="col-md-12">
									<div class="main-title-tab">
										<h4>
											<i class="uil uil-chart-bar-alt"></i>統計相關
										</h4>
									</div>
								</div>

								<div class="col-md-12">
									<div class="pdpt-bg">

										<!-- 第一項統計 -->
										<div class="col-lg-12 col-md-12" id="stat1">
											<div style="padding: 5px 15px;">
												<div class="form-group">
													<label for="sel1" style="font-size: 20px; margin-top: 5px;">
														特定時間之商品銷售數量排行榜：</label>
													<h4>選取時間：</h4>
													<select id="selYear1" class="form-control">
														<option value="-1" selected>----</option>
													</select> 年
													 <select id="selMonth1" class="form-control">
														<option value="-1" selected>--</option>
													</select> 月
												</div>

												<div id="chart_div1"></div>
											</div>
										</div>


										<!-- 第二項統計 -->
										<div class="col-lg-12 col-md-12" id="stat2"></div>

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
	
	<!-- 	第一個圖表 -->
	<script type="text/javascript">
	$('#selMonth1').change(function () {
		var selYear1 = $('#selYear1').val();
		var selMonth1 = $('#selMonth1').val();
		
        google.charts.load('current', { packages: ['corechart'], language: 'zh-tw' });
        google.charts.setOnLoadCallback(oneChart);

        function oneChart() {
        	var data = new google.visualization.DataTable();
            data.addColumn('string','商品');
            data.addColumn('number','銷售量');
        	
            $.ajax({
                type:'GET',
                url:"<c:url value='/statistics_Manager/top10' />",
                dataType: "json",
                data:{
                    selectYear:selYear1,
                    selectMonth:selMonth1
                },
                success: function (jsondata) {
                	
                    $.map(jsondata, function (key, val) {
                        data.addRow([
                        	key.itemName, key.itemSum
                        ]);
                    });
                    
                    var options = {
                            title: selYear1 +'年'+ selMonth1 +'月商品銷量前十排行榜：',
                            titleTextStyle:{
                            	fontSize: 20,
                            },
                            width:650,
                            height:400,
                            hAxis: {
                            	title: '單位：個',
                            	minValue: 1,
                            	maxValue: 50
                            },
                        	vAxis: {
                        		title: '商品'
                        	},
                        	fontSize: 15,
                        	fontName: '微軟正黑體',
                        	backgroundColor: '#fff3e0'
                        };
                    var chart = new google.visualization.BarChart(document.getElementById('chart_div1'));
                    chart.draw(data, options);
                }
            });

            
            

        }
    });
	</script>
	
	<!-- 	產生時間選項 -->
	<script>
        var d = new Date();
        var Y = document.getElementById("selYear1");

        if (d.getMonth() != 0) {
            var styear = d.getFullYear() - 2;
            for (i = styear; i <= d.getFullYear(); i++) {
                Y.options.add(new Option(i, i));
            }
        } else {
            var styear = d.getFullYear() - 1;
            for (i = styear; i <= d.getFullYear(); i++) {
                Y.options.add(new Option(i, i));
            }
        }
    </script>

    <script>
        var d = new Date();

        var Y = document.getElementById("selYear1");

        Y.addEventListener("change", function () {
            var M = document.getElementById("selMonth1");
            var getY = Y.value;
            M.options.length = 0;
            M.options.add(new Option('--', -1));

            if (d.getMonth() != 0) {
                var styear = d.getFullYear() - 2;
                if (getY == styear) {
                    for (let kf = d.getMonth(); kf < 12; kf++) {
                        M.options.add(new Option(kf+1, kf+1));
                    }
                } else if (getY == styear + 1) {
                    for (let kf = 0; kf < 12; kf++) {
                        M.options.add(new Option(kf+1, kf+1));
                    }
                } else {
                    for (let kf = 0; kf < d.getMonth()+1; kf++) {
                        M.options.add(new Option(kf+1, kf+1));
                    }
                }

            } else {
                var styear = d.getFullYear() - 1;
                if (getY == styear) {
                    for (let kf = 0; kf < 12; kf++) {
                        M.options.add(new Option(kf+1, kf+1));
                    }
                } else {
                    for (let kf = 0; kf < d.getMonth(); kf++) {
                        M.options.add(new Option(kf+1, kf+1));
                    }
                }
            }
        })
    </script>
	<!--  end -->
	
	
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