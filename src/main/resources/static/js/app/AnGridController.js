'use strict';

angular.module('crudApp').controller('AnGridController',
    ['AnGridService', '$scope','$uibModal',  function( AnGridService, $scope, $uibModal) {
    	
    	 var vm = this;
    	/* vm.gridOptions = {
    			    columnDefs: [
    			      { field: 'id', name: '', cellTemplate: 'edit-button.html', width: 34 },
    			      { name: 'dogName' },
    			      { name: 'votes' },
    			      { name: 'dogPicture' },
    			      { name: 'dogPictureContentType' },
    			      { name: 'dogbreedId' },
    			    ]
    			  };*/
    	 
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
    	 
    	 
    	/* $scope.modalInstance = $uibModal.open({
    		 ariaLabelledBy: 'modal-title',
    		 ariaDescribedBy: 'modal-body',
    		 templateUrl: 'js/app/edit-modal.html',
    		 scope:$scope,
    		 controller :'AnGridController',
    		 controllerAs: '$ctrl',
    		 size: 'lg',
    		 resolve: {
    		 
    		 }
    		 });*/
    	 
    	 vm.gridOptions = {
 			    columnDefs: [
 			      { name: 'id'},
 			      { name: 'dogName' },
 			      { name: 'votes' },
 			      {name: 'Edit', cellTemplate: '<button id="editBtn" type="button" class="btn btn-small btn-primary" ng-click="grid.appScope.edit(row.entity)" >Edit</button> &nbsp; <button id="deleteBtn" type="button" class="btn btn-small btn-danger" ng-click="grid.appScope.remove(row.entity)" >Remove</button>'},
 			    ]
 			  };

        /*var self = this;
        self.dog = {};
        self.dogs=[];
       */// $scope.dogs=AnGridService.getAllDogs();
    	 vm.gridOptions.data =AnGridService.getAllDogs();
        
        $scope.totalItems = 64;
     	$scope.currentPage = 4;

        /*self.getAllDogs = getAllDogs;
       
        self.successMessage = '';
        self.errorMessage = '';
        self.done = false;

        self.onlyIntegers = /^\d+$/;
        self.onlyNumbers = /^\d+([,.]\d+)?$/;
        
*/
     	
     	 $scope.edit = function(entity) {
     		 console.log("entity.votes");
     		console.log(entity.votes);
     		console.log(JSON.stringify(entity));
     		vm.rwIndex= vm.gridOptions.data.indexOf(entity);
     		console.log('rwIndex '+vm.rwIndex);
     	//	$scope.gridOptions.data[key].name == changed
     		 $scope.editRow=entity;
     	  //  alert("edit " + JSON.stringify(entity));
     		// console.log(JSON.stringify(entity));
     		$scope.openModal(entity);
     		// $scope.modalInstance();
     		
     	  }
     	  
     	  $scope.remove = function(entity) {
     	    alert("remote " + JSON.stringify(entity));
     	  }
     	  
     	  
     	  
     	  
     	 $scope.cancelModal = function(){
     		 console.log("cancelmodal");
     		// $uibModalInstance.dismiss('close');
     	//	$modalInstance.dismiss('close');
     		 //modalInstance.dismiss('close');
     		 $scope.modalInstance.close('close');
     		 }
     	 
     	 
     	 $scope.saveUpdateDog = function() {
     		 console.log('saving row');
     		console.log('saving votes');
     		 console.log(JSON.stringify($scope.editRow.votes));
     		// console.log(JSON.stringify($scope.editRow));
     		vm.gridOptions.data[vm.rwIndex]= $scope.editRow;
     		
     		 $scope.modalInstance.close('close');
     		// AnGridService.saveOrUpdateDog(dog); 
      	  }
     	 
     	
        function getAllDogs(){
        	return AnGridService.getAllDogs();
        }

    }

    ]);