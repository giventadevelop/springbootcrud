
'use strict';

angular.module('minmax').controller('MinMaxCtrl',
    ['RegisterUserService',
    	'jcs-autoValidate',
    	'angular-ladda',  function( RegisterUserService, $scope) {
    	
   


    	app.run(function (defaultErrorMessageResolver) {
		defaultErrorMessageResolver.getErrorMessages().then(function (errorMessages) {
			errorMessages['tooYoung'] = 'You must be at least {0} years old to use this site';
			errorMessages['tooOld'] = 'You must be max {0} years old to use this site';
			errorMessages['badUsername'] = 'Username can only contain numbers and letters and _';
		});
	}
);


	$scope.formModel = {};
	$scope.submitting = false;
	$scope.submitted = false;
	$scope.has_error = false;



	$scope.onSubmit = function () {
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
	 $scope.addUserNameAvailabilityStatusClass = function(addUserNameAvailabilityStatus){
	  if(addUserNameAvailabilityStatus == 'Available'){
	   return 'usernamesearch_response username_exists';
	  }else if(unamestatus == 'Not available'){
	   return 'usernamesearch_response username_not_exists';
	  }else{
	   return 'username_hide';
	  }
	  
	 }
	
	 
	 function userNameSearch(userName) {
	        console.log('Searching userName availability');
	        RegisterUserService.userNameSearch(userName)
	            .then(
	                function (response) {
	                    console.log('userName searched successfully');
	                    $scope.addUserNameAvailabilityStatus=RegisterUserService.getUserNameAvailabilityStatus();
	                },
	                function (errResponse) {
	                    console.error('error while doing userName search');
	                   
	                }
	            );
	    }
	
	 
	 
	function createUser(user) {
        console.log('About to create user');
        RegisterUserService.createUser(user)
            .then(
                function (response) {
                    console.log('User created successfully');
                    /* self.successMessage = 'User created successfully';
                    self.errorMessage='';
                    self.done = true;
                    self.user={};
                    $scope.myForm.$setPristine();*/
                },
                function (errResponse) {
                    console.error('Error while creating User');
                   /* self.errorMessage = 'Error while creating User: ' + errResponse.data.errorMessage;
                    self.successMessage='';*/
                }
            );
    }
	
	
	
}]);