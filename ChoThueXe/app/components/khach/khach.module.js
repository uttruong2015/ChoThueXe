(function () {
    angular.module('uStora.khach', ['uStora.common']).config(config);

    config.$inject = ['$stateProvider', '$urlRouterProvider'];

    function config($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('khach', {
                url: "/khach",
                parent: 'base',
                templateUrl: "/app/components/khach/khachListView.html",
                controller: "khachListController"
            })
            .state('add_khach', {
                url: "/add_khach",
                parent: 'base',
                templateUrl: "/app/components/khach/khachAddView.html",
                controller: "khachAddController"
            })
            .state('edit_khach', {
                url: "/edit_khach/:id",
                parent: 'base',
                templateUrl: "/app/components/khach/khachEditView.html",
                controller: "khachEditController"
            });
    }
})();