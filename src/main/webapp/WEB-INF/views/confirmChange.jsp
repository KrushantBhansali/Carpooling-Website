<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>SHARE MY TRIP !!!</title>
<style>
body{
	background-image: url("resources/images/background.png");
}
</style>
</head>

<body>
<div>
<ul>
  
  <li><a href="myTrips.htm">My Trips</a></li>
  <li><a href="searchRide.htm">Search Ride</a></li>
  <li><a href="postRide.htm">Post Ride</a></li>
  <li><a href="messages.htm">Messages</a></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li><a  href="viewProfile.htm">${user.fname} ${user.lname}</a></li>
  <li><a href="logout.htm">logout</a></li>
  
</ul>
</div>

<h4>Your Profile has been changed</h4>
</body>
</html>