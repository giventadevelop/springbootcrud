'use strict';

angular.module('crudApp').controller('AnGridController',
    ['AnGridService', '$scope','$q', '$rootScope','$timeout','$uibModal',  function( AnGridService, $scope, $q, $rootScope,$timeout, $uibModal) {
    	
    	 var vm = this;
    	 
    	 $scope.openModal = function(row){
    		 $scope.editRow=row;
    		 $scope.modalInstance = $uibModal.open({
    		 ariaLabelledBy: 'modal-title',
    		 ariaDescribedBy: 'modal-body',
    		 templateUrl: 'js/app/edit-modal.html',
    		 scope:$scope,
    		 controller :'AnGridController',
    		 controllerAs: '$ctrl',
    		 size: 'lg',
    		 resolve: {
    		 
    		 }
    		 });
    	 }
    	 
    	 $scope.openCreateDogModal = function(){
    		 $scope.editRow={};
    		 $scope.modalInstance = $uibModal.open({
    		 ariaLabelledBy: 'modal-title',
    		 ariaDescribedBy: 'modal-body',
    		 templateUrl: 'js/app/create-dog-modal.html',
    		 scope:$scope,
    		 controller :'AnGridController',
    		 controllerAs: '$ctrl',
    		 size: 'lg',
    		 resolve: {
    		 
    		 }
    		 });
    	 }
    	 
    	 vm.dog = {};
    	 $scope.dogs = {};
    	 
    	 vm.gridOptions = {
 			    columnDefs: [
 			      { name: 'id'},
 			      { name: 'dogName' },
 			      { name: 'votes' },
 			      {name: 'Edit', cellTemplate: '<button id="editBtn" type="button" class="btn btn-small btn-primary" ng-click="grid.appScope.edit(row.entity)" >Edit</button> &nbsp; <button id="deleteBtn" type="button" class="btn btn-small btn-danger" ng-click="grid.appScope.remove(row.entity)" >Remove</button>'},
 			    ]
 			  };
    	 
    	 $rootScope.loader_spinner_activated=false;
    	 
    	vm.gridOptions.data =AnGridService.getAllDogs();
    	$scope.dogs= vm.gridOptions.data;
        
    	 $scope.maxSize = 10;
    	  $scope.bigTotalItems = 175;
    	  $scope.bigCurrentPage = 1;
    	  
    	  $scope.pageChanged = function() {
    		  $rootScope.loader_spinner_activated=true;
    		  $timeout(function () {
    			  callPagedData();
    			  $rootScope.loader_spinner_activated=false;
    			 },5000);
    		  
    		  console.log('Page changed to: ' + $scope.bigCurrentPage);
    		    		 
    		  };
    		  
    		  function callPagedData(){
    			  var pageNum=$scope.bigCurrentPage-1
    			  var promise =  AnGridService.loadAllDogs(pageNum,10);;
      		    promise.then(
      		      function(data) { 
      		        console.log('Promise Dog Data', data);
      		        $scope.data = data;
      		        $rootScope.$broadcast('newData', data);  
      		      },
      		      function(reason) { console.log('Error: ' + reason); }
      		    ); 
      		    
      		  $rootScope.loader_spinner_activated=true;
    		  }
    		  
    		  $scope.$on('newData', function (evt, args) {
    			  console.log('dataChanged', args);
    			  vm.gridOptions.data= AnGridService.getAllDogs();
    			  $scope.dogs= vm.gridOptions.data;
    			}); 
    		  

        /*self.getAllDogs = getAllDogs;
       
        self.successMessage = '';
        self.errorMessage = '';
        self.done = false;

        self.onlyIntegers = /^\d+$/;
        self.onlyNumbers = /^\d+([,.]\d+)?$/;
        
*/
     	
     	 $scope.createNewDog = function() {
     		console.log('Creating New Dog ');
     		console.log(JSON.stringify($scope.dogDetails));
     		$scope.dogDetails.dogPicture=  $scope.fileBytes;
      		vm.dog=$scope.dogDetails;
      		console.log(JSON.stringify($scope.dogDetails));
      		AnGridService.createNewDog(vm.dog);
      		console.log('Creating New Dog done');
     	  }
     	 
     	var fileReader = new FileReader();
     	
     	  $scope.imageIsLoaded = function(e){
              $scope.$apply(function() {
            	  var arrayBuffer = fileReader.result;
            	  var data = new Uint8Array(arrayBuffer);
            	  var base64 = bufferToBase64(data);
            	  console.log( 'base64 '+base64);
            	  $scope.fileBytes=base64;
        	      console.log(arrayBuffer.byteLength);
              });
          
           }
     	
     	 $scope.setUploadPicture = function(event) {
    		  var dogFileInput = event.target;
    		
    		fileReader.onload = $scope.imageIsLoaded;
    			
    		var fileBlob=  fileReader.readAsArrayBuffer(event.target.files[0]);
    		var data = new Uint8Array(fileBlob);
    		var base64 = bufferToBase64(data);

    		if ($scope.file) {
     		      $scope.message1 = $scope.file.name;
     		     console.log( $scope.message1); //this is an ArrayBuffer
     		    }
     	        }
     	 
     	function bufferToBase64(buf) {
     	    var binstr = Array.prototype.map.call(buf, function (ch) {
     	        return String.fromCharCode(ch);
     	    }).join('');
     	    return btoa(binstr);
     	}
 
     	 $scope.edit = function(entity) {
    		console.log("entity.votes");
     		console.log(entity.votes);
     		console.log(JSON.stringify(entity));
     		vm.rwIndex= vm.gridOptions.data.indexOf(entity);
     		console.log('rwIndex '+vm.rwIndex);
     		$scope.editRow=entity;
     		$scope.openModal(entity);
     	  }
     	  
     	  $scope.remove = function(entity) {
//     	    alert("remote " + JSON.stringify(entity));
      		console.log("Dog id to delete id "+entity.id);
      		vm.rwIndex= vm.gridOptions.data.indexOf(entity);
        	AnGridService.deleteDog(entity);
        	vm.gridOptions.data.splice(vm.rwIndex, 1);
     		//$scope.gridOptions.data.splice(index, 1);
     	  }
     	  
     	 $scope.cancelModal = function(){
     		 console.log("cancelmodal");
     		 $scope.modalInstance.close('close');
     		 }
     	 
     	 $scope.saveUpdateDog = function() {
     		 console.log('saving row');
     		console.log('saving votes');
     		 console.log(JSON.stringify($scope.editRow.votes));
     		// console.log(JSON.stringify($scope.editRow));
     		vm.gridOptions.data[vm.rwIndex]= $scope.editRow;
     		vm.dog=$scope.editRow;
     		 AnGridService.saveOrUpdateDog(vm.dog);
     		 console.log('saving dog row done');
      	  }
     	 
        function getAllDogs(){
        	return AnGridService.getAllDogs();
        }
    }

    ]).directive("fileinput", [function() {
        return {
            scope: {
              fileinput: "=",
              filepreview: "="
            },
            link: function(scope, element, attributes) {
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
        }]);