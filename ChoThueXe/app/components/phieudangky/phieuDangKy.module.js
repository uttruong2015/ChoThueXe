(function () {
    angular.module('uStora.phieudangky', ['uStora.common']).config(config);

    config.$inject = ['$stateProvider', '$urlRouterProvider'];

    function config($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('phieudangky', {
                url: "/phieudangky",
                parent: 'base',
                templateUrl: "/app/components/phieudangky/phieuDangKyListView.html",
                controller: "phieuDangKyListController"
            })
            .state('add_phieudangky', {
                url: "/add_phieudangky",
                parent: 'base',
                templateUrl: "/app/components/phieudangky/phieuDangKyAddView.html",
                controller: "phieuDangKyAddController"
            })
            .state('edit_phieudangky', {
                url: "/edit_phieudangky/:id,:Sttxe,:Ngaysd,:Tugio",
                parent: 'base',
                templateUrl: "/app/components/phieudangky/phieuDangKyEditView.html",
                controller: "phieuDangKyEditController"
            });
    }
})();