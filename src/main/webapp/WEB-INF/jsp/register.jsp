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

<script>

/* window.onload = function() {
	  document.getElementById('userAvailable').style.display = 'none';
	}; */
</script>



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
		<div class="row clearfix">
			<div class="container main-content" ng-controller="UserController">
				<div
					class="col-xs-12 col-sm-12 col-md-8 col-lg-6  column col-sm-offset-0 col-md-offset-2 col-lg-offset-3">
					<form ng-submit="onSubmit()" novalidate="novalidate"
						ng-hide="submitted" name="registerUserForm"
						class="form-horizontal">
						<fieldset>

							<!-- The horizontal layout form from https://www.bootply.com/s2mmi1YyL4 -->

							<div class="form-group">

								<label class="col-md-2 control-label" for="firstName">First
									Name</label>
								<div class="col-md-4">
									<input type="text" ng-model="formModel.firstName"
										name="firstName" id="firstName" required="required" size="25"
										class="form-control input-md">
								</div>
								<!--  </div>-->

								<label class="col-md-2 control-label" for="lastName">Last
									Name</label>
								<div class="col-md-4">
									<input type="text" ng-model="formModel.lastName"
										name="lastName" id="lastName" required="required" size="25"
										class="form-control input-md">
								</div>

							</div>


							<div class="form-group" id="username_form_group"
								name="username_form_group"	>
<!-- ng-class="{ 'has-error' : username_has_error }" -->
								<label class="col-md-2 control-label" for="username">User
									Name</label>
								<div class="col-md-4">
									<input type="text" ng-model="formModel.userName"
										ng-pattern="/^[A-Za-z0-9_]{1,32}$/" ng-minlength="5"
										ng-pattern-err-type="badUsername" name="userName"
										id="userName" ng-blur="userNameSearch()"
										placeholder="User Name" required="required" size="16"
										class="form-control input-md">
								</div>

