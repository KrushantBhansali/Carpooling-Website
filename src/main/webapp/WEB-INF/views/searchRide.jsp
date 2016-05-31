<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/navbar.css" rel="stylesheet"/>
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
	
	
	
	function mapplot() {


		var locations = [];

		var x;
		var y;
		var z;
		var size=(document.getElementById("size").value);
		alert(size);
		
		for (var i = 0; i < size; i++) {
			x = document.getElementById('lat' +i).value;
			y = document.getElementById('lon' +i).value;
			z = document.getElementById('addr' +i).value;
			u = document.getElementById('user' +i).value;
			alert(x);
			alert(y);
			alert(z);
			
			locations[i] = [];
			locations[i][0] = z;
			locations[i][1] = x;
			locations[i][2] = y;
			locations[i][3] = u;
		}



		var map = new google.maps.Map(document.getElementById('map-canvas'), {
			zoom : 12,
			center : new google.maps.LatLng(locations[0][1], locations[0][2]),
			//center : new google.maps.LatLng(42.2732, -71.324324),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});
		var infowindow = new google.maps.InfoWindow();
		var marker, i;
		for (i = 0; i < locations.length; i++) {
			//alert(locations.length);
			marker = new google.maps.Marker({
				position : new google.maps.LatLng(locations[i][1],
						locations[i][2]),
				map : map
			});
			google.maps.event.addListener(marker, 'click',
					(function(marker, i) {
						return function() {
							infowindow.setContent(locations[i][3]+" : "+locations[i][0]);
							infowindow.open(map, marker);
						}
					})(marker, i));
		}
	}
	</script>


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
 
  
 
  <li  ><a  href="#">${user.fname} ${user.lname}</a></li>
  <li ><a  href="logout.htm">logout</a></li>

  
</ul>
</div>
<div id="left">

</div>
</div>
	<div class="container">

		<div class="row">
			<div class="col-md-12" id="map-canvas"></div>
		</div>
		<form method="POST" action="userSearchRide.htm">
			<div class="row">

				<input type="hidden" id="startlat" name="startlat" value="33.333003" /> 
				<input	type="hidden" id="startlong" name="startlong" value="-71.29874" /> 
				<input	type="hidden" id="endlat" name="endlat" value="42.78789" />
				 <input	type="hidden" id="endlong" name="endlong" value="-122.98745" />

				<div class="col-md-3">
					<input class="form-control top_padding" type="text" id="my-address"
						onblur="codeAddress()" />
				</div>
				<div class="col-md-3">
					<input class="form-control top_padding" type="text"
						id="my-address1" onblur="codeAddress1()" />
				</div>


               <div class="col-md-3">
					<input type="button" size="30px"
						class="btn btn-md btn-default top_padding" id="routebtn"
					onclick= "mapplot()"	 value="Plot on Map" />
				</div>

				<div class="col-md-3">
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
   <!--  
   <c:forEach var="t" items="${tripList}">
<tr>
<td>${t.source.address}</td>
<td>${t.dest.address}</td>
<td>${t.seats}</td>
<td>${t.cost}</td>
<td><a href="userViewDetails.htm?trip=${t.tripId}"><input type="button" value="View Details"/></a> </td>

</tr>
</c:forEach> -->





<c:forEach var="i" begin="0" end="${size}" step="1">
					<tr>

				<!-- 	<td>${tripList[i].user.fname}</td>  -->	
						<td>${tripList[i].source.address}</td>
						<td>${tripList[i].dest.address}</td>
						<td>${tripList[i].seats}</td>
						<td>${tripList[i].cost}</td>
					<!--  	<td>${tripList[i].status}</td>         -->
						<td><a href="userViewDetails.htm?trip=${tripList[i].tripId}">
						          <input type="button" value="View Details" /></a > </td>
						

					</tr>
						<input type="hidden" id="user${i}" value="${tripList[i].user.fname}" />
						<input type="hidden" id="lat${i}" value="${tripList[i].source.lat}" />
						<input type="hidden" id="lon${i}" value="${tripList[i].source.lng}" />
						<input type="hidden" id="addr${i}" value="${tripList[i].source.address}" />
						<input type="hidden" id="size" value="${size}" />
				</c:forEach>
  </tbody>
	</table>
			
		</c:if>
		
		
			<c:if test="${empty tripList}" >
		<table>
		<tbody>
		<tr>
		<th><b>Soryy!!! No Trips Found </b></th>
		</tr>
		</tbody>
		</table>
		</c:if>
		<!--end of container-->
	</div>
</body>
</html>