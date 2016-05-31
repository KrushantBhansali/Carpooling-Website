<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/css/navbar.css" rel="stylesheet"/>
<style>
body{
	background-image: url("resources/images/background.png");
}
</style>
<title>SHARE MY TRIP</title>
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
 
  
 
  <li><a  href="viewProfile.htm">${user.fname} ${user.lname}</a></li>
  <li ><a  href="logout.htm">logout</a></li>

  
</ul>
</div>
<div>
<p>Your Payment has been confirmed...!!!</p>
<p>Enjoy your Ride</p>
</div>

</body>
</html>