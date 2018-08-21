'use strict';

angular.module('crudApp').controller('HomeController',
	[ '$scope', '$q', '$rootScope', '$timeout', 'SweetAlert', function( $scope, $q, $rootScope, $timeout,SweetAlert) {

		var vm = this;
	    vm.alert = function(){
	    	
	       // SweetAlert.swal("I'm a fancy Alert"); //simple alert
	    	/*using AngularJS library known as angular-sweetalert  for loading spinner
	    	https://ciphertrick.com/2016/05/23/fancy-alert-confirm-box-angularjs/ 
	    	got the spinner gif to display loader from the url
	    	https://www.google.com/search?q=loading+image+gif&biw=1054&bih=906&tbm=isch&source=iu&ictx=1&fir=mYhLKUWWQI3WuM%253A%252CRLk3ThGHz7usyM%252C_&usg=AFrqEzcIR6LIauMQZJKCKA0oQ-LpS8z9Bw&sa=X&ved=2ahUKEwj7-obWgPLcAhWGdN8KHSqfDgEQ9QEwDHoECAMQHA#imgrc=mYhLKUWWQI3WuM:/
	    	SweetAlert.swal({ 
	    		 title: "Please wait while we save your details !",
	    		 text: "Registering user..",
	    		 imageUrl: "images/balls_spinner.gif" }); 
	        $timeout(function() {
	        	// SweetAlert.swal("close");
	        	//swal.showLoading();
	        	swal.close();
	        	//images/yeoman.png
	        	//text: " ",
	    		 //imageUrl: "images/yeoman.png" }); 
			}, 4000);
	       
	    }
	    vm.confirm = function(){
	        SweetAlert.swal({
	            title: "Are you sure?", //Bold text
	            text: "Your will not be able to recover this imaginary file!", //light text
	            type: "warning", //type -- adds appropiriate icon
	            showCancelButton: true, // displays cancel btton
	            confirmButtonColor: "#DD6B55",
	            confirmButtonText: "Yes, delete it!",
	            closeOnConfirm: false, //do not close popup after click on confirm, usefull when you want to display a subsequent popup
	            closeOnCancel: false
	        }, 
	        function(isConfirm){ //Function that triggers on user action.
	            if(isConfirm){
	                SweetAlert.swal("Deleted!");
	            } else {
	                SweetAlert.swal("Your file is safe!");
	            }
	        });
	    }
	}]);