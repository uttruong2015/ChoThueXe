(function (app) {
    'use strict';

    app.controller('applicationUserAddController', applicationUserAddController);

    applicationUserAddController.$inject = ['$scope', 'apiService', 'notificationService', '$location', 'commonService'];

    function applicationUserAddController($scope, apiService, notificationService, $location, commonService) {
        
        $scope.account = {
            Groups: []
        }
        $scope.addAccount = addAccount;

        function addAccount() {
            var nhanvien = {};
            nhanvien.Manv = $scope.account.UserName;
            nhanvien.Hoten = $scope.account.FullName;
            nhanvien.Gioitinh = $scope.account.Gioitinh;
            nhanvien.Sodt = $scope.account.PhoneNumber;
            nhanvien.NamSinh = $scope.account.BirthDay;
            
            apiService.post('/api/applicationUser/add', $scope.account, addSuccessed, addFailed);
            apiService.post('/api/nhanvien/create', nhanvien);

        }

        function addSuccessed() {
            notificationService.displaySuccess($scope.account.FullName + ' đã được thêm mới.');

            $location.url('application_users');
        }
        function addFailed(response) {
            notificationService.displayError(response.data.Message);
            notificationService.displayErrorValidation(response);
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
         function getallNhanVien() {
             apiService.get('/api/nhanvien/laymacuoicung',
                null,
                 function (response) {
                     var str;
                     if (response.data!=null) {
                         $scope.maNhanVienCuoiCung = response.data;
                          str = "" + (parseInt($scope.maNhanVienCuoiCung.Manv) + 1);
                     }
                     else {
                         str = ""+1;
                     }

                    const pad1 = "000";
                    var macoso = pad1.substring(0, pad1.length - str.length) + str;
                     $scope.account.UserName = macoso;

                }, function (response) {
                    notificationService.displayError('Không tải được danh sách nhóm.');
                });

        }
       

        $('.yearpicker').yearpicker();

        getallNhanVien();
        loadGroups();
    }
})(angular.module('uStora.application_users'));