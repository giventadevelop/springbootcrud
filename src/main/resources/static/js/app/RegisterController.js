
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