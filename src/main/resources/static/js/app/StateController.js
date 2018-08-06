'use strict';

angular.module('crudApp').controller('StateController',
	[ '$scope', '$rootScope', '$state', function($scope, $rootScope, $state) {

		/*code to catch the session time out for angjs ajax cals for ui_view partial views  which otherwise gets by passed
		 * this along with the factory app.factory("sessionInjector") code in app.js does the work
		 * good read   https://www.codemag.com/article/1505061/Easier-AngularJS-Routing-with-Angular-UI-Router
		 */

		$scope.reloadRoute = function(stateToLoad) {

			var stateCurrentName=$state.current.name;
			/*Check the root / name which is home declared in the state route app.js
			or if the state name has length greater than 3 usually names like uigrid etc..*/
			if (stateCurrentName == 'home' || stateToLoad.length > 3) {
				$state.go(stateToLoad);
			} else {
				$state.reload();
			}

		};


	} ]);