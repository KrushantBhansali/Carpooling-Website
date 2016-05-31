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
<title>Car Details</title>
</head>
<body>
<div class="container">
		<center>
			<h1>Car Details</h1>
		</center>
		<form:form commandName="car" action="carDetails.htm" method="Post" enctype="multipart/form-data">


			<fieldset>
				<legend>Car Details</legend>
				<div class="row">
					<div class="col-md-2">Car No:</div>
					<div class="col-md-4">
						<form:input path="carno" class="form-control"  />
					</div>
					<div class="col-md-5">
						<form:errors path="carno" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Car Color:</div>
					<div class="col-md-4">
						<form:input path="color" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="color" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Car Model:</div>
					<div class="col-md-4">
						<form:input path="model" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="model" cssStyle="color:red"></form:errors>
					</div>
				</div>

				<br />
				<div class="row">
					<div class="col-md-2">Car Capacity:</div>
					<div class="col-md-4">
						<form:input path="seats" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="seats" cssStyle="color:red"></form:errors>
					</div>
				</div>

				<br />
				<div class="row">
					<div class="col-md-2">Car Type:</div>
					<div class="col-md-4">
						<form:input path="type" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="type" cssStyle="color:red"></form:errors>
					</div>
				</div>

				<br />
				<div class="row">
					<div class="col-md-2">Upload Car Image:</div>
					<div class="col-md-4">
						<input name="image" type="file" class="form-control" />
					</div>
					<div class="col-md-5">
						
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