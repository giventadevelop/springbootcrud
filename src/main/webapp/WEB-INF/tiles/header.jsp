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

	/* window.onload = function() {
		document.getElementById('user_pass_rqd').style.display = 'none';
	}; */

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

		/* if (validation()) // Calling validation function
		{
		document.getElementById("form_id").submit(); //form submission
		alert(" Name : " + name + " n Email : " + email + " n Form Id : " + document.getElementById("form_id").getAttribute("id") + "nn Form Submitted Successfully......");
		} */


	}

	//form reset

	function login_form_reset() {
		document.getElementById("login-form").reset();
	}


	function logout_user() {
		//var name = document.getElementById("login-form").value;
		//var email = document.getElementById("email").value;
		document.getElementById("logout-form").submit();

		/* if (validation()) // Calling validation function
		{
		document.getElementById("form_id").submit(); //form submission
		alert(" Name : " + name + " n Email : " + email + " n Form Id : " + document.getElementById("form_id").getAttribute("id") + "nn Form Submitted Successfully......");
		} */


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

	<!-- <div id="skipnav">
		<a href="#maincontent">Skip to main content</a>
	</div> -->

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
				<a class="navbar-brand" href="#page-top">Start Bootstrap</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1" ng-controller="StateController">
				<ul class="nav navbar-nav navbar-right">

					<li><a href="/">Home</a></li>
					<li><a href="login">Login</a></li>
					<li><a href="register_user_form">Register</a></li>
					<!-- <li><a ui-sref="uigrid">UI Grid</a></li> -->
					<!-- <li><a href="" ng-click="reloadRoute('uigrid')">UI Grid</a></li>
					<li><a ui-sref="users_grid" ng-click="reloadRoute">Users Grid</a></li>
					<li><a href="" ng-click="reloadRoute('users_grid')">Users Grid</a></li>
					<li><a href="" ui-sref="angtiles">Ang Tiles</a></li>

					<form id="logout-form" action="/logout"	method="post">
						<li><a href="" onclick="logout_user()">Logout </a></li>
					</form> -->

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<header>
		<div class="container" id="maincontent" tabindex="-1"></div>
	</header>