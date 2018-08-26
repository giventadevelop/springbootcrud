'use strict';

angular.module('crudApp').controller('UserController',
	[ 'UserService', '$scope','$timeout','SweetAlert', function(UserService, $scope,$timeout, SweetAlert) {

		$scope.formModel = {};
		$scope.submitting = false;
		$scope.submitted = false;
		$scope.has_error = false;
		$scope.username_has_error = false;
		$scope.username_availability_class = 'username_hide';

		$scope.onSubmit = function() {
			$scope.submitting = true;
			console.log("Hey i'm submitted!");
			console.log($scope.formModel);

			createUser($scope.formModel);

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

		// Set class
		$scope.addUserNameAvailabilityStatusClass = function(addUserNameAvailabilityStatus) {
			var userNameAvailable="User name available.";
			var userNameNotAvailable="User name not available.";
			
			if (addUserNameAvailabilityStatus) {
				/*if (addUserNameAvailabilityStatus == 'User name available.') {
					return 'usernamesearch_response username_exists';
				} else if (addUserNameAvailabilityStatus == "User name not available.") {
					return 'usernamesearch_response username_not_exists';
				}*/
				
				if (angular.equals(addUserNameAvailabilityStatus.errorMessage, userNameAvailable)) {
					//$scope.username_availability_class ='usernamesearch_response username_exists';
					//$scope.username_has_error = false;
					//$scope.registerUserForm.userName.$setValidity('userNameNotAvailable',true);
					$scope.registerUserForm.userName.$setValidity('userNameNotAvailable',null);
					$scope.registerUserForm.userName.$invalid=false;
					return 'usernamesearch_response username_exists';
					//return 'usernamesearch_response username_exists';
				} else if (angular.equals(addUserNameAvailabilityStatus.errorMessage, userNameNotAvailable)) {
					$scope.registerUserForm.userName.$setValidity('userNameNotAvailable',false);
					$scope.registerUserForm.userName.$invalid=true;
					
					$scope.username_has_error = true;
					//$scope.registerUserForm.userName.$valid = false;
					//$scope.username_availability_class ="usernamesearch_response username_not_exists";
					$scope.addUserNameAvailabilityStatus="";
					return 'usernamesearch_response username_not_exists';
				}

			} else {
				$scope.username_availability_class ="username_hide";
				return 'username_hide';
			}

		}


		$scope.userNameSearch = function() {
			
			if($scope.username_has_error){
				$scope.username_has_error = false;
			}else if($scope.registerUserForm.userName.$invalid){
				return;
			}
			
			SweetAlert.swal({ 
	    		 title: "Checking user name availabilty .. !",
	    		 text: "Please wait.. ",
	    		 showCancelButton: false,
	    		 showConfirmButton: false,
	    		 imageUrl: "images/balls_spinner.gif" }); 
	       
			
			var userName = $scope.formModel.userName;
			console.log('Searching userName availability');
			UserService.userNameSearch(userName)
				.then(
					function(response) {
						console.log('User Name searched successfully');
						$scope.username_availability_class ='usernamesearch_response username_exists';
						$scope.addUserNameAvailabilityStatus = UserService.getUserNameAvailabilityStatus();
						var addUserNameAvailabilityStatus=$scope.addUserNameAvailabilityStatus;
						$scope.addUserNameAvailabilityStatusClass(addUserNameAvailabilityStatus);
						 $timeout(function() {
					        	// SweetAlert.swal("close");
					        	//swal.showLoading();
					        	swal.close();
					        	//images/yeoman.png
					        	//text: " ",
					    		 //imageUrl: "images/yeoman.png" }); 
							}, 2000);
					},
					function(errResponse) {
						$scope.addUserNameAvailabilityStatus = UserService.getUserNameAvailabilityStatus();
						var addUserNameAvailabilityStatus=$scope.addUserNameAvailabilityStatus;
						$scope.addUserNameAvailabilityStatusClass(addUserNameAvailabilityStatus);
						console.error('error while doing userName search');
						
						$timeout(function() {
				        	// SweetAlert.swal("close");
				        	//swal.showLoading();
				        	swal.close();
				        	//images/yeoman.png
				        	//text: " ",
				    		 //imageUrl: "images/yeoman.png" }); 
						}, 2000);

					}
			);
		}


		var self = this;
		self.user = {};
		self.users = [];

		self.submit = submit;
		self.getAllUsers = getAllUsers;
		self.createUser = createUser;
		self.updateUser = updateUser;
		self.removeUser = removeUser;
		self.editUser = editUser;
		self.reset = reset;

		self.successMessage = '';
		self.errorMessage = '';
		self.done = false;

		self.onlyIntegers = /^\d+$/;
		self.onlyNumbers = /^\d+([,.]\d+)?$/;

		function submit() {
			console.log('Submitting');
			if (self.user.id === undefined || self.user.id === null) {
				console.log('Saving New User', self.user);
				createUser(self.user);
			} else {
				updateUser(self.user, self.user.id);
				console.log('User updated with id ', self.user.id);
			}
		}

		function createUser(user) {
			console.log('About to create user');
			
			SweetAlert.swal({ 
	    		 title: "Please wait while user details is saved !",
	    		 text: "Registering user.. ",
	    		 showCancelButton: false,
	    		 showConfirmButton: false,
	    		 imageUrl: "images/balls_spinner.gif" }); 
	       
			$timeout(function() {
				console.log('load spinner being dispalyed before create/registering user');
			}, 3000);
			
			UserService.createUser(user)
				.then(
					function(response) {
						console.log('User created successfully');
						window.location.href= '/register_user_success';
						self.successMessage = 'User created successfully';
						self.errorMessage = '';
						self.done = true;
						self.user = {};
					//    $scope.myForm.$setPristine();
						swal.close();
					},
					function(errResponse) {
						console.error('Error while creating User');
						self.errorMessage = 'Error while creating User: ' + errResponse.data.errorMessage;
						self.successMessage = '';
						swal.close();
					}
			);
		}


		function updateUser(user, id) {
			console.log('About to update user');
			UserService.updateUser(user, id)
				.then(
					function(response) {
						console.log('User updated successfully');
						self.successMessage = 'User updated successfully';
						self.errorMessage = '';
						self.done = true;
					//  $scope.myForm.$setPristine();
					},
					function(errResponse) {
						console.error('Error while updating User');
						self.errorMessage = 'Error while updating User ' + errResponse.data;
						self.successMessage = '';
					}
			);
		}


		function removeUser(id) {
			console.log('About to remove User with id ' + id);
			UserService.removeUser(id)
				.then(
					function() {
						console.log('User ' + id + ' removed successfully');
					},
					function(errResponse) {
						console.error('Error while removing user ' + id + ', Error :' + errResponse.data);
					}
			);
		}


		function getAllUsers() {
			return UserService.getAllUsers();
		}

		function editUser(id) {
			self.successMessage = '';
			self.errorMessage = '';
			UserService.getUser(id).then(
				function(user) {
					self.user = user;
				},
				function(errResponse) {
					console.error('Error while removing user ' + id + ', Error :' + errResponse.data);
				}
			);
		}
		function reset() {
			self.successMessage = '';
			self.errorMessage = '';
			self.user = {};
			$scope.myForm.$setPristine(); //reset Form
		}
	}


	]);