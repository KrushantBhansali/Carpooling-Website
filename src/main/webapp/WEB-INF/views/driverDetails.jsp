<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<title>Login Page</title>
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<style>
body{
	background-image: url("resources/images/background.png");
}
</style>
<title>Driver Details</title>
</head>
<body>
<div class="container">
		<center>
			<h1>Driver Details</h1>
		</center>
		<form:form commandName="driving" action="drivingDetails.htm" method="Post">


			<fieldset>
				<legend>License Details</legend>
				<div class="row">
					<div class="col-md-2">Driving License No:</div>
					<div class="col-md-4">
						<form:input path="license" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="license" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Validity in months:</div>
					<div class="col-md-4">
						<form:input path="validity" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="validity" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				
								
			</fieldset>
			<br />
			<div class="row">
				<div class="col-md-2">
					<input type="submit"  name="submit" value="Next>>" class="btn btn-submit" />
				</div>
				
				 <div class="col-md-8"></div>
				 <div class="col-md-2"><input type="submit" name="submit" value="Cancel" class="btn btn-submit" /></div>
			</div>



		</form:form>
	</div>
</body>
</html>