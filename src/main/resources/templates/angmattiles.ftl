
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