'use strict';

angular.module('crudApp').controller('MultiFileUploadController',
	[ 'UserService', '$scope', '$q', '$rootScope', '$timeout', '$uibModal', function(UserService, $scope, $q, $rootScope, $timeout, $uibModal) {
		 
	    $scope.uploadResult ="";
	     
	    $scope.myForm = {
	        description: "",
	        files: []
	    }
	 
	    $scope.doUploadFile = function() {  
	 
	        var url = "/rest/uploadMultiFiles";
	 
	 
	        var data = new FormData();
	 
	        data.append("description", $scope.myForm.description);
	        for (i = 0; i < $scope.myForm.files.length; i++) {
	            data.append("files", $scope.myForm.files[i]);
	        }
	 
	        var config = {
	            transformRequest: angular.identity,
	            transformResponse: angular.identity,
	            headers: {
	                'Content-Type': undefined
	            }
	        }
	        
	}

	]).directive('fileModel', ['$parse', function ($parse) {
	    return {
	        restrict: 'A',
	        link: function(scope, element, attrs) {
	           var model = $parse(attrs.fileModel);
	           var modelSetter = model.assign;
	            
	           element.bind('change', function(){
	              scope.$apply(function(){
	                 modelSetter(scope, element[0].files[0]);
	              });
	           });
	        }
	     };
	      
	 }]);