'use strict';
StatusApp.service('ResponseHandler', function(){

    this.setDirty = function(form, responseData){
        angular.forEach(responseData, function(value, key){
            form[key].$dirty = true;
            form[key].$error = value;
            form[key].$setValidity(key, false);
        });
    }


    this.resetDirty = function(form, responseData){
        if(responseData == '') return ;
        angular.forEach(responseData, function(value, key){
            form[key].$dirty = false;
            form[key].$error = [];
            form[key].$setValidity(key, true);
        });
    }

    this.OnSuccess = function(success){
        success.call();
    }

    this.OnError = function(form, errors){
        this.setDirty(form, errors);
    }

    this.displayError = function(errors){
        var result = [];
        angular.forEach(errors, function(value, key){
            result.push(value);
        });
        return result.join(", ");
    }
});