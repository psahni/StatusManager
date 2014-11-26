var StatusApp = angular.module("StatusManager", ["ngRoute", "ngResource"]);

StatusApp.config(function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    $httpProvider.defaults.headers.post["Content-Type"] = "application/json";
});
