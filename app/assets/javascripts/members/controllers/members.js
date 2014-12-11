StatusApp.controller("MembersCtrl", function($scope, $location, $route, Member, ResponseHandler, $rootScope){

    $scope.member = {name: '', email: ''};
    $scope.team_members = $scope.team_members || [];
    //var m = {name: 'Prashant', email: 'prashant.sahni5@gmail.com'};


    $scope.addMember =  function(){
        var response = Member.create($scope.member);
        response.success(function(){
           ResponseHandler.OnSuccess(function(){
               $('#Modal').hide();
               console.log($scope.team_members);
               $scope.team_members.push($scope.member);
           });
        });
        response.error(function(data, status){
          if(parseInt(status) == 500) alert("Something went wrong on backend");
          ResponseHandler.OnError($scope.form, data);
        });
	};


   $scope.goToProfile = function(member){
        console.log(member);
        alert("Work on Progress!! Thanks for your patience");
   };

   $scope.errorMessage = function(name){
        return ResponseHandler.displayError($scope.form[name].$error);
   };

});