StatusApp.controller("MemberCreateCtrl", function($scope, $location, $route, Member){
    $scope.member = {name: '', email: ''};
	$scope.addMember =  function(){
        var response = Member.create($scope.member);
        response.success(function(){
           console.log("success");
        });
        response.error(function(){
          console.log("error");
        });
	}
});