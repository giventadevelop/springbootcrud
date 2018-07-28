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
    

</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">Start Bootstrap</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
                    <li>
                        <a href="/">Home</a>
                    </li>
                     <li>
                        <a href="login">Login</a>
                    </li>
                     <li>
                        <a href="register">Register</a>
                    </li>
                    <li>
                        <a ui-sref=uigrid>UI Grid</a>
                    </li>
                    <li>
                        <a ui-sref="angtiles">Ang Tiles</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <header>
        <div class="container" id="maincontent" tabindex="-1">
           
        </div>
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
	
	<h6>Your session has expired. Login again or go to home page</h6>

	<div class="container">
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Sign In</div>
					<div
						style="float: right; font-size: 80%; position: relative; top: -10px">
						<a href="#">Forgot password?</a>
					</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<c:if test="${param.error != null}">
						<div id="login-alert" class="alert alert-danger col-sm-12">
							Your login attempt was not successful, try again.<br /> Caused :
							${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}

						</div>
					</c:if>
					<form id="login-form" class="form-horizontal" role="form"
						action="/login" method='POST'>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="login-username"
								type="text" class="form-control" name="username" value=""
								placeholder="username or email">
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="login-password"
								type="password" class="form-control" name="password"
								placeholder="password">
						</div>


						<div class="input-group">
							<div class="checkbox">
								<label> <input id="login-remember" type="checkbox"
									name="remember" value="1"> Remember me
								</label>
							</div>
						</div>


						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->

							<div class="col-sm-12 controls">
								<a id="btn-login" href="#" class="btn btn-success" type="submit"
									onclick="submit_form()">Login </a>
								<!--  <a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a> -->
								<a id="btn-fblogin" href="#" class="btn btn-primary"
									name="reset" type="reset" onclick="login_form_reset()">Reset</a>

							</div>
						</div>


						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Don't have an account! <a href="#"
										onClick="$('#loginbox').hide(); $('#signupbox').show()">
										Sign Up Here </a>
								</div>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>

		<a id="protected_page" href="/protectedpage" class="btn btn-primary">protectedpage</a>

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
	<script
		src="js/angular-auto-validate/dist/jcs-auto-validate.min.js"></script>
	<script src="js/ladda/dist/spin.min.js"></script>
	<script src="js/ladda/dist/ladda.min.js"></script>
	<script src="js/angular-ladda/dist/angular-ladda.min.js"></script>

	<script src="js/app/app.js"></script>
	<script src="js/app/UserService.js"></script>
	<script src="js/app/UserController.js"></script>
	<script src="js/app/AnGridService.js"></script>
	<script src="js/app/AnGridController.js"></script>


</body>

</html>
