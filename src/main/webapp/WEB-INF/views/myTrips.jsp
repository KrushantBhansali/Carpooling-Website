<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link href="resources/css/navbar.css" rel="stylesheet"/> -->
<link href="resources/css/timeline.css" rel="stylesheet"/>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>SHARE MY TRIP...</title>
<style>
body{
	background-image: url("resources/images/background.png");
}
</style>
</head>
<body>
<div>
<ul class="navc">
  
    
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
<%-- 
<c:forEach var="c" items="${createList}">

<div class="container" >

<div class="row">
<h3><b>Trip Initiated</b></h3>
<div class="col-md-6">
<p>Initiated By You</p>
</div>
<div class="col-md-6">
${c.user.fname}${c.user.lname}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Source</p>
</div>
<div class="col-md-6">
${c.source.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Destination</p>
</div>
<div class="col-md-6">
${c.dest.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Available Seats</p>
</div>
<div class="col-md-6">
${c.seats}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Cost</p>
</div>
<div class="col-md-6">
${c.cost}
</div>
</div>
</div>

</c:forEach> --%>


<%-- <c:forEach var="j" items="${cList}">

<div class="container" >

<div class="row">
<h3><b>Trip Joined</b></h3>
<div class="col-md-6">
<p>User</p>
</div>
<div class="col-md-6">
${j.trip.user.fname}${j.trip.user.lname}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Source</p>
</div>
<div class="col-md-6">
${j.trip.source.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Destination</p>
</div>
<div class="col-md-6">
${j.trip.dest.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Available Seats</p>
</div>
<div class="col-md-6">
${j.trip.seats}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Cost</p>
</div>
<div class="col-md-6">
${j.trip.cost}
</div>
</div>


<c:forEach var="p" items="${j.trip.compDetails}">

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
</c:forEach>
</div>
</c:forEach> --%>




<div class="container">
    <div class="page-header">
        <h1 id="timeline">Timeline</h1>
    </div>
  
 <ul class="timeline">
    <c:forEach var="c" items="${createList}">  
        <li>
          <div class="timeline-badge"><i class="glyphicon glyphicon-check"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Trips Created</h4>
              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>${c.s_date} ${c.time}</small></p>
            </div>
            <div class="timeline-body">
              <div class="row">
<h3><b>Trip Initiated</b></h3>
<div class="col-md-6">
<p>Initiated By You</p>
</div>
<div class="col-md-6">
${c.user.fname}${c.user.lname}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Source</p>
</div>
<div class="col-md-6">
${c.source.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Destination</p>
</div>
<div class="col-md-6">
${c.dest.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Available Seats</p>
</div>
<div class="col-md-6">
${c.seats}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Cost</p>
</div>
<div class="col-md-6">
${c.cost}
</div>
</div>
            </div>
          </div>
        </li>
      </c:forEach>  
      
      
      <c:forEach var="j" items="${cList}">
        <li class="timeline-inverted">
         <div class="timeline-badge"><i class="glyphicon glyphicon-check"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Trips Joined</h4>
              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>${j.trip.s_date} ${j.trip.time}</small></p>
            </div>
            <div class="timeline-body">
             
             
 <div class="row">
<h3><b>Trip Joined</b></h3>
<div class="col-md-6">
<p>User</p>
</div>
<div class="col-md-6">
${j.trip.user.fname}${j.trip.user.lname}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Source</p>
</div>
<div class="col-md-6">
${j.trip.source.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Destination</p>
</div>
<div class="col-md-6">
${j.trip.dest.address}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Available Seats</p>
</div>
<div class="col-md-6">
${j.trip.seats}
</div>
</div>

<div class="row">
<div class="col-md-6">
<p>Cost</p>
</div>
<div class="col-md-6">
${j.trip.cost}
</div>
</div>


<c:forEach var="p" items="${j.trip.compDetails}">

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
</c:forEach>
             
             
             
             
             
             
            </div>
          </div>
        </li>
      </c:forEach>  
        
</ul>
</div>
</body>
</html>