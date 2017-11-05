'use strict';

angular.module('crudApp').controller('AnGridController',
	    ['AnGridService', '$scope','$log',  function(AnGridService,$scope,$log) {
	 
	  $scope.myData = [
	    {
	        "firstName": "Cox",
	        "lastName": "Carney",
	        "company": "Enormo",
	        "employed": true
	    },
	    {
	        "firstName": "Lorraine",
	        "lastName": "Wise",
	        "company": "Comveyer",
	        "employed": false
	    },
	    {
	        "firstName": "Nancy",
	        "lastName": "Waters",
	        "company": "Fuelton",
	        "employed": false
	    }
	];
	  
	  $scope.totalItems = 64;
	  $scope.currentPage = 4;

	  $scope.setPage = function (pageNo) {
	    $scope.currentPage = pageNo;
	  };
	  
	  
	  function getAllDogs(){
          return AnGridService.getAllDogs();
      }


	  $scope.pageChanged = function() {
	    $log.log('Page changed to: ' + $scope.bigCurrentPage);
	    console.log('Fetching all users');
        var deferred = $q.defer();
        $http.get(urls.USER_SERVICE_API)
            .then(
                function (response) {
                    console.log('Fetched successfully all users');
                    $localStorage.users = response.data;
                    deferred.resolve(response);
                },
                function (errResponse) {
                    console.error('Error while loading users');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
	  };

	  $scope.maxSize = 5;
	  $scope.bigTotalItems = 175;
	  $scope.bigCurrentPage = 1;  
	  
	  
	  
	  
	}]);