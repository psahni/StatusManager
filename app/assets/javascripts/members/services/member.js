'use strict';
StatusApp.factory('Member', ['$resource', '$http', function($resource, $http){

      var Member = {};
      Member.create = function(member){
        console.log(member);
        var promise = $http.post('/team_members', member);
        return promise;
      };
    return Member;
}]);