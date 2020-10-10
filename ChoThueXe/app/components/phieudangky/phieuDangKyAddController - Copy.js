(function (app) {
    app.controller('phieuDangKyAddController', phieuDangKyAddController);
    phieuDangKyAddController.$inject = ['apiService', '$scope', 'notificationService','$state','commonService'];
    function phieuDangKyAddController(apiService, $scope, notificationService, $state, commonService) {
        $scope.productCategory = {
            Ngayghi: new Date(),
            Manv: $scope.authentication.userName
        }
        
        $scope.AddProductCategory = AddProductCategory;


        function ThemDangKyXe() {
            apiService.post('/api/dangkyxe/create', $scope.productCategory,
                function (result) {
                }, function (error) {
                    console.log(error);
                });
        }
        function AddProductCategory() {
            apiService.post('/api/phieudk/create', $scope.productCategory,
                function (result) {
                    ThemDangKyXe();
                    notificationService.displaySuccess('Đã thêm phiếu ' + $scope.productCategory.Sttphieu+' thành công');
                    $state.go('phieudangky');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Thêm không thành công');
                });
        }
        
       
         function layMaCuoiCung() {
             apiService.get('/api/phieudk/laymacuoicung', null,
                function (result) {
                    var str;
                    if (result.data != null) {
                        $scope.maCuoiCung = result.data;
                        str = "" + (parseInt($scope.maCuoiCung.Sttphieu) + 1);
                    }
                    else {str = "" + 1;}
                    const pad1 = "0000000000";
                    var ma = pad1.substring(0, pad1.length - str.length) + str;
                    $scope.productCategory.Sttphieu = ma;
                }, function () {
                    console.log('Không có dữ liệu!!!');
                });
        };

        function layTatCaKhach() {
             apiService.get('/api/khach/getall', null,
                 function (result) {
                     $scope.tatCaKhach = result.data;
                }, function () {
                    console.log('Không có dữ liệu!!!');
                });
        };
        function layTatCaXe() {
             apiService.get('/api/xe/getall', null,
                 function (result) {
                     $scope.tatCaXe = result.data;
                }, function () {
                    console.log('Không có dữ liệu!!!');
                });
        };

        layTatCaKhach();
        layTatCaXe();
        layMaCuoiCung();
    }
})(angular.module('uStora.phieudangky'));