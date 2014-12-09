'use strict';
StatusApp.service('ResponseHandler', function(){

    this.setDirty = function(responseData){
        angular.forEach(responseData, function(value, key){
            $scope.form[key].$dirty = true;
            $scope.form[key].$error = value;
            $scope.form[key].$setValidity(key, false);
        });
    }


    this.resetDirty = function(responseData){
        if(responseData == '') return ;
        angular.forEach(responseData, function(value, key){
            $scope.form[key].$dirty = false;
            $scope.form[key].$error = [];
            $scope.form[key].$setValidity(key, true);
        });
    }

    this.OnSuccess = function(){

    }

    this.OnError = function(){

    }
});