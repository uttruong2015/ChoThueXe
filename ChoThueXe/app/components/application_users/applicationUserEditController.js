(function (app) {
    'use strict';

    app.controller('applicationUserEditController', applicationUserEditController);

    applicationUserEditController.$inject = ['$scope', 'apiService', 'notificationService', '$location', '$stateParams'];

    function applicationUserEditController($scope, apiService, notificationService, $location, $stateParams) {
        $scope.account = {}
        $scope.BirthDay = "";
        $scope.updateAccount = updateAccount;

        function updateAccount() {
            var nhanvien = {};
            nhanvien.Manv = $scope.account.UserName;
            nhanvien.Hoten = $scope.account.FullName;
            nhanvien.Gioitinh = $scope.account.Gioitinh;
            nhanvien.Sodt = $scope.account.PhoneNumber;
            nhanvien.NamSinh = $scope.account.BirthDay;
            apiService.put('/api/applicationUser/update', $scope.account, editSuccessed, editFailed);
            if ($scope.account.UserName!='admin') {
                apiService.put('/api/nhanvien/update', nhanvien);
            }
        }
        function loadDetail() {
            apiService.get('/api/applicationUser/detail/' + $stateParams.id, null,
            function (result) {
                $scope.account = result.data;
                
            },
            function (result) {
                notificationService.displayError(result.data);
            });
        }

        function editSuccessed() {
            notificationService.displaySuccess($scope.account.FullName + ' đã được cập nhật thành công.');

            $location.url('application_users');
        }
        function editFailed(response) {
            notificationService.displayError(response.data.Message);
        }
        function loadGroups() {
            apiService.get('/api/applicationGroup/getlistall',
                null,
                function (response) {
                    $scope.groups = response.data;
                }, function (response) {
                    notificationService.displayError('Không tải được danh sách nhóm.');
                });

        }
        $('.yearpicker').yearpicker();

        loadGroups();
        loadDetail();
    }
})(angular.module('uStora.application_users'));