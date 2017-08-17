var app = angular.module('crudApp',['ui.router','ngStorage','ui.bootstrap','ngAria','ngAnimate','ngMaterial','ui.grid']);

app.constant('urls', {
    BASE: 'http://localhost:8080/SpringBootCRUDApp',
    USER_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/api/user/',
    GET_DOGS_URI : 'api/dogs/'
});

app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {

        $stateProvider
            .state('home', {
            	name: 'home',
                url: '/',
                templateUrl: 'partials/list',
                controller:'UserController',
                controllerAs:'ctrl',
                resolve: {
                    users: function ($q, UserService) {
                        console.log('Load all users');
                        var deferred = $q.defer();
                        UserService.loadAllUsers().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            }).state('about', {
            	name: 'about',
                url: '/',
                templateUrl: 'partials/about',
                controller:'AnGridController',
                controllerAs:'angGridCtrl',
                resolve: {
                    dogs: function ($q, AnGridService) {
                        console.log('Load all dogs');
                        var deferred = $q.defer();
                       AnGridService.loadAllDogs().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
               
            });
        $urlRouterProvider.otherwise('/');
    }]);

