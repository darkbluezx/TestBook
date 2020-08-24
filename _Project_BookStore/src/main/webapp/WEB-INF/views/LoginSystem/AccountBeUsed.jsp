<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>此帳號已被註冊</title>
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
 	img{
		width: 100px; 
		border-radius: 50%;
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
</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<div class="wrapper">
<div class="login-form">
    <form action='Login'>
        <a href="<c:url value='Register' />" class="glyphicon glyphicon-arrow-left" style="font-size: 20px ;color: #f55d2c; text-decoration:none"></a>  
        <h3 class="text-center">此帳號已被註冊</h3>	
        <div>
<%--         <c:if test="${! empty LoginOK }"> --%>
<%--         	<img src="${pageContext.request.contextPath}/images/getMemberImage?phone=${member.phone}"  style="display:block; margin:auto; color: #cce2ff"> --%>
<%--         </c:if> --%>
        </div>
        <div style="margin: 20px 0 40px">
        <h4 class="text-center">${member.name}</h4> 
        <h4 class="text-center" style="color: #f55d2c">${members.phone}</h4> 
        <h4 class="text-center">此帳號已被註冊，您可以直接登入</h4> 
        </div>
        <div class="form-group">
            <button type="submit" class="hover-btn btn-block login-btn">登入</button>
        </div>
   
    </form>
</div>    </div>
</body>
</html>