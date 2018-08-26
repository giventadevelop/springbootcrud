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






     <!-- <div layout="row" layout-sm="column" layout-align="space-around"> -->
     <div ng-show="loader_spinner_activated">
       <md-progress-linear  class="md-warn" md-mode="indeterminate"></md-progress-linear> 
       </div>
      
    <!--  <div layout-align="space-around">
      <md-progress-circular ng-disabled="!loader_spinner_activated" ></md-progress-circular>
    </div> -->
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="lead"> Page  with Grid </span>
		</div>
		<div class="panel-body">
		

					<div ng-controller="AnGridController as vm">
				<!-- <div ui-grid="{ data: dogs}" class="myGrid"></div> -->
				<div class="grid" ui-grid="vm.gridOptions" ui-grid-edit></div>
				<!-- <div class="myGrid" ui-grid="{ data: vm.gridOptions.data}" ui-grid-edit></div> -->
				<!-- <div class="myGrid" ui-grid="{vm.gridOptions.data}" ui-grid-edit></div> -->
			<!-- 	<div class="myGrid" ui-grid="vm.gridOptions.data" ui-grid-edit></div> -->
				 <ul uib-pagination total-items="totalElements" ng-model="currentPage" max-size="totalPages"  ng-change="pageChanged()" class="pagination-sm" 
				 boundary-links="true" boundary-link-numbers="true" items-per-page="10" force-ellipses="false" num-pages="totalPages"></ul>
				 
				 
				 <!--  <pre>Page: {{bigCurrentPage}} / {{numPages}}</pre> -->
				 
				 
				 <button ng-click="openCreateDogModal()">Create New Dog</button>
			</div>

		</div>

	</div>
	


	<!-- Bootstrap Core JavaScript -->
	<script src="bootstrap/js/bootstrap.min.js"></script>


	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>


	<script src="js/angular/angular.js"></script>
	<script src="js/angular-aria/angular-aria.js"></script>
	<script src="js/angular-animate/angular-animate.js"></script>
	<script src="js/angular-messages/angular-messages.js"></script>
	<script src="js/angular-sanitize/angular-sanitize.js"></script>
	<script src="js/angular-bootstrap/ui-bootstrap-tpls.js"></script>
	<script src="js/angular-material/angular-material.js"></script>

	<script src="js/localforage.min.js"></script>
	<script src="js/ngStorage.min.js"></script>
	<script src="js/angular-ui-grid/ui-grid.min.js"></script>

	<script src="js/app/app.js"></script>
	<script src="js/app/AnGridService.js"></script>
	<script src="js/app/AnGridController.js"></script>
	<script src="js/app/AngUsersGridController.js"></script>

</body>

</html>
