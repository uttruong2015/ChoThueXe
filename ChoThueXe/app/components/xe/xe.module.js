(function () {
    angular.module('uStora.xe', ['uStora.common']).config(config);

    config.$inject = ['$stateProvider', '$urlRouterProvider'];

    function config($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('xe', {
                url: "/xe",
                parent: 'base',
                templateUrl: "/app/components/xe/xeListView.html",
                controller: "xeListController"
            })
            .state('add_xe', {
                url: "/add_xe",
                parent: 'base',
                templateUrl: "/app/components/xe/xeAddView.html",
                controller: "xeAddController"
            })
            .state('edit_xe', {
                url: "/edit_xe/:id",
                parent: 'base',
                templateUrl: "/app/components/xe/xeEditView.html",
                controller: "xeEditController"
            });
    }
})();