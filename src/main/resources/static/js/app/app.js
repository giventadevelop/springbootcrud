var app = angular.module('crudApp',['ui.router','ngStorage','ui.bootstrap','ngAria','ngAnimate','ngMaterial'
	,'ui.grid', 'ui.grid.edit','jcs-autoValidate','angular-ladda','oitozero.ngSweetAlert']);

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
		errorMessages['badUsername'] = 'User name can only contain numbers and letters and _ .Also no space in between allowed';
		errorMessages['userNameNotAvailable'] = 'User name not available.';
		errorMessages['invalidPhoneNumber'] = 'Please enter a valid phone number.';
		
	});
}
);

app.run(['$rootScope', '$state', function($rootScope, $state) { $rootScope.$state = $state; }]);


app.config(['$stateProvider', '$urlRouterProvider','$httpProvider','$provide',
    function($stateProvider, $urlRouterProvider,$httpProvider, $provide) {

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
                      console.log('Load all dogs   for partials/uigrid templateUrl');
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
        $httpProvider.interceptors.push("sessionInjector");
        
        
       /* $provide.decorator('$state', function($delegate, $stateParams) {
            $delegate.forceReload = function() {
                return $delegate.go($delegate.current, $stateParams, {
                    reload: true,
                    inherit: false,
                    notify: true
                });
            };
            return $delegate;
        });*/
        
        
    }]);

/*$scope.reloadRoute = function() {
	   // $state.reload();
		$state.go('users_grid')
	};*/


app.factory("sessionInjector", ['$log', function($log){
    return {
        request: function(config) {return config;},
        response: function(response) {
            if (typeof response.data === "string" && response.data.indexOf("login") > -1) {
            	/*implementation of session expired for SPA pages from url
            	 /*code to catch the session time out for angjs ajax cals for ui_view partial views  which otherwise gets by passed
	 * this along with the code in StateController.js does the work
     https://stackoverflow.com/questions/22318070/spring-security-and-angular-javascript-redirect-to-login-page*/

            //	alert("Your session  has expired.");
            	//$window.location.href = '/session';
            	window.location.href= '/session';
                //location.reload();
            	console.log('after Your session  has expired alert ');
            }
            return response;
        }
    };
}]);

