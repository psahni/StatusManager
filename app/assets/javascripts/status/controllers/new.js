StatusApp.controller("CreateCtrl", function($scope, Status){
    $scope.status = {'today_plan': ''};
    $scope.submit = function(){
        Status.save($scope.status, function(){},function(){})
   }
})