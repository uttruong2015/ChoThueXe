(function (app) {
    app.controller('khachAddController', khachAddController);
    khachAddController.$inject = ['apiService', '$scope', 'notificationService','$state','commonService'];
    function khachAddController(apiService, $scope, notificationService, $state, commonService) {
        $scope.productCategory = {
        }
        
        $scope.AddProductCategory = AddProductCategory;

        function AddProductCategory() {
            apiService.post('/api/khach/create', $scope.productCategory,
                function (result) {
                    notificationService.displaySuccess('Đã thêm khách hàng ' + $scope.productCategory.Hotenkhach+' thành công');
                    $state.go('khach');
                }, function (error) {
                    console.log(error);
                    notificationService.displayError('Thêm không thành công');
                });
        }

       
         function layMaKhachCuoiCung() {
             apiService.get('/api/khach/laymacuoicung', null,
                function (result) {
                    var str;
                    if (result.data != null) {
                        $scope.maCuoiCung = result.data;
                        str = "" + (parseInt($scope.maCuoiCung.Maso) + 1);
                    }
                    else {str = "" + 1;}
                    const pad1 = "00000";
                    var ma = pad1.substring(0, pad1.length - str.length) + str;
                    $scope.productCategory.Maso = ma;
                }, function () {
                    console.log('Không có dữ liệu!!!');
                });
        };

        
        layMaKhachCuoiCung();
    }
})(angular.module('uStora.khach'));