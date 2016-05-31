<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body{
	background-image: url("resources/images/background.png");
}
</style>
<title>Insert title here</title>
</head>
<body>

  <ul>
 <li><img src="resources/images/logo.jpg" width="75px " height="75px"/></li>
  <li ><a  href="myTrips.htm">My Trips</a></li>
  <li ><a  href="searchRide.htm">Search Ride</a></li>
  <li ><a  href="postRide.htm">Post Ride</a></li>
  <li  ><a href="messages.htm">Messages</a></li>
  <li ></li>
 
  
 
  <li  ><a  href="#">${user.fname} ${user.lname}</a></li>
  <li ><a  href="logout.htm">logout</a></li>

  </ul>

<h3>You have successfully registered..</h3>
<p>Share your trip...save money..save fuel</p>
<p>Go back to  <a href="login.htm">home </a></p>

</body>
</html>