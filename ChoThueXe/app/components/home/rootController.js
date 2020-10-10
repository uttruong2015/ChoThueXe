(function (app) {
    app.controller('rootController', rootController);
    rootController.$inject = ['$state', 'authData', 'loginService', '$scope', 'authenticationService'];

    function rootController($state, authData, loginService, $scope, authenticationService) {
        $scope.logOut = function () {
            loginService.logOut();
            $state.go('login');
        };
        $scope.authentication = authData.authenticationData;
        $scope.kiemtrarole = function (name) {
            var a;
            angular.forEach(authData.authenticationData.nameRoles, function (item) {
                if (item.Name == name) {
                    a = item.Name
                }
            });
            return a
        }
        $scope.sidebar = "/app/shared/views/sidebar.html";
    }
})(angular.module('uStora'));