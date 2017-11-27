'use strict';

angular.module('crudApp').factory('RowEditor',
    ['$rootScope', '$modal',
        function ($rootScope, $modal) {

            var grdfactory = {
                loadAllDogs: loadAllDogs,
                getAllDogs: getAllDogs
            };

            return grdfactory;

            function loadAllDogs() {
                console.log('Fetching all users');
                var deferred = $q.defer();
                $http.get(urls.GET_DOGS_URI)
                    .then(
                        function (response) {
                            console.log('Fetched successfully all users');
                            $localStorage.dogs = response.data._embedded.dogDTOList;
                            deferred.resolve(response);
                        },
                        function (errResponse) {
                            console.error('Error while loading users');
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function getAllDogs(){
                return $localStorage.dogs;
            }
            
            function RowEditor($rootScope, $modal) {
            	  var service = {};
            	  service.editRow = editRow;
            	  
            	  function editRow(grid, row) {
            	    $modal.open({
            	      templateUrl: 'js/app/edit-modal.html',
            	      controller: ['$modalInstance', 'DogSchema', 'grid', 'row', RowEditCtrl],
            	      controllerAs: 'vm',
            	      resolve: {
            	        grid: function () { return grid; },
            	        row: function () { return row; }
            	      }
            	    });
            	  }
            	  
            	  return service;
            	}
            
            
            

        }
    ]);