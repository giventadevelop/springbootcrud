<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en" ng-app="crudApp">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Freelancer - Start Bootstrap Theme</title>

<!-- Bootstrap Core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/freelancer.min.css" rel="stylesheet">
<link href="css/bootstrap-form-validation.css" rel="stylesheet">

<!-- sweetalert CSS -->
    <link href="js/sweetalert/lib/sweet-alert.css" rel="stylesheet">

<link rel="stylesheet" href="js/angular-material/angular-material.css" />
<link rel="styleSheet" href="js/angular-ui-grid/ui-grid.min.css" />

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">


<!-- jQuery -->

<script src="jquery/jquery.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>
	function submit_form() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;


		if (!username || !password) {
			document.getElementById("user_pass_rqd").style.display = 'inline';
			return;
		}

		if (username === undefined || username === null) {
			return;
		}

		if (password === undefined || password === null) {
			return;
		}

		document.getElementById("login-form").submit();

	}

	//form reset

	function login_form_reset() {
		document.getElementById("login-form").reset();
	}


	function logout_user() {
		document.getElementById("logout-form").submit();
	}
	
	
	function showMyImage(fileInput,thumbnail) {
	    var files = fileInput.files;
	    var fileInputFieldId = fileInput.id;
	    console.log("fileInputFieldId is "+  fileInputFieldId)
	    console.log("thumbnail is "+  thumbnail)
	    for (var i = 0; i < files.length; i++) {           
	        var file = files[i];
	        var imageType = /image.*/;     
	        if (!file.type.match(imageType)) {
	            continue;
	        }           
	        var img=document.getElementById(thumbnail); 
		  
		    
	        img.file = file;    
	        var reader = new FileReader();
	        reader.onload = (function(aImg) { 
	            return function(e) { 
	                aImg.src = e.target.result; 
	            }; 
	        })(img);
	        reader.readAsDataURL(file);
	    } 
	    img.style.visibility = 'visible';
	    img.style.display = 'block';
	   
	}
</script>


<style>
.col-container {
	display: table;
	width: 100%;
}

.col {
	display: table-cell;
	padding: 16px;
}
</style>


</head>

<body id="page-top" class="index">

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="#page-top">School Alumni</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1" ng-controller="StateController">
				<ul class="nav navbar-nav navbar-right">

					<li><a href="/">Home</a></li>
					<li><a href="user_my_account">My Account</a></li>
					<li><a href="partials_uigrid">UI Grid</a></li>
					<li><a href="partials_usersgrid">Users Grid</a></li>
					<li><a href="partials_angmaterial_tiles">Angular Tiles</a></li>
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		
        
        
       <div style="float:right">
          <form id="logout-form" action="/logout"	method="post"> <button type="button" class="btn btn-default btn-sm" onclick="logout_user()">  <span class="glyphicon glyphicon-log-out"></span> Log out
        </button> </form>
       
					</div>
	</nav>
	
	<header>
		<div class="container" id="maincontent" tabindex="-1"></div>
	</header>