var StatusApp = angular.module("StatusManager", ["ngRoute", "ngResource"]);

StatusApp.config(["$routeProvider", "$locationProvider", "$httpProvider", function($routeProvider, $locationProvider, $httpProvider) {
    $locationProvider.html5Mode(true);

    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    $httpProvider.defaults.headers.post["Content-Type"] = "application/json";
}]);
