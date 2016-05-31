<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/css/login.css" rel="stylesheet"/>
<title>SHARE MY TRIP...</title>
<style>
body{
	background-image: url("resources/images/background.png");
}
</style>
</head>
<body>
<form  method="post"  action="homepage.htm">
<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Login</h1>
			</div>

			<div class="login-form">
				<div class="control-group">
				
				<input type="text" class="login-field"   placeholder="username" name="username" id="login-name" required/>  
			<!--	<form:errors path="username" cssStyle="color:#ff0000"></form:errors> -->
				<label class="login-field-icon fui-user" for="login-name"></label>
				</div>

				<div class="control-group">
				<input  class="login-field"  placeholder="password" type="password" name="password" id="login-pass" required/>
		<!--	<form:errors path="password" cssStyle="color:#ff0000"></form:errors>   -->	
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>

				<input type="submit" class="btn btn-primary btn-large btn-block" value="login" />
				<a class="login-link" href="#">Lost your password?</a>
				<a class="login-link" href="signUp.htm">New User SignUp?</a>
			</div>
		</div>
	</div>
	</form>
</body>
</html>