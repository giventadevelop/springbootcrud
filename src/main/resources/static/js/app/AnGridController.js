'use strict';

angular.module('crudApp').controller('AnGridController',
    ['AnGridService', '$scope',  function( AnGridService, $scope) {

        var self = this;
        self.dog = {};
        self.dogs=[];
        $scope.dogs=AnGridService.getAllDogs();
        self.getAllDogs = getAllDogs;
       
        self.successMessage = '';
        self.errorMessage = '';
        self.done = false;

        self.onlyIntegers = /^\d+$/;
        self.onlyNumbers = /^\d+([,.]\d+)?$/;

        function getAllDogs(){
        	return AnGridService.getAllDogs();
        }

    }

    ]);