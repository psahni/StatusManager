StatusApp.controller("CreateCtrl", function($scope, Status){
    var _responseData = '';
    $scope.status = {'today_plan': ''};
    $scope.submit = function(){
    	$scope.form.$setPristine(true);

        function setDirty(){
            angular.forEach(_responseData, function(value, key){
                $scope.form[key].$dirty = true;
                $scope.form[key].$error = value;
                $scope.form[key].$setValidity(key, false);
            });
        }

        function resetDirty(){
            if(_responseData == '') return ;
            angular.forEach(_responseData, function(value, key){
                $scope.form[key].$dirty = false;
                $scope.form[key].$error = [];
                $scope.form[key].$setValidity(key, true);
            });
        }


    	function onSuccess(){
    		//$scope.status_created = true;
    	}

    	function onError(response){
    		$scope.status_created = false;
            _responseData = response.data;
            setDirty();
    	}
        resetDirty();
        Status.save($scope.status, onSuccess, onError);
   }

    $scope.errorMessage = function(name){
      var errors = $scope.form[name].$error;
      console.log(errors);
      var result = [];
   	  angular.forEach(errors, function(value, key){
   	  	result.push(value);
   	  }); 	
     return result.join(", ");
    };
})