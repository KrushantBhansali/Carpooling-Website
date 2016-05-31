<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<div id="left">

</div>
</div>

<div class="container" >
<fieldset  ><legend style="border-color:black;"><b>Trip Details</b></legend>
<div class="row">

<div class="col-md-6">
<p>User</p>
</div>
<div class="col-md-6">
${trip.user.fname}${trip.user.lname}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Source</p>
</div>
<div class="col-md-6">
${trip.source.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Destination</p>
</div>
<div class="col-md-6">
${trip.dest.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Available Seats</p>
</div>
<div class="col-md-6">
${trip.seats}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Cost</p>
</div>
<div class="col-md-6">
${trip.cost}
</div>
</div>
</fieldset>


<fieldset><legend style="border-color:black;"><b>Car Details</b></legend>
<div class="row">

<div class="col-md-6">
<p>Car model</p>
</div>
<div class="col-md-6">
${trip.user.car.model}

</div>
</div>




<div class="row">
<div class="col-md-6">
<p>Car Type</p>
</div>
<div class="col-md-6">
${trip.user.car.type}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Car number</p>
</div>
<div class="col-md-6">
${trip.user.car.carno}
</div>
</div>


<div class="row">
<div class="col-md-6">
<p>Number of Seats</p>
</div>
<div class="col-md-6">
${trip.user.car.seats}
</div>
</div>

</fieldset>

<fieldset><legend style="border-color:black;"><b>Companion Details</b></legend>
<div>

<c:forEach var="t" items= "${trip.compDetails}">
<div class="row">
<div class="col-md-6">
<p>User Name</p>
</div>
<div class="col-md-6">
${t.user.fname} ${t.user.lname}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Gender</p>
</div>
<div class="col-md-6">
${t.user.gender}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Age</p>
</div>
<div class="col-md-6">
${t.user.age}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Smoking</p>
</div>
<div class="col-md-6">
${t.user.smoking}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Music</p>
</div>
<div class="col-md-6">
${t.user.music}
</div>
</div>
</c:forEach>
</div>
</fieldset>


<form method="post" action="request.htm">
<fieldset><legend ><b>Comments</b></legend>
<div class="row">

<div class="col-md-12">
<textarea rows="05" cols="100" name="text"/></textarea>
</div>
</div>
<div class="row">
<div class="col-md-2">
<a href="userSearchRide.htm"><button name="back">Back</button></a>
</div>

<div class="col-md-4"></div>
<div class="col-md-2">
<input type="hidden" name="recId" value="${trip.user.userId}" />
<input type="hidden" name="recName" value="${trip.user.fname}" />
<input type="hidden" name="tripId" value="${trip.tripId}" />
<input type="submit" value="Send Request"/>
</div>
</div>


</form>
</div>
</body>
</html>