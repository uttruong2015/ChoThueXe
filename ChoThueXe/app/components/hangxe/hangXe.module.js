(function () {
    angular.module('uStora.hangxe', ['uStora.common']).config(config);

    config.$inject = ['$stateProvider', '$urlRouterProvider'];

    function config($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('hangxe', {
                url: "/hangxe",
                parent: 'base',
                templateUrl: "/app/components/hangxe/hangXeListView.html",
                controller: "hangXeListController"
            })
            .state('add_hangxe', {
                url: "/add_hangxe",
                parent: 'base',
                templateUrl: "/app/components/hangxe/hangXeAddView.html",
                controller: "hangXeAddController"
            })
            .state('edit_hangxe', {
                url: "/edit_hangxe/:id",
                parent: 'base',
                templateUrl: "/app/components/hangxe/hangXeEditView.html",
                controller: "hangXeEditController"
            });
    }
})();