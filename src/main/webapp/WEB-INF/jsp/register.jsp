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
<link href="js/ladda/dist/ladda-themeless.min.css" rel="stylesheet">


<!-- Theme CSS -->
<link href="css/freelancer.min.css" rel="stylesheet">
<link href="css/register.css" rel="stylesheet">

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


</head>

<body id="page-top" class="index">

	<div id="skipnav">
		<a href="#maincontent">Skip to main content</a>
	</div>

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
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a href="/">Home</a></li>
					<li><a href="login">Login</a></li>
					<li><a href="register">Register</a></li>
					<li><a ui-sref=uigrid>UI Grid</a></li>
					<li><a ui-sref="angtiles">Ang Tiles</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<header>
		<div class="container" id="maincontent" tabindex="-1"></div>
	</header>
	<!-- <div style="padding-left: 30px;padding-right: 30px">
   <ui-view> </ui-view>
    </div> -->
	<!-- Source for the bootstrap login form tthe
  urls
  https://bootsnipp.com/tags/login
  https://bootsnipp.com/snippets/featured/login-amp-signup-forms-in-panel
   -->

	<!-- <div style="padding-left: 30px; padding-right: 30px">
		<ui-view> </ui-view>
	</div> -->

	<h3>Register User</h3>

	<div class="container">
		<div class="container main-content" ng-controller="UserController">

	<form ng-submit="onSubmit()"
				novalidate="novalidate"
			  ng-hide="submitted" >
			  
		<div class="form-group" >
			<label for="name" class="control-label">First Name</label >
			<input type="text"
			       class="form-control"
			       ng-model="formModel.firstName"
			       id="firstName"
					   required="required" >
		</div >
		
		<div class="form-group" >
			<label for="name" class="control-label">Last Name</label >
			<input type="text"
			       class="form-control"
			       ng-model="formModel.lastName"
			       id="lastName"
					   required="required" >
		</div >

		<div class="form-group">
			<label for="email" class="control-label">Email</label >
			<input type="email"
			       class="form-control"
			       ng-model="formModel.email"
			       id="email"
					   required="required" >
		</div >

		<div class="form-group" >
			<label for="username" class="control-label">Username</label >
			<input type="text"
			       class="form-control"
			       ng-model="formModel.userName"
			       ng-pattern="/^[A-Za-z0-9_]{1,32}$/"
			       ng-minlength="5"
			       ng-pattern-err-type="badUsername"
			       id="userName"
			       required="required" >
		</div >

		<!-- <div class="form-group" >
			<label for="age" class="control-label">Age</label >
			<input type="number"
			       class="form-control"
			       ng-model="formModel.age"
			       min="18"
			       max="64"
			       id="age"
			       ng-min-err-type="tooYoung"
			       ng-max-err-type="tooOld"
			       required="required" >
		</div > -->

		<!-- <div class="form-group" >
			<label for="sex" class="control-label">Sex</label >
			<select id="sex"
							class="form-control"
							ng-model="formModel.sex"
							required="required" >
				<option value="" >Please Choose</option >
				<option value="male" >Male</option >
				<option value="female" >Female</option >
			</select >
		</div > -->

		<div class="form-group" >
			<label for="password" class="control-label">Password</label >
			<input type="password"
			       class="form-control"
			       ng-model="formModel.password"
			       id="password"
			       required="required"
						 ng-minlength="5">
		</div >

		<div class="form-group">

			<!-- <div class="alert alert-danger text-center" ng-show="has_error">
				<h3>There was a problem registering, please try again later!</h3>
			</div> -->

			<button class="btn btn-primary"
			        ladda="submitting"
			        data-style="expand-right"
							type="submit">
				<span ng-show="submitting">Registering</span>
				<span ng-show="!submitting">Register</span>
			</button>
		</div>

	</form >

	<div class="alert alert-info text-center" ng-show="submitted">
		<h3>Thanks for Registering!</h3>
	</div>

</div >

	</div>

	<!-- Footer -->
	<footer class="text-center">
		<div class="footer-above">
			<div class="container">
				<div class="row">
					<div class="footer-col col-md-4">
						<h3>Location</h3>
						<p>
							3481 Melrose Place <br>Beverly Hills, CA 90210
						</p>
					</div>
					<div class="footer-col col-md-4">
						<h3>Around the Web</h3>
						<ul class="list-inline">
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Facebook</span><i class="fa fa-fw fa-facebook"></i></a>
							</li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Google Plus</span><i
									class="fa fa-fw fa-google-plus"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Twitter</span><i class="fa fa-fw fa-twitter"></i></a>
							</li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Linked In</span><i class="fa fa-fw fa-linkedin"></i></a>
							</li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Dribble</span><i class="fa fa-fw fa-dribbble"></i></a>
							</li>
						</ul>
					</div>
					<div class="footer-col col-md-4">
						<h3>About Freelancer</h3>
						<p>
							Freelance is a free to use, open source Bootstrap theme created
							by <a href="http://startbootstrap.com">Start Bootstrap</a>.
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-below">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">Copyright &copy; Your Website 2017</div>
				</div>
			</div>
		</div>
	</footer>



	

	<!-- Bootstrap Core JavaScript -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	
	
	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<!-- Theme JavaScript -->
	<script src="js/freelancer.js"></script>


	<script src="js/angular/angular.js"></script>
	<script src="js/angular-aria/angular-aria.js"></script>
	<script src="js/angular-animate/angular-animate.js"></script>
	<script src="js/angular-messages/angular-messages.js"></script>
	<script src="js/angular-sanitize/angular-sanitize.js"></script>
	<script src="js/angular-bootstrap/ui-bootstrap-tpls.js"></script>
	<script src="js/angular-material/angular-material.js"></script>
	<script src="js/angular-ui-router/release/angular-ui-router.js"></script>
	<script src="js/localforage.min.js"></script>
	<script src="js/ngStorage.min.js"></script>
	<script src="js/angular-ui-grid/ui-grid.min.js"></script>

	<script	src="js/angular-auto-validate/dist/jcs-auto-validate.min.js"></script>
	<script src="js/ladda/dist/ladda.min.js"></script>
	<script src="js/angular-ladda/dist/angular-ladda.min.js"></script>
	<script src="js/ladda/dist/spin.min.js"></script>

     <script src="js/app/app.js"></script>
	 <script src="js/app/UserService.js"></script>
	 <script src="js/app/UserController.js"></script>
		
	<!-- <script src="main.js"></script> -->



</body>

</html>
