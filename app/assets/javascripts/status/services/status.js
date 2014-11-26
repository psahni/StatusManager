'use strict';
console.log(StatusApp);
StatusApp.factory('Status', function($resource){
    return $resource('/status/:id', {id: '@id'})
})