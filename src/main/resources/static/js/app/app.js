var app = angular.module('crudApp',['ui.router','ngStorage','ui.bootstrap','ngAria','ngAnimate','ngMaterial'
	,'ui.grid', 'ui.grid.edit','jcs-autoValidate','angular-ladda']);

app.constant('urls', {
    BASE: 'http://localhost:8080/SpringBootCRUDApp',
    USER_SERVICE_API : 'api/user/',
    USER_SEARCH_SERVICE_API : 'api/user/search/',
    DOGS_URI : 'api/dogs/'
});

app.run(function (defaultErrorMessageResolver) {
	defaultErrorMessageResolver.getErrorMessages().then(function (errorMessages) {
		/*errorMessages['tooYoung'] = 'You must be at least {0} years old to use this site';
		errorMessages['tooOld'] = 'You must be max {0} years old to use this site';*/
		errorMessages['badUsername'] = 'Username can only contain numbers and letters and _';
	});
}
);

app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {

         $stateProvider
            .state('home', {
            	name: 'home',
                url: '/',
                /*templateUrl: 'partials/list',
                controller:'UserController',
                controllerAs:'ctrl',
                resolve: {
                    users: function ($q, UserService) {
                        console.log('Load all users');
                        var deferred = $q.defer();
                        UserService.loadAllUsers().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }*/
            }).state('angtiles', {
            	name: 'angtiles',
                url: '/',
                templateUrl: 'partials/angmattiles',
                controller:'AnGridController',
                controllerAs:'angGridCtrl',
                resolve: {
                    dogs: function ($q, AnGridService) {
                        console.log('Load all dogs');
                        var deferred = $q.defer();
                       AnGridService.loadAllDogs(0,10).then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            }).state('uigrid', {
            	name: 'uigrid',
                url: '/',
                templateUrl: 'partials/uigrid',
                controller:'AnGridController',
                controllerAs:'angGridCtrl',
                resolve: {
                    dogs: function ($q, AnGridService) {
                        console.log('Load all dogs');
                        var deferred = $q.defer();
                       AnGridService.loadAllDogs(0,10).then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
               
            }).state('users_grid', {
            	
            	name: 'usersgrid',
                url: '/',
                templateUrl: 'partials/usersgrid',
                controller:'AngUsersGridController',
                controllerAs:'angUsersGridCtrl',
                resolve: {
                    users: function ($q, UserService) {
                        console.log('Loading all users in ui_router');
                        var deferred = $q.defer();
                        UserService.loadAllUsers(0,10).then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
               
            });
        $urlRouterProvider.otherwise('/');
    }]);

