<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>

<link href="resources/css/searchTable.css" rel="stylesheet"/>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<style>
#map-canvas {
	height: 300px;
	width: 800px;
	margin: auto;
	padding: auto;
	border: black solid 2px;
	margin-bottom: 10px;
	margin-left: 15px;
}

div {
/*	border: 1px black solid;*/
	padding: 0px;
}

.container {
	/* border: 1px red solid; */
	width: 900px;
	margin: auto;
	padding: 10px 45px;
}

.top_padding {
	margin-top: 10px;
	margin-bottom: 10px;
}

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
				//alert("start point set");

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
				//alert("endpoint set");
			}

			else {
				alert("Geocode was not successful for the following reason2: "
						+ status);
			}
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);

	function mapLocation() {
		var directionsDisplay;
		var directionsService = new google.maps.DirectionsService();
		var map;

		function initialize1() {
			directionsDisplay = new google.maps.DirectionsRenderer();
			if (window.navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(success);

			} else {
				alert("Map initialization failed!!!")
			}

			function success(pos) {
				var inilat = (parseFloat(pos.coords.latitude));
				var inilong = (parseFloat(pos.coords.longitude));

				//alert((inilat) + " " + (inilong));

				var mapcenter = new google.maps.LatLng(inilat, inilong);
				//var fromloc = new google.maps.LatLng(fromlat,fromlong);
				var mapOptions = {
					zoom : 10,
					//center: fromloc
					center : mapcenter
				};

				map = new google.maps.Map(
						document.getElementById('map-canvas'), mapOptions);
				directionsDisplay.setMap(map);
			}
			google.maps.event.addDomListener(document
					.getElementById('my-address1'), 'blur', calcRoute);
		}

		function calcRoute() {
			var start = new google.maps.LatLng(fromlat, fromlong);
			//var start = new google.maps.LatLng(37.334818, -121.884886);
			//var end = new google.maps.LatLng(37.441883, -122.143019);
			var end = new google.maps.LatLng(tolat, tolong);
			var request = {
				origin : start,
				destination : end,
				travelMode : google.maps.TravelMode.DRIVING
			};
			directionsService
					.route(request,
							function(response, status) {
								if (status == google.maps.DirectionsStatus.OK) {
									directionsDisplay.setDirections(response);
									directionsDisplay.setMap(map);
								} else {
									alert("Directions Request from "
											+ start.toUrlValue(6) + " to "
											+ end.toUrlValue(6) + " failed: "
											+ status);
								}
							});
		}
		//alert("test"+document.getElementById('my-address'));
		google.maps.event.addDomListener(window, 'load', initialize1);

	}
	mapLocation();
</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->


			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
			
				<form method="POST" action="login.htm" class="navbar-form navbar-right" role="search">
					<input type="submit" class="btn btn-default" name="button" value="LOGIN" />
					<input type="submit" class="btn btn-default" name="button" value="SIGN UP"/>
				</form>
			
			
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container">

		<div class="row">
			<div class="col-md-12" id="map-canvas"></div>
		</div>
		<form method="POST" action="search.htm">
			<div class="row">

				<input type="hidden" id="startlat" name="startlat" value="" /> 
				<input	type="hidden" id="startlong" name="startlong" value="" /> 
				<input	type="hidden" id="endlat" name="endlat" value="" />
				 <input	type="hidden" id="endlong" name="endlong" value="" />

				<div class="col-md-4">
					<input class="form-control top_padding" type="text" id="my-address"
						onblur="codeAddress()" />
				</div>
				<div class="col-md-4">
					<input class="form-control top_padding" type="text"
						id="my-address1" onblur="codeAddress1()" />
				</div>


				<div class="col-md-4">
					<input type="submit" size="30px"
						class="btn btn-md btn-default top_padding" id="routebtn"
						value="Search Trips" />
				</div>

			</div>
		</form>

		<!--  end of search form -->
		<br />
		<c:if test="${not empty tripList}">
			<table class="flat-table">
  <tbody>
   <tr>
<th>Source</th>
<th>Destination</th>
<th>Seats Available</th>
<th>Cost</th>
<th>Details</th>
</tr>
    
   <c:forEach var="t" items="${tripList}">
<tr>
<td>${t.source.address}</td>
<td>${t.dest.address}</td>
<td>${t.seats}</td>
<td>${t.cost}</td>
<td><a href="viewDetails.htm?trip=${t.tripId}"><input type="button" value="View Details"/></a> </td>

</tr>
</c:forEach>
  </tbody>
	</table>
			
		</c:if  >
		
		<%-- <c:if test="${empty tripList}" >
		<table>
		<tbody>
		<tr>
		<th><b>Soryy!!! No Trips Found </b></th>
		</tr>
		</tbody>
		</table>
		</c:if> --%>
		<!--end of container-->
	</div>
</body>
</html>