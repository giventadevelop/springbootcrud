<div class="generic-container">
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="lead"> About Page  with Grid </span>
		</div>
		<div class="panel-body">

			About Page  Test  12

			<div ng-controller="AnGridController as vm">
				<!-- <div ui-grid="{ data: dogs}" class="myGrid"></div> -->
				<div class="grid" ui-grid="vm.gridOptions" ui-grid-edit></div>
				<!-- <div class="myGrid" ui-grid="{ data: vm.gridOptions.data}" ui-grid-edit></div> -->
				<!-- <div class="myGrid" ui-grid="{vm.gridOptions.data}" ui-grid-edit></div> -->
			<!-- 	<div class="myGrid" ui-grid="vm.gridOptions.data" ui-grid-edit></div> -->
				 <ul uib-pagination total-items="bigTotalItems" ng-model="bigCurrentPage" max-size="maxSize" ng-change="pageChanged()" class="pagination-sm" boundary-links="true" force-ellipses="true"></ul>
				 <button ng-click="openModal()">Click Here to open Modal</button>
			</div>

		</div>

	</div>