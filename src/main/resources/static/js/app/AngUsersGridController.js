'use strict';

angular.module('crudApp').controller('AngUsersGridController',
	[ 'UserService', '$scope', '$q', '$rootScope', '$timeout', '$uibModal','$state','SweetAlert', function(UserService, $scope, $q, $rootScope, $timeout, $uibModal,$state,SweetAlert ) {

		var vm = this;
		var pageSize=10;

		callLoadAllUsersOnPageLoad();
		
		$scope.openModal = function(row) {
			$scope.editRow = row;
			$scope.modalInstance = $uibModal.open({
				ariaLabelledBy : 'modal-title',
				ariaDescribedBy : 'modal-body',
				templateUrl : 'js/app/edit-modal.html',
				scope : $scope,
				controller : 'AngUsersGridController',
				controllerAs : '$ctrl',
				size : 'lg',
				resolve : {

				}
			});
		}

		$scope.openCreateNewUserModal = function() {
			$scope.editRow = {};
			$scope.modalInstance = $uibModal.open({
				ariaLabelledBy : 'modal-title',
				ariaDescribedBy : 'modal-body',
				templateUrl : 'js/app/create-dog-modal.html',
				scope : $scope,
				controller : 'AngUsersGridController',
				controllerAs : '$ctrl',
				size : 'lg',
				resolve : {

				}
			});
		}

		/*$state.transitionTo($state.current, $stateParams, {
		    reload: true,
		    inherit: false,
		    notify: true
		});*/
		
		
		$scope.reloadRoute = function() {
		   // $state.reload();
			$state.go('users_grid')
		};

		//Search Users 
		$scope.searchModel = {};
		$scope.searchUserErrors=false;

		$scope.searchUsers = function() {
			console.log($scope.searchModel);
			$rootScope.loader_spinner_activated = true;
			SweetAlert.swal({ 
	    		 title:  "Searching users ...",
	    		 text: "Please wait while users are searched",
	    		 showCancelButton: false,
	    		 showConfirmButton: false,
	    		 imageUrl: "images/balls_spinner.gif" }); 
			
			$timeout(function() {
				var searchByField = $scope.searchModel.searchByField;
				var searchText = $scope.searchModel.searchText;
				callSearchUsersService(searchByField, searchText);
				$rootScope.loader_spinner_activated = false;
			}, 4000);

			console.log('Page changed to: ' + $scope.bigCurrentPage);

		};
		
		
		function callLoadAllUsersOnPageLoad() {
			var pageNum = $scope.currentPage - 1;
			var promise = UserService.loadAllUsers(0,10);
			promise.then(
				function(data) {
					console.log('Promise Users Data', data);
					$scope.data = data;
					$rootScope.$broadcast('Users newData', data);
				},
				function(reason) {
					console.log('Error: ' + reason);
				}
			);

			$rootScope.loader_spinner_activated = true;
		}

		function callSearchUsersService(searchByField, searchText) {
			var pageNum = $scope.bigCurrentPage - 1
			var promise = UserService.searchUsers(searchByField, searchText);
			promise.then(
				function(data) {
					console.log('Promise search users data', data);
					$scope.data = data;
					$rootScope.$broadcast('newData', data);
				},
				function(reason) {
					console.log('Error: ' + reason);
				}
			);

			$rootScope.loader_spinner_activated = true;
		}



		vm.dog = {};
		$scope.users = {};

		vm.gridOptions = {
			columnDefs : [
				{
					name : 'id'
				},
				{
					name : 'firstName'
				},
				{
					name : 'lastName'
				},
				{
					name : 'userName'
				},
				{
					name : 'Edit',
					cellTemplate : '<button id="editBtn" type="button" class="btn btn-small btn-primary" ng-click="grid.appScope.edit(row.entity)" >Edit</button> &nbsp; <button id="deleteBtn" type="button" class="btn btn-small btn-danger" ng-click="grid.appScope.remove(row.entity)" >Remove</button>'
				},
			]
		};

		$rootScope.loader_spinner_activated = false;

		$scope.users_details = UserService.getAllUsers();
		vm.gridOptions.data = $scope.users_details._embedded.userDTOList;
		$scope.users = $scope.users_details._embedded.userDTOList;

		//$scope.maxSize = 10;
		$scope.maxSize = 10;
		$scope.totalPages = $scope.users_details.page.totalPages;
		$scope.totalElements = $scope.users_details.page.totalElements;
		$scope.bigTotalItems = $scope.totalElements;
		$scope.currentPage = 1 ;


		$scope.pageChanged = function() {
		$rootScope.loader_spinner_activated = true;
			
			$timeout(function() {
				callPagedData();
				$rootScope.loader_spinner_activated = false;
			}, 3000);

			console.log('Page changed to: ' + $scope.currentPage);

		};

		function callPagedData() {
			
			var pageNum = $scope.currentPage - 1;
			var promise= UserService.loadAllUsers(pageNum, pageSize);
			var searchByField = $scope.searchModel.searchByField;
			var searchText = $scope.searchModel.searchText;
			if($scope.searchModel.searchText){
				promise = UserService.searchUsers(searchByField,searchText,pageNum, pageSize);
			}else{
				promise = UserService.loadAllUsers(pageNum, pageSize);
			}
			
			
			promise.then(
				function(data) {
					console.log('Promise Users Data', data);
					$scope.data = data;
					$rootScope.$broadcast('newData', data);
				},
				function(reason) {
					console.log('Error: ' + reason);
				}
			);

			$rootScope.loader_spinner_activated = true;
		}

		$scope.$on('newData', function(evt, args) {
			console.log('dataChanged', args);
			vm.gridOptions.data = UserService.getAllUsers();
			$scope.users = vm.gridOptions.data;


			$scope.users_details = UserService.getAllUsers();
			vm.gridOptions.data = $scope.users_details._embedded.userDTOList;
			$scope.users = $scope.users_details._embedded.userDTOList;

			$scope.maxSize = 10;
			$scope.totalPages = $scope.users_details.page.totalPages;
			$scope.totalElements = $scope.users_details.page.totalElements;
			
			swal.close();

		});


		$scope.onSubmit = function () {
			$scope.submitting = true;
			//console.log($scope.formModel);
			
			var searchByField = $scope.searchModel.searchByField;
			var searchText = $scope.searchModel.searchText;
			
			if(!searchByField || !searchText) {
				$scope.searchUserErrors=true;
				$scope.searchErrorAlertMsg='Please enter both fields to search';
				return;
			}

			$scope.searchUsers();
			//createUser($scope.formModel);
			
			/*$http.post('https://minmax-server.herokuapp.com/register/', $scope.formModel).
				success(function (data) {
					console.log(":)");
					$scope.submitting = false;
					$scope.submitted = true;
					$scope.has_error = false;
				}).error(function(data) {
					console.log(":(");
					$scope.submitting = false;
					$scope.submitted = false;
					$scope.has_error = true;
				});*/

		};
		

		$scope.createNewDog = function() {
			console.log('Creating New Dog ');
			console.log(JSON.stringify($scope.dogDetails));
			$scope.dogDetails.dogPicture = $scope.fileBytes;
			vm.dog = $scope.dogDetails;
			console.log(JSON.stringify($scope.dogDetails));
			UserService.createNewDog(vm.dog);
			console.log('Creating New Dog done');
		}

		var fileReader = new FileReader();

		$scope.imageIsLoaded = function(e) {
			$scope.$apply(function() {
				var arrayBuffer = fileReader.result;
				var data = new Uint8Array(arrayBuffer);
				var base64 = bufferToBase64(data);
				console.log('base64 ' + base64);
				$scope.fileBytes = base64;
				console.log(arrayBuffer.byteLength);
			});

		}

		$scope.setUploadPicture = function(event) {
			var dogFileInput = event.target;

			fileReader.onload = $scope.imageIsLoaded;

			var fileBlob = fileReader.readAsArrayBuffer(event.target.files[0]);
			var data = new Uint8Array(fileBlob);
			var base64 = bufferToBase64(data);

			if ($scope.file) {
				$scope.message1 = $scope.file.name;
				console.log($scope.message1); //this is an ArrayBuffer
			}
		}

		function bufferToBase64(buf) {
			var binstr = Array.prototype.map.call(buf, function(ch) {
				return String.fromCharCode(ch);
			}).join('');
			return btoa(binstr);
		}

		$scope.edit = function(entity) {
			console.log("entity.votes");
			console.log(entity.votes);
			console.log(JSON.stringify(entity));
			vm.rwIndex = vm.gridOptions.data.indexOf(entity);
			console.log('rwIndex ' + vm.rwIndex);
			$scope.editRow = entity;
			$scope.openModal(entity);
		}

		$scope.remove = function(entity) {
			//     	    alert("remote " + JSON.stringify(entity));
			console.log("Dog id to delete id " + entity.id);
			vm.rwIndex = vm.gridOptions.data.indexOf(entity);
			UserService.deleteDog(entity);
			vm.gridOptions.data.splice(vm.rwIndex, 1);
		//$scope.gridOptions.data.splice(index, 1);
		}

		$scope.cancelModal = function() {
			console.log("cancelmodal");
			$scope.modalInstance.close('close');
		}

		$scope.saveUpdateDog = function() {
			console.log('saving row');
			console.log('saving votes');
			console.log(JSON.stringify($scope.editRow.votes));
			// console.log(JSON.stringify($scope.editRow));
			vm.gridOptions.data[vm.rwIndex] = $scope.editRow;
			vm.dog = $scope.editRow;
			UserService.saveOrUpdateDog(vm.dog);
			console.log('saving dog row done');
		}

		function getAllDogs() {
			return UserService.getAllDogs();
		}
	}

	]).directive("fileinput", [ function() {
	return {
		scope : {
			fileinput : "=",
			filepreview : "="
		},
		link : function(scope, element, attributes) {
			element.bind("change", function(changeEvent) {
				scope.fileinput = changeEvent.target.files[0];
				var reader = new FileReader();
				reader.onload = function(loadEvent) {
					scope.$apply(function() {
						scope.filepreview = loadEvent.target.result;
					});
				}
				reader.readAsDataURL(scope.fileinput);
			});
		}
	}
} ]);