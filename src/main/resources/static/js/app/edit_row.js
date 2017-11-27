
angular.module('crudApp', ['ui.grid', 'ui.grid.edit','schemaForm'])

.constant('DogSchema', {
  type: 'object',
  properties: {
    id: { type: 'string', title: 'Id' },
    dogName: { type: 'string', title: 'Dog Name' },
    votes: { type: 'string', title: 'Votes' }
  }
})

.controller('AnGridController', AnGridController)
.controller('RowEditCtrl', RowEditCtrl)
.service('RowEditor', RowEditor)
.service('AnGridService', AnGridService)
;

AnGridController.$inject = ['AnGridService', 'RowEditor'];
function AnGridController ( AnGridService,RowEditor) {
  var vm = this;
  
  vm.editRow = RowEditor.editRow;
  
  vm.gridOptions = {
    columnDefs: [
      { field: 'id', name: '', cellTemplate: 'edit-button.html', width: 34 },
      { name: 'dogName' },
      { name: 'votes' },
    ]
  };
  
  $scope.dogs=AnGridService.getAllDogs();
  function getAllDogs(){
  	return AnGridService.getAllDogs();
  }
}

RowEditor.$inject = ['$rootScope', '$modal'];
function RowEditor($rootScope, $modal) {
  var service = {};
  service.editRow = editRow;
  
  function editRow(grid, row) {
    $modal.open({
      templateUrl: 'edit-modal.html',
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


function RowEditCtrl($modalInstance, DogSchema, grid, row) {
  var vm = this;
  
  vm.schema = DogSchema;
  vm.entity = angular.copy(row.entity);
  vm.form = [
    'name',
    'company',
    'phone',
    {
      'key': 'address.city',
      'title': 'City'
    },
  ];
  
  vm.save = save;
  
  function save() {
    // Copy row values over
    row.entity = angular.extend(row.entity, vm.entity);
    $modalInstance.close(row.entity);
  }
}

AnGridService.$inject = ['$localStorage', '$http', '$q', 'urls'];
function AnGridService($localStorage, $http, $q, urls) {
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
