<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/css/navbar.css" rel="stylesheet"/>	

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>SHARE MY TRIP</title>
<style>
body{
	background-image: url("resources/images/background.png");
}
</style>
</head>
<body>

<div>
<ul>
  
   
 <li><img src="resources/images/logo.jpg" width="75px " height="75px"/></li>
  <li ><a  href="myTrips.htm">My Trips</a></li>
  <li ><a  href="searchRide.htm">Search Ride</a></li>
  <li ><a  href="postRide.htm">Post Ride</a></li>
  <li  ><a href="messages.htm">Messages</a></li>
  <li ></li>
 
  
 
  <li  ><a  href="viewProfile.htm">${user.fname} ${user.lname}</a></li>
  <li ><a  href="logout.htm">logout</a></li>

  
</ul>
</div>


	<div class="container">
		<center>
			<h1>MY PROFILE</h1>
		</center>

		<form action="confirmChange.htm" method="Post" >
			<fieldset>
				<legend>Login Details</legend>
				<div class="row">
					<div class="col-md-2">Username:</div>
					<div class="col-md-4">
						<input  id="username" name="username" value="${user.username}"  class="form-control" />
						<span id="msg"></span>
					</div>
					
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Change Password:</div>
					<div class="col-md-4">
						<input type="text" name="password" value="${user.password}" class="form-control" id="pswd1" />
					</div>
					
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Enter your password again:</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="pswd2" id="pswd2" onkeyup="verifyPassword()"  />
					</div>
					
				</div>
				<br />
			</fieldset>

			<fieldset>
				<legend>Personal Details</legend>
				<div class="row">
					<div class="col-md-2">First Name:</div>
					<div class="col-md-4">
						<input  type="text" name="fname" value="${user.fname}" class="form-control" />
					</div>
					
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Last Name:</div>
					<div class="col-md-4">
						<input type="text" name="lname" class="form-control" value="${user.lname}" />
					</div>
					
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Gender:</div>
					<div class="col-md-6">
						<label class="radio-inline"> <input type="radio"
								name="gender" value="Male" /> Male
						</label> <label class="radio-inline"> <input type="radio"
								name="gender" value="Female" /> Female
						</label>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Contact No:</div>
					<div class="col-md-4">
						<input type="text" name="phone" value="${user.phone}" class="form-control" />
					</div>
					
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Email Id:</div>
					<div class="col-md-4">
						<input type="text" name="email" value="${user.email}" class="form-control" />
					</div>
					
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Age:</div>
					<div class="col-md-4">
						<input name="age" class="form-control" value="${user.age}" />
					</div>
					
				</div>
				<br/>
				<div class="row">
					<div class="col-md-2">Upload Profile Image:</div>
					<div class="col-md-4">
						<input name="image" type="file"  class="form-control" />
					</div>
					<div class="col-md-5">
						
					</div>
				</div>
			</fieldset>
			<br />
			<div class="row">
				<div class="col-md-2">
					<input type="submit"  name="submit" value="Submit Changes" class="btn btn-submit" />
				</div>
				
				 
			</div>
            
           
            

		</form>
	</div>


</body>
</html>