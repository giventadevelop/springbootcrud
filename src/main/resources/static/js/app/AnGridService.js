'use strict';

angular.module('crudApp').factory('AnGridService',
    ['$localStorage', '$http', '$q', 'urls',
        function ($localStorage, $http, $q, urls) {

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

        }
    ]);