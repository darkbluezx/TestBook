<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>驗證信已寄出</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
	body{
		font-family:微軟正黑體!important;
	}
	
	.login-form {
		width: 340px;
    	margin: 30px auto;
	}
    .login-form form {
    	margin-bottom: 5px;
        background: white;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
     .login-form h3 { 
         margin: 20px 0 60px;
    } 
    
	 .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
   
 	.login-btn {       
        font-size: 15px;
        font-weight: bold;
    }
    .login-form .hint-text {
		color: #777;
		padding-bottom: 15px;
		text-align: center;
    }
</style>
</head>
<body>
<div class="wrapper">
<div class="login-form">
    <form action="Login.jsp" method="post">
        <a href="Login.jsp" class="glyphicon glyphicon-arrow-left" style="font-size: 20px ;color:#f55d2c; text-decoration:none"></a>  
        <h3 class="text-center">驗證信已寄出</h3>	
        <div class="text-center">
        	<h1 class="glyphicon glyphicon-envelope" style="font-size: 80px ;color:yellowgreen"></h1>
        </div>
        <div style="margin: 20px 0 40px">
        	<h4 class="text-center">驗證信已發送至<a href="" style="color: green">${mail}</a></h4> 
        	<h4 class="text-center">請驗證</h4> 
        </div>
        <div class="form-group">
            <button type="submit" class="login-btn hover-btn">好</button>
        </div>
    </form>
    <div class="hint-text medium"><a href="" class="text-success">重新發送驗證信</a></div>
</div></div>
</body>
</html>