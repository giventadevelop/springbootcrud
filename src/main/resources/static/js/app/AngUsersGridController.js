'use strict';

angular.module('crudApp').controller('AngUsersGridController',
	[ 'UserService', '$scope', '$q', '$rootScope', '$timeout', '$uibModal', '$state', 'SweetAlert', function(UserService, $scope, $q, $rootScope, $timeout, $uibModal, $state, SweetAlert) {

		var vm = this;
		var pageSize = 10;

		$rootScope.loader_spinner_activated = true;
		vm.dog = {};
		$scope.users = {};

		vm.gridOptions = {
			columnDefs : [
				
				
				{
					name : 'id',
					visible: false
				},
				{
					name : 'row #',
					cellTemplate: '<span>{{rowRenderIndex+1}}</span>',
				    width: '8%'
				},
				{
					name : 'firstName',
					width: '10%'
				},
				{
					name : 'lastName',
					width: '10%'
				},
				{
					name : 'userName',
					width: '10%'
				},
				{
					name : 'yearPassed',
					width: '10%'
				},
				{
					name : 'Edit',
					cellTemplate : '<button id="editBtn" type="button" class="btn btn-small btn-primary" ng-click="grid.appScope.viewUserDetails(row.entity)" >View Details</button> &nbsp; <button id="deleteBtn" type="button" class="btn btn-small btn-danger" ng-click="grid.appScope.remove(row.entity)" >Remove</button>'
				},
			]
		};


		
		$scope.openModal = function(row) {
			$scope.editRow = row;
			$scope.modalInstance = $uibModal.open({
				ariaLabelledBy : 'modal-title',
				ariaDescribedBy : 'modal-body',
				templateUrl : 'js/app/view_user_details.html',
				scope : $scope,
				controller : 'AngUsersGridController',
				controllerAs : '$ctrl',
				size : 'lg',
				resolve : {

				}
			});
		}

		
		function callLoadAllUsersOnPageLoad() {
			var pageNum = $scope.currentPage - 1;
			var promise = UserService.loadAllUsers(0,10);
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
			//var promise = UserService.loadAllUsers(pageNum, pageSize);
			var promise;
			var isSearch;
			if($scope.searchModel){
				isSearch=true;
			}
			
			
			if (isSearch) {
				var searchByField = $scope.searchModel.searchByField;
				var searchText = $scope.searchModel.searchText;
				promise = UserService.searchUsers(searchByField, searchText, pageNum, pageSize);
			} else {
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
			//vm.gridOptions.data = UserService.getAllUsers();
			$scope.users = vm.gridOptions.data;


			$scope.users_details = UserService.getAllUsers();
			vm.gridOptions.data = $scope.users_details._embedded.userDTOList;
			$scope.users = $scope.users_details._embedded.userDTOList;

			$scope.maxSize = 10;
			$scope.totalPages = $scope.users_details.page.totalPages;
			$scope.totalElements = $scope.users_details.page.totalElements;

			swal.close();
			$rootScope.loader_spinner_activated = false;
		});


		$scope.onSubmit = function() {
			$scope.submitting = true;
			//console.log($scope.formModel);
			var pageNum =0;
			var promise;
			var searchByField = $scope.searchModel.searchByField;
			var searchText = $scope.searchModel.searchText;

			if (!searchByField || !searchText) {
				$scope.searchUserErrors = true;
				$scope.searchErrorAlertMsg = 'Please enter both fields to search';
				return;
			}else {
				promise = UserService.searchUsers(searchByField, searchText, pageNum, pageSize);
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
		

			//$scope.searchUsers();
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

		$scope.viewUserDetails = function(entity) {
			console.log("entity.id");
			
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


		

		callLoadAllUsersOnPageLoad();

		/*$scope.users_details = UserService.getAllUsers();
		vm.gridOptions.data = $scope.users_details._embedded.userDTOList;
		$scope.users = $scope.users_details._embedded.userDTOList;
*/
		//$scope.maxSize = 10;
		/*$scope.maxSize = 10;
		$scope.totalPages = $scope.users_details.page.totalPages;
		$scope.totalElements = $scope.users_details.page.totalElements;
		$scope.bigTotalItems = $scope.totalElements;
		$scope.currentPage = 1 ;
		
		$rootScope.loader_spinner_activated = false;*/
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