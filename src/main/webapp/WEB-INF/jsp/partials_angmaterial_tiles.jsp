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
	function submit_form() {
		//var name = document.getElementById("login-form").value;
		//var email = document.getElementById("email").value;
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
			<div class="collapse navbar-collapse "
				id="bs-example-navbar-collapse-1" ng-controller="StateController">
				<ul class="nav navbar-nav navbar-left nav_menu_class" >

					<li><a href="/">Home</a></li>
					<!-- <li><a href="login">Login</a></li>
					<li><a href="register_user_form">Register</a></li> -->
					<!-- <li><a ui-sref="uigrid">UI Grid</a></li> -->
					<li><a href="partials_uigrid">UI Grid</a></li>
					<li><a href="partials_usersgrid">Users Grid</a></li>
					<li><a href="partials_angmaterial_tiles">Angular Tiles</a></li>

					<form id="logout-form" action="/logout"	method="post">
						<li><a href="" onclick="logout_user()">Logout </a></li>
					</form>
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<header>
		<div class="container" id="maincontent" tabindex="-1"></div>
	</header>
     <!-- <div layout="row" layout-sm="column" layout-align="space-around"> -->
     <div ng-show="loader_spinner_activated">
       <md-progress-linear  class="md-warn" md-mode="indeterminate"></md-progress-linear> 
       </div>
      

	<div class="panel panel-default" ng-controller="AnGridController as vm">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="lead">User </span>
		</div>
		<!-- <div class="panel-body">

			<md-content> <md-grid-list md-cols-gt-md="12"
				md-cols-sm="3" md-cols-md="8" md-row-height="200px"
				md-gutter-gt-md="16px" md-gutter-gt-sm="8px" md-gutter="4px">
			<md-grid-tile ng-repeat="i in [1,2,3,4,5,6,7,8,9,10]">
			<md-grid-tile-header>
			<div layout-align="start">Header</div>
			</md-grid-tile-header>
			<div layout-align="start center">
				<img src="images/yeoman.png" alt="I'm Yeoman">
			</div>
			<md-grid-tile-footer> Footer </md-grid-tile-footer> </md-grid-tile> </md-grid-list>
			</md-content>

		</div> -->
		
		JSON.stringify(dogs);
		
		<div class="panel-body">

			<md-content> <md-grid-list md-cols-gt-md="12"
				md-cols-sm="3" md-cols-md="8" md-row-height="200px"
				md-gutter-gt-md="16px" md-gutter-gt-sm="8px" md-gutter="4px">
			<md-grid-tile  ng-repeat="dog in dogs track by dog.id">
			<md-grid-tile-header>
			<div layout-align="start">Header</div>
			</md-grid-tile-header>
			<div layout-align="start center">
				<!-- <img  src="data:image/jpeg;base64,{{dog.base64EncodedImg}}" /> -->
				 <img  src="data:image/jpeg;base64,{{dog.dogPicture}}" /> 
			</div>
			<md-grid-tile-footer> Footer </md-grid-tile-footer> </md-grid-tile> </md-grid-list>
			</md-content>

		</div>

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
	<script src="js/angular-auto-validate/dist/jcs-auto-validate.min.js"></script>
	<script src="js/ladda/dist/ladda.min.js"></script>
	<script src="js/angular-ladda/dist/angular-ladda.min.js"></script>
	<script src="js/ladda/dist/spin.min.js"></script>

     <script src="js/angular-sweetalert/SweetAlert.min.js"></script>
     <script src="js/sweetalert/lib/sweet-alert.min.js"></script>

	<script src="js/app/app.js"></script>
	<script src="js/app/UserService.js"></script>
	<script src="js/app/UserController.js"></script>
	<script src="js/app/AnGridService.js"></script>
	<script src="js/app/AnGridController.js"></script>
	<script src="js/app/AngUsersGridController.js"></script>
	<script src="js/app/StateController.js"></script>




</body>

</html>
