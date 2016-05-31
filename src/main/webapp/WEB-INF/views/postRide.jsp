<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<!-- ---------------------CSS--------------------------------- -->
<link rel="stylesheet" type="text/css" href="resources/css/navbar.css">
<link rel="stylesheet" type="text/css" href="resources/css/searchTable.css">

<!-- --------------------JS------------------------------------- -->
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>

<script src="resources/js/autofill.js"></script>


</head>
<style>

body{
	background-image: url("resources/images/background.png");
}
</style>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>

<script type="text/javascript">
	//function  getcurrentlocation() {

	//}

	//window.onload=getcurrentlocation; 
	function initialize() {
		var address = (document.getElementById('my-address'));
		var address1 = (document.getElementById('my-address1'));
		var autocomplete = new google.maps.places.Autocomplete(address);
		var autocomplete1 = new google.maps.places.Autocomplete(address1);

		autocomplete.setTypes([ 'geocode' ]);
		google.maps.event
				.addListener(
						autocomplete,
						'place_changed',
						function() {
							var place = autocomplete.getPlace();
							if (!place.geometry) {
								return;
							}

							autocomplete1.setTypes([ 'geocode' ]);
							google.maps.event
									.addListener(
											autocomplete1,
											'place_changed',
											function() {
												var place = autocomplete1
														.getPlace();
												if (!place.geometry) {
													return;
												}
												var address = '';
												if (place.address_components) {
													address = [
															(place.address_components[0]
																	&& place.address_components[0].short_name || ''),
															(place.address_components[1]
																	&& place.address_components[1].short_name || ''),
															(place.address_components[2]
																	&& place.address_components[2].short_name || '') ]
															.join(' ');

												}

											});
							//alert("zip:"+ place.address_components[7].short_name );
							var address1 = '';
							if (place.address_components) {
								address1 = [
										(place.address_components[0]
												&& place.address_components[0].short_name || ''),
										(place.address_components[1]
												&& place.address_components[1].short_name || ''),
										(place.address_components[2]
												&& place.address_components[2].short_name || '') ]
										.join(' ');

							}
						});
	}
	function codeAddress() {
		geocoder = new google.maps.Geocoder();
		var address = document.getElementById("my-address").value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {

				//  alert("Latitude: "+results[0].geometry.location.lat());
				//alert("Longitude: "+results[0].geometry.location.lng());

				fromlat = parseFloat(results[0].geometry.location.lat());
				fromlong = parseFloat(results[0].geometry.location.lng());
				document.getElementById("startlat").setAttribute("value",
						fromlat);
				document.getElementById("startlong").setAttribute("value",
						fromlong);
				alert("Source"+ fromlat+ " "+ fromlong);
				
				alert("start point set");

			}

			else {
				alert("Geocode was not successful for the following reason1: "
						+ status);
			}
		});
	}
	function codeAddress1() {
		geocoder = new google.maps.Geocoder();
		var address = document.getElementById("my-address1").value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {

				//   alert("Latitude: "+results[0].geometry.location.lat());
				//  alert("Longitude: "+results[0].geometry.location.lng());

				tolat = parseFloat(results[0].geometry.location.lat());
				tolong = parseFloat(results[0].geometry.location.lng());
				document.getElementById("endlat").setAttribute("value", tolat);
				document.getElementById("endlong").setAttribute("value", tolong);
				alert("Dest"+ tolat+ " "+ tolong);
				//alert("endpoint set");
			}

			else {
				alert("Geocode was not successful for the following reason2: "
						+ status);
			}
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);


</script>
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
	<div class="container">
		<h1>Post a trip</h1>
		<h4>Enter the details</h4>
		<br />
		<form method="post" action="confirmTrip.htm">
			<div class="row">


				<div class="col-md-2">Source:</div>
				<div class="col-md-4">
					<input class="form-control" type="text" id="my-address"
						name="sourceid" onblur="codeAddress()" />
				</div>
				<div class="col-md-4">
					<p id="sid"></p>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-2">Destination:</div>
				<div class="col-md-4">
					<input class="form-control" type="text" id="my-address1" name="destid"
						onblur="codeAddress1()" />
				</div>
				<div class="col-md-4">
					<p id="did"></p>
				</div>


			</div>
			<br />
			<div class="row">
				<div class="col-md-2">Start Date:</div>
				<div class="col-md-4">

					<input type='date' class="form-control" name="startdate" value="yyyy-dd-mm" />


				</div>

				<div class="col-md-4">
					<p id="sdateerr"></p>
				</div>

			</div>



			<br />


			<div class="row">
				<div class="col-md-2">End Date:</div>
				<div class="col-md-4">


					<input type='date' class="form-control" name="enddate" value="yyyy-dd-mm"/>

				</div>

				<div class="col-md-4">
					<p id="edateerr"></p>
				</div>

			</div>


<br/>
			<div class="row">
				<div class="col-md-2">Trip Time:</div>
				<div class="col-md-4">

					<input id="timepicker1" type="time" class="form-control" value="hh:mm:ss"
						name="triptime">
				</div>
				<div class="col-md-4">
					<p id="tterr"></p>

				</div>
			</div>



			<br />
			<div class="row">
				<div class="col-md-2">Cost per seat:</div>
				<div class="col-md-4">
					<input id="cost" name="cost" type="text" class="form-control">
				</div>
				<div class="col-md-4">
					<p id="costerr"></p>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-2">Capacity:</div>
				<div class="col-md-4">
					<input id="capacity" name="capacity" type="text"
						class="form-control">
				</div>
				<div class="col-md-4">
					<p id="capacityerr"></p>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-2">Comments:</div>
				<div class="col-md-4">
					<textarea id="comments" name="comments" class="form-control"></textarea>
				</div>

			</div>
			<br />
			<div class="row">
				<div class="col-md-2">
					<input type="submit" value="Create Trip" class="btn btn-default" />
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2">
					<input type="reset" value="Clear Form" class="btn btn-default" />
				</div>

				<input type="hidden" id="startlat" name="slat" value="" /> <input
					type="hidden" id="startlong" name="slong" value="" /> <input
					type="hidden" id="endlat" name="dlat" value="" /> <input
					type="hidden" id="endlong" name="dlong" value="" />

			</div>
		</form>

	</div>


</body>
</html>