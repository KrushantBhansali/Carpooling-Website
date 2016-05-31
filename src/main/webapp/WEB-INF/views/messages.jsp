<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/css/searchTable.css" rel="stylesheet"/>
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

			<table class="flat-table">
  <tbody>
   <tr>
<th>Sender</th>
<th>Receiver</th>
<th>Message</th>
<th>Date</th>
<th>Status</th>
</tr>

<c:set var="fname" scope="session" value="${user.fname}"/>
<c:set var="status" scope="session" value="Approved" />   
<c:set var="status1" scope="session" value="Rejected" />   
   <c:forEach var="m" items="${messageList}">
<tr>

<td>${m.sender}</td>
<td>${m.receiver}</td>
<td>${m.message}</td>
<td>${m.date}</td>

<c:if test="${m.sender == fname}">
<c:choose>

				    <c:when test="${m.status == 'pending'}">
				       <td>Status Pending</td>
				    </c:when>
				    <c:when test="${m.status == 'approved'}">
				       	<td><a href="payment.htm?cost=${m.joinTrip.cost}&tripId=${m.joinTrip.tripId}"><button>Payment</button></a></td>
				    </c:when>
				     <c:when test="${m.status == 'reject'}">
				       	<td>Reject</td>
				    </c:when>
				    </c:choose>
				    </c:if>
<c:if test="${m.receiver == fname}">
				    <c:choose>
				    <c:when test="${m.status == 'approved'}">
				       <td> You  Approved</td>
				    </c:when>
				    <c:when test="${m.status == 'reject'}">
				       <td> You  Rejected</td>
				    </c:when>
				    <c:otherwise>
				         <td><a href="approveReject.htm?msgId=${m.mId}&status=${status}"><button >Approved</button></a>
                		 <a href="approveReject.htm?msgId=${m.mId}&status=${status1}"><button >Rejected</button></a></td>
				    </c:otherwise>
				    </c:choose>
				    </c:if>
				

</tr>
</c:forEach>
  </tbody>
	</table>

</body>
</html>