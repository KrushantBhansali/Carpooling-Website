<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<title>Login Page</title>
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

         
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
body{
	background-image: url("resources/images/background.png");
}
</style>

<title>User Enrollment Form</title>

</head>
<script >
  
$( document ).ready(function() {
	
	
	$( "#username" ).keyup(function () {
		var username = $('#username').val();
		
						
		$.ajax({
			 
	       url: "ajax.html",
	       type: "POST",
	       data : {
	       	username: username
	          
	           
	       },
	       success : function(response){
	       //	alert(response);
	       	$("#msg").css({
	       		   'color':'red',
	       		   'font-size':'15px'
	       		});
	       	$("#msg").html(response);				                        
	       }
	   });
		
	});
});
</script>
<script type="text/javascript">

function verifyPassword() {
	var pass1 = document.getElementById("pswd1");
	var pass2 = document.getElementById("pswd2");
	var s = document.getElementById("match");
	
	
	if (pass1.value == pass2.value) {
		s.innerHTML = "Password match!!!";
		s.style.color="green";
		//document.getElementById("sb").disabled=false;
	} else {
		s.innerHTML = "Password don't match!!!";
		s.setAttribute("style", "color:red");
		//document.getElementById("sb").disabled=true;
	}
}	
</script>


<body>
	<div class="container">
		<center>
			<h1>USER ENROLLMENT FORM</h1>
		</center>
		<form:form commandName="u" action="signUp.htm" method="Post" enctype="multipart/form-data">
			<fieldset>
				<legend>Login Details</legend>
				<div class="row">
					<div class="col-md-2">Username:</div>
					<div class="col-md-4">
						<form:input  id="username" name="username" path="username" class="form-control" />
						<span id="msg"></span>
					</div>
					<div class="col-md-5">
						<form:errors path="username" cssStyle="color:#ff0000"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Password:</div>
					<div class="col-md-4">
						<form:input path="password" class="form-control" id="pswd1" />
					</div>
					<div class="col-md-5">
						<form:errors path="password" cssStyle="color:#ff0000"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Enter your password again:</div>
					<div class="col-md-4">
						<input class="form-control" name="pswd2" id="pswd2" onkeyup="verifyPassword()"  />
					</div>
					<div class="col-md-5">
						<span id="match"> </span>
					</div>
				</div>
				<br />
			</fieldset>

			<fieldset>
				<legend>Personal Details</legend>
				<div class="row">
					<div class="col-md-2">First Name:</div>
					<div class="col-md-4">
						<form:input path="fname" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="fname" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Last Name:</div>
					<div class="col-md-4">
						<form:input path="lname" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="lname" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Gender:</div>
					<div class="col-md-6">
						<label class="radio-inline"> <form:radiobutton
								path="gender" value="Male" /> Male
						</label> <label class="radio-inline"> <form:radiobutton
								path="gender" value="Female" /> Female
						</label>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Contact No:</div>
					<div class="col-md-4">
						<form:input path="phone" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="phone" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Email Id:</div>
					<div class="col-md-4">
						<form:input path="email" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="email" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-2">Age:</div>
					<div class="col-md-4">
						<form:input path="age" class="form-control" />
					</div>
					<div class="col-md-5">
						<form:errors path="age" cssStyle="color:red"></form:errors>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-2">Upload Profile Image:</div>
					<div class="col-md-4">
						<input name="image" type="file" class="form-control" />
					</div>
					<div class="col-md-5">
						
					</div>
				</div>
			</fieldset>
			<br />
			<div class="row">
				<div class="col-md-2">
					<input type="submit"  name="submit" value="Next>>" class="btn btn-submit" />
				</div>
				
				 <div class="col-md-8"></div>
				 <div class="col-md-2"><input type="submit" name="submit" value="Cancel" class="btn btn-submit" /></div>
			</div>
            
           
            

		</form:form>
	</div>
</body>
</html>