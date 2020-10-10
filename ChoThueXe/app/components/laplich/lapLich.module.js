(function () {
    angular.module('uStora.laplich', ['uStora.common']).config(config);

    config.$inject = ['$stateProvider', '$urlRouterProvider'];

    function config($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('laplich', {
                url: "/laplich",
                parent: 'base',
                templateUrl: "/app/components/laplich/lapLichListView.html",
                controller: "lapLichListController"
            })
            .state('add_laplich', {
                url: "/add_laplich",
                parent: 'base',
                templateUrl: "/app/components/laplich/lapLichAddView.html",
                controller: "lapLichAddController"
            })
            .state('edit_laplich', {
                url: "/edit_laplich/:id,:Sttxe,:Ngaysd,:Tugio",
                parent: 'base',
                templateUrl: "/app/components/laplich/lapLichEditView.html",
                controller: "lapLichEditController"
            });
    }
})();