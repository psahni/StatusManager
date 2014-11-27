StatusApp.controller("CreateCtrl", function($scope, Status){
    $scope.status = {'today_plan': ''};
    $scope.submit = function(){
    	$scope.form.$setPristine(true);

    	function onSuccess(){
    		//$scope.status_created = true;
    	}

    	function onError(response){
    		$scope.status_created = false;
    		angular.forEach(response.data, function(value, key){   			
    			$scope.form[key].$dirty = true;
    			$scope.form[key].$error = value;
    			$scope.form[key].$setValidity(key, false);
    		});
    	}
        Status.save($scope.status, onSuccess, onError);
   }

    $scope.errorMessage = function(name){
      var errors = $scope.form[name].$error;
      console.log(errors);
      result = [];
   	  angular.forEach(errors, function(value, key){
   	  	result.push(value);
   	  }); 	
     return result.join(", ");
    };
})