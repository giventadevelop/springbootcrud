

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
				 <ul uib-pagination total-items="bigTotalItems" ng-model="bigCurrentPage" max-size="maxSize"  ng-change="pageChanged()" class="pagination-sm" 
				 boundary-links="true" boundary-link-numbers="true" items-per-page="4" force-ellipses="true" num-pages="numPages"></ul>
				 
				 
				  <pre>Page: {{bigCurrentPage}} / {{numPages}}</pre>
				 
				 
				 <button ng-click="openCreateDogModal()">Create New Dog</button>
			</div>

		</div>

	</div>
	
	