<!-- The below shows 'User name available.'  next to user name but commenetd since we  are not being able to show the message under the text filed instead appearing to the right
may fix later. -->

								<!-- <div id="userAvailable" class="{{username_availability_class}}"
									ng-cloak>{{ addUserNameAvailabilityStatus.errorMessage }}</div> -->

							</div>

							<!--  </div>-->
							<div class="form-group">
								<label for="password" class="col-md-2 control-label">Password</label>

								<div class="col-md-4">
									<input type="password" class="form-control"
										ng-model="formModel.password" id="password"
										required="required" ng-minlength="5"
										class="form-control input-md">
								</div>

								<label class="col-md-2 control-label" for="email">Email</label>
								<div class="col-md-4">
									<input type="email" ng-model="formModel.email" id="email"
										required="required" size="25" class="form-control input-md">
								</div>
								<!-- <div class="form-group">

									<div id="userAvailable" class="{{username_availability_class}}"
										ng-cloak>{{ addUserNameAvailabilityStatus.errorMessage
										}}</div>


								</div> -->

							</div>

							<div class="form-group">


								<label class="col-md-2 control-label" for="yearPassed">Year
									Passed</label>
								<div class="col-md-4">


									<select ng-model="formModel.yearPassed" name="yearPassed"
										id="yearPassed" required="required" class="selectpicker"
										data-dropup-auto="true" data-size="2">

										<option value="1965">1965</option>
										<option value="1966">1966</option>
										<option value="1967">1967</option>
										<option value="1968">1968</option>
										<option value="1969">1969</option>
										<option value="1970">1970</option>
										<option value="1971">1971</option>
										<option value="1972">1972</option>
										<option value="1973">1973</option>
										<option value="1974">1974</option>
										<option value="1975">1975</option>
										<option value="1976">1976</option>
										<option value="1977">1977</option>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990">1990</option>
										<option value="1991">1991</option>
										<option value="1992">1992</option>
										<option value="1993">1993</option>
										<option value="1994">1994</option>
										<option value="1995">1995</option>
										<option value="1996">1996</option>
										<option value="1997">1997</option>
										<option value="1998">1998</option>
										<option value="1999">1999</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
										<option value="2022">2022</option>


									</select>


								</div>
							</div>


							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">Address</h3>
								</div>
								<div class="panel-body">



									<div class="form-group">

										<label class="col-md-2 control-label" for="familyName">Family
											Name</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.familyName"
												name="familyName" id="familyName" size="25"
												class="form-control input-md">
										</div>
										<!--  </div>-->

										<label class="col-md-2 control-label" for="addressStreet">Street
											Address</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.addressStreet"
												name="addressStreet" id="addressStreet" size="25"
												class="form-control input-md">
										</div>

									</div>


									<div class="form-group">

										<label class="col-md-2 control-label" for="addressLineTwo">Address
											Line Two</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.addressLineTwo"
												name="addressLineTwo" id="addressLineTwo" size="25"
												class="form-control input-md">
										</div>
										<!--  </div>-->

										<label class="col-md-2 control-label" for="stateOrProvince">State
											Or Province</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.stateOrProvince"
												name="stateOrProvince" id="stateOrProvince" size="25"
												class="form-control input-md">
										</div>

									</div>

									<div class="form-group">

										<label class="col-md-2 control-label" for="city">City</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.city" name="city"
												id="city" size="25" class="form-control input-md">
										</div>
										<!--  </div>-->

										<label class="col-md-2 control-label" for="country">Country</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.country"
												name="country" id="country" size="25"
												class="form-control input-md">
										</div>

									</div>

									<div class="form-group">

										<label class="col-md-2 control-label" for="zipOrPinCode">Zip
											Or Pin Code</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.zipOrPinCode"
												name="zipOrPinCode" id="zipOrPinCode" size="25"
												class="form-control input-md">
										</div>
										<!--  </div>-->

										<label class="col-md-2 control-label" for="phoneNumber">Phone
											Number</label>
										<div class="col-md-4">
											<input type="text" ng-model="formModel.phoneNumber"
												name="phoneNumber" id="phoneNumber" size="25"
												ng-pattern="/^(\+?(\d{1}|\d{2}|\d{3})[- ]?)?\d{3}[- ]?\d{3}[- ]?\d{4}$/" ng-pattern-err-type="invalidPhoneNumber" 
												class="form-control input-md">
										</div>

									</div>







								</div>
							</div>


							<!-- <div class="form-group">
					<label for="firstName" class="control-label">First Name</label>
					 <input
						type="text" class="form-control" ng-model="formModel.firstName"
						name="firstName" id="firstName" required="required">
				</div>

				<div class="form-group">
					<label for="lastName" class="control-label">Last Name</label> <input
						type="text" class="form-control" ng-model="formModel.lastName"
						name="lastName" id="lastName" required="required">
				</div>
				 -->




							<!-- <div class="form-group">
					<label for="email" class="control-label">Email</label> <input
						type="email" class="form-control" ng-model="formModel.email"
						id="email" required="required">
				</div>

				<div class="form-group" id="username_form_group" name="username_form_group" ng-class="{ 'has-error' : username_has_error }">
					<label for="username" class="control-label">User Name</label> <input
						type="text" class="form-control" ng-model="formModel.userName"
						ng-pattern="/^[A-Za-z0-9_]{1,32}$/" ng-minlength="5"
						ng-pattern-err-type="badUsername" name="userName" id="userName"
						ng-blur="userNameSearch()"
						placeholder="User Name" required="required">
				</div>
 -->

							<!-- <div
					ng-class="addUserNameAvailabilityStatusClass(addUserNameAvailabilityStatus)">
					{{ addUserNameAvailabilityStatus.errorMessage }}</div> -->

							<!-- <div id="userAvailable" 
					class="{{username_availability_class}}"  ng-cloak>
					{{ addUserNameAvailabilityStatus.errorMessage }}</div> -->

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

							<!-- <div class="form-group">
								<label for="password" class="control-label">Password</label> <input
									type="password" class="form-control"
									ng-model="formModel.password" id="password" required="required"
									ng-minlength="5">
							</div>
 -->
							<div class="form-group">

								<!-- <div class="alert alert-danger text-center" ng-show="has_error">
				<h3>There was a problem registering, please try again later!</h3>
			</div> -->

								<button class="btn btn-primary" ladda="submitting"
									data-style="expand-right" type="submit">
									<!-- <span ng-show="submitting">Registering</span>  --><span
										ng-show="!submitting">Register</span>
								</button>
							</div>

						</fieldset>
					</form>

					<div class="alert alert-info text-center" ng-show="submitted">
						<h3>Thanks for Registering!</h3>
					</div>

				</div>
			</div>
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

	<!-- <script src="main.js"></script> -->



</body>

</html>
