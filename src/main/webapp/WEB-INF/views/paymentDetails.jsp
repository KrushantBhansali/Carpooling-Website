<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<title>Payment Details</title>
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
			<h1>Payment Details</h1>
		</center>
		<form:form commandName="payment" action="paymentDetails.htm" method="Post">


			<fieldset>
				<legend>Payment Details</legend>
				<div class="row">
					<div class="col-md-2">Card Holder Name:</div>
					<div class="col-md-4">
						<form:input path="cardholderName" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="cardholderName" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Card Type:</div>
					<div class="col-md-4">

						Debit:
						<form:radiobutton path="cardType" value="debit" />
						Credit:
						<form:radiobutton path="cardType" value="credit" />
					</div>
					<div class="col-md-5">
						<form:errors path="cardType" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Card Number:</div>
					<div class="col-md-4">
						<form:input path="cardNo" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="cardNo" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Expiry date:</div>
					<div class="col-md-4">
						<input type="date" name="cardExpiry" value="2015" class="form-control" required/>
					</div>
					<div class="col-md-5">
						
					</div>
				</div>


			</fieldset>
			<br />
			<div class="row">
				<div class="col-md-2">
					<input type="submit"  name="submit" value="Submit" class="btn btn-submit" />
				</div>
				
				 <div class="col-md-8"></div>
				 <div class="col-md-2"><input type="submit" name="submit" value="Cancel" class="btn btn-submit" /></div>
			</div>


		</form:form>
	</div>
</body>
</html>

