<div class="generic-container">
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="lead">User </span>
		</div>
		<div class="panel-body">

			About Page

			<div ng-controller="GridCtrl">
				<div ui-grid="{ data: myData }" class="myGrid"></div>
				 <ul uib-pagination total-items="bigTotalItems" ng-model="bigCurrentPage" max-size="maxSize" ng-change="pageChanged()" class="pagination-sm" boundary-links="true" force-ellipses="true"></ul>
			</div>

		</div>

	</div>