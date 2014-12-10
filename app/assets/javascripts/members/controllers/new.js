StatusApp.controller("MemberCreateCtrl", function($scope, $location, $route, Member, ResponseHandler){

    $scope.member = {name: '', email: ''};

    $scope.addMember =  function(){
        var response = Member.create($scope.member);
        response.success(function(){
           ResponseHandler.OnSuccess(function(){
               ('#Modal').hide();
           });
        });
        response.error(function(data){
          ResponseHandler.OnError($scope.form, data);
        });
	};

    $scope.errorMessage = function(name){
        return ResponseHandler.displayError($scope.form[name].$error);
    };

});