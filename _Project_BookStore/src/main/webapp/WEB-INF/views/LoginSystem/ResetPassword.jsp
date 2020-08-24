<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>重新設定密碼</title>
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
    
 	.input-group-addon .fa{ 
 		font-size: 18px; 
 	} 
</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<div class="wrapper">
<div class="login-form">
    <form action="<c:url value='SetNewPassword' />" >
        <a href="Login" class="glyphicon glyphicon-arrow-left" style="font-size: 20px ;color:#f55d2c; text-decoration:none"></a>  
        <h3 class="text-center">重新設定密碼</h3>	
        <div class="form-group">
        	<div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="phone" placeholder=" Email/手機號碼" />
            </div>
             <div id="phoneError" style="color:red; margin-top: 5px"></div> 
            <div style="color:red; margin-top: 5px"><font color="red">${MsgMap.errorPhoneEmpty}</font></div> 
            <div style="color:red; margin-top: 5px"><font color="red">${MsgMap.errorPhoneMatches}</font></div> 
            <div style="color:red; margin-top: 5px"><font color="red">${MsgMap.errorPhoneDup}</font></div> 
        </div> 
        <div class="form-group">
            <button type="submit" class="login-btn hover-btn">下一個</button>
        </div>
       
    </form>
</div></div>
</body>
</html>