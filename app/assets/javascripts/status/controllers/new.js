StatusApp.controller("CreateCtrl", function($scope, $location,  $route, Status){
    var _responseData = '';
    $scope.status = $scope.status || {'today_plan': ''};
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


    	function onSuccess(response){
            console.log(response);
    		$scope.status_created = true;
            //$location.path(response.next_uri)
            //$route.reload();
            window.location.href = (window.location.origin  + response.next_uri);
    	}

    	function onError(response){
    		$scope.status_created = false;
            _responseData = response.data;
            setDirty();
    	}
        resetDirty();
        if($scope.status.oid){
           Status.update($scope.status, onSuccess, onError);
        }else
            Status.save($scope.status, onSuccess, onError);
   }

    $scope.errorMessage = function(name){
      var errors = $scope.form[name].$error;
      var result = [];
   	  angular.forEach(errors, function(value, key){
   	  	result.push(value);
   	  }); 	
     return result.join(", ");
    };
})