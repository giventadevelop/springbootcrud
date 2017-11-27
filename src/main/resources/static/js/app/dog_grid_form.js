// Code goes here

angular.module('crudApp')

.constant('DogSchema', {
	  type: 'object',
	  properties: {
	    id: { type: 'string', title: 'Id' },
	    dogName: { type: 'string', title: 'Dog Name' },
	    votes: { type: 'string', title: 'Votes' }
	  }
	});

/*.controller('RowEditCtrl', RowEditCtrl);

function RowEditCtrl($modalInstance, DogSchema, grid, row) {
  var vm = this;
  
  vm.schema = DogSchema;
  vm.entity = angular.copy(row.entity);
  vm.form = [
	  'id',
	    'dogName',
	    'votes',
  ]; 
  
  vm.save = save;
  
  function save() {
    // Copy row values over
	  console.log('Save button called');
    row.entity = angular.extend(row.entity, vm.entity);
    $modalInstance.close(row.entity);
  }
}



{
    "id": 0,
    "guid": "de3db502-0a33-4e47-a0bb-35b6235503ca",
    "isActive": false,
    "balance": "$3,489.00",
    "picture": "http://placehold.it/32x32",
    "age": 30,
    "name": "Sandoval Mclean",
    "gender": "male",
    "company": "Zolavo",
    "email": "sandovalmclean@zolavo.com",
    "phone": "+1 (902) 569-2412",
    "address": {
        "street": 317,
        "city": "Blairstown",
        "state": "Maine",
        "zip": 390
    },
    "about": "Fugiat velit laboris sit est. Amet eu consectetur reprehenderit proident irure non. Adipisicing mollit veniam enim veniam
     officia anim proident excepteur deserunt consectetur aliquip et irure.
     Elit aliquip laborum qui elit consectetur sit proident adipisicing.\r\n",
    "registered": "1991-02-21T23:02:31+06:00",
    "friends": [
        {
            "id": 0,
            "name": "Rosanne Barrett"
        },
        {
            "id": 1,
            "name": "Nita Chase"
        },
        {
            "id": 2,
            "name": "Briggs Stark"
        }
    ]
}
    
*/