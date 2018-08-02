'use strict';

angular.module('crudApp').factory('AnGridService',
    ['$localStorage', '$http', '$q', 'urls','$location',
        function ($localStorage, $http, $q, urls,$location) {

            var grdfactory = {
                loadAllDogs: loadAllDogs,
                getAllDogs: getAllDogs,
                saveOrUpdateDog:saveOrUpdateDog,
                createNewDog:createNewDog,
                deleteDog:deleteDog
            };

            return grdfactory;
            
            var search=$location.search();
            var page=search.page||0;
            var size=search.size||10;

            function loadAllDogs(page,size) {
                console.log('Fetching all users');
                var deferred = $q.defer();
                $http.get(urls.DOGS_URI+'?page='+page+'&size='+size)
                    .then(
                        function (response) {
                            console.log('Fetched successfully all users');
                           // $localStorage.dogs = response.data._embedded.dogDTOList;
                            $localStorage.dogs = response.data;
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
            
            
            function createNewDog(dog) {
                console.log('Save Or Update Dog');
                var deferred = $q.defer();
                $http.post(urls.DOGS_URI, dog)
                    .then(
                        function (response) {
                           // loadAllUsers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                           console.error('Error while Creating New  Dog  ');
                           deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }
            
            function deleteDog(dog) {
                console.log('Delete dog rest call');
                var deferred = $q.defer();
                $http.delete(urls.DOGS_URI+'/'+dog.id)
                    .then(
                        function (response) {
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                           console.error('Error while deleting the dog  ');
                           deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }
            
            function saveOrUpdateDog(dog) {
                console.log('Save Or Update Dog');
                var deferred = $q.defer();
                $http.put(urls.DOGS_URI, dog)
                    .then(
                        function (response) {
                           // loadAllUsers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                           console.error('Error while Save Or Update Dog : ');
                           deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

        }
    ]);