
<div ng-controller="AngUsersGridController as vm">
	<div class="alert alert-danger" ng-show="searchUserErrors">
		<strong>{{searchErrorAlertMsg}}</strong>
	</div>
	<!-- <div layout="row" layout-sm="column" layout-align="space-around"> -->
	<div ng-show="loader_spinner_activated">
		<md-progress-linear class="md-warn" md-mode="indeterminate"></md-progress-linear>
	</div>

	<!--  <div layout-align="space-around">
      <md-progress-circular ng-disabled="!loader_spinner_activated" ></md-progress-circular>
    </div> -->
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">


			<form  ng-submit="onSubmit()">
				<!-- <div class="input-group"> -->

					<table class="table">
						
						<tbody>
							<tr>
								
								<td> <div class="form-group">
										<input type="text" class="form-control" style="width: 170px;"
											ng-model="searchModel.searchText" required="required"
											ng-minlength="3" />
										
									</div> </td>
								<td> <button>Search User</button>  </td>
								
							</tr>
							
							<tr>
								
								<td> <div class="form-group">
										   <div>
										   <label for="searchOptions" class="control-label">Search
											By</label>
											</div>
											 <select id="searchOptions" class="form-control"
											ng-model="searchModel.searchByField" required="required">
											<option value="">Please Choose</option>
											<option value="firstName">First Name</option>
											<option value="lasttName">Last Name</option>
										</select>



									</div> </td>
								<td> <div class="alert alert-info">
  <strong>Info!</strong>You can search by First Name , Last Name and the Year Passed.
</div>
								</td>
								
							</tr>
							
							</tbody>
					</table>
					
					

							
									
								

								
									


								







							<!-- </div> -->
				
			</form>


		</div>

		<div class="panel-body">

			<div>
				<!-- <div ui-grid="{ data: dogs}" class="myGrid"></div> -->
				<div class="grid" ui-grid="vm.gridOptions" ui-grid-edit></div>
				<!-- <div class="myGrid" ui-grid="{ data: vm.gridOptions.data}" ui-grid-edit></div> -->
				<!-- <div class="myGrid" ui-grid="{vm.gridOptions.data}" ui-grid-edit></div> -->
				<!-- 	<div class="myGrid" ui-grid="vm.gridOptions.data" ui-grid-edit></div> -->
				<ul uib-pagination total-items="totalElements"
					ng-model="currentPage" max-size="totalPages"
					ng-change="pageChanged()" class="pagination-sm"
					boundary-links="true" boundary-link-numbers="true"
					items-per-page="10" force-ellipses="false" num-pages="totalPages"></ul>

				<pre>Page: {{bigCurrentPage}} / {{numPages}}</pre>

				<button ng-click="openCreateDogModal()">Create New User</button>
			</div>

		</div>

	</div>

</div>